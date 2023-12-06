package com.kh.mbting.member.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.mbting.board.model.vo.Board;
import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.common.template.Pagination;
import com.kh.mbting.member.model.service.MemberService;
import com.kh.mbting.member.model.vo.Member;



@Controller
public class MemberController {

	@Autowired	
	private MemberService memberService; 

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	
	//0. 전체 회원을 불러오기 위한 method 
	@ResponseBody
	@PostMapping("list.mem")
	public String selecToptMemberList() {
		
		ArrayList<Member> list = memberService.selecToptMemberList();
		
		return new Gson().toJson(list);
	}
	
	//1. 로그인 기능을 위한 method.
	@PostMapping("/login.me")
	public String loginMember(Member 		m, 
							  Model 		model,
							  HttpSession 	session) {
		
		//로그인한 회원의 정보를 담아서 service로 요청함
		Member loginMember = memberService.loginMember(m);
		
		if(loginMember != null && 
				bcryptPasswordEncoder.matches(m.getUserPwd(), loginMember.getUserPwd())){
						
			session.setAttribute("alertMsg", "로그인 성공");
			session.setAttribute("loginMember", loginMember);
			
			return "redirect:/";
			
		} else {
			 model.addAttribute("errorMsg" , "로그인에 실패했습니다.");
			 return "common/errorPage";
		}
	}
	
	
	//2. 로그아웃 기능을 위한 method
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	//3. 회원가입을 눌렀을 시에 회원가입 폼을 띄워주기 위한 method
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	
	//4. 회원가입에서 자신의 정보를 입력한 것에 대한 처리를 해줄 method
	@RequestMapping("insert.me")
	public String insertMember(Member m, HttpSession session,
								Model model) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		
		m.setUserPwd(encPwd);
		
		int result = memberService.insertMember(m);
		
		if(result>0) {
			
			session.setAttribute("alertMsg", "회원가입이 완료되었습니다.");
				
			return "redirect:/";
			
		} else {
			
			model.addAttribute("errorMsg", "회원가입에 실패했습니다.");
			
			return "common/errorPage";
		}
			
	}

	//5. 카카오 로그인을 시도했을 경우 실행될 method
	@GetMapping("/kakaoLog.me")
	public String kakaoCallback(@RequestParam String code,HttpSession session ) {
		
		String access_Token = memberService.getKakaoAccessToken(code);
								
		 HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token);
		
		 if (userInfo.get("email") != null) {
		       
		 session.setAttribute("access_Token", access_Token);
		 session.setAttribute("nickname", userInfo.get("nickname"));
		 session.setAttribute("profile",userInfo.get("profile_image"));
		 
		 }
		return "main";
	}
	
	//6. 마이페이지 진입용 method
	//a 마이페이지 - 메인
	@RequestMapping("myPage.me")
	public String myPage() {
		
		return "member/myMbting";
	}
	//b 마이페이지 - 프로필
	@RequestMapping("myProfile.me")
	public String myProfile() {
	
		return "member/myProfile";
	}
	
	//b-1 마이페이지 - 상단상태(매칭 신청자 수 확인용/ajax)
	@ResponseBody
	@RequestMapping(value="proposerCount.me", produces="text/html; charset=UTF-8")
	public String ajaxProposer(@RequestParam Map<String, Object> param) {
		
		String userNo = (String)param.get("userNo");
		
		String proposerNum = String.valueOf(memberService.proposerCount(userNo));
		return proposerNum;
		
	}
	
	//b-2 내게 매칭을 신청한 회원 리스트 조회용 메소드 (ajax)
	@ResponseBody
	@RequestMapping(value="proposerList.me", produces="application/json; charset=UTF-8")
	public String ajaxProposerList(@RequestParam Map<String, Object> param) {
		
		String userNo = (String)param.get("userNo");
		
		ArrayList<Member> list = memberService.proposerList(userNo);
				
		return new Gson().toJson(list);
	}
	
	//b-3 매칭 신청 수락용 메소드
	//매칭 신청을 수락하는 순간 자신의 MatchStat=3 으로 UPDATE (accepted) 메소드
	// proposerNo => 매칭 신청자의 userNo
	// receiverNo => 매칭 대상자의 userNo

	@RequestMapping	(value="accept.me")
	public String proposeAccept(@RequestParam String proposerNo,
								@RequestParam String receiverNo,
								 Model model,
							     HttpSession session) {
		
		// result1 : 매칭 신청자의 상태를 mastStat 값 update
		int result1 = memberService.proposeAccept(proposerNo);
		// result2 : 매칭 대상자의 상태를 mastStat 값 update
		int result2 = memberService.proposeAccepted(receiverNo);
		// result3 : 매칭 테이블의 match 상태를 Y 로 update(1:1 대화 시 조회 가능하도록)
		int result3 = 0;
		
			if(result1>0 && result2>0) {	// 수락 성공 시

				session.setAttribute("alertMsg", "매칭 수락 완료");
				
			return "redirect:/myPage.me";

			} else {
				
				model.addAttribute("errorMsg", "매칭 수락에 실패했습니다. 관리자한테 연락하세요.");
				
				return "common/errorPage";
			}
		
	}
	
	//b-4 내 상태 하단 메뉴 프로필 상태 표시용 메소드 (ajax)
	// 수정 중
	@ResponseBody
	@RequestMapping (value="myStat.me", produces="text/html; charset=UTF-8")
	public String myStatProfile(String userNo,
						HttpSession session) {
		
		Member me = memberService.myStatProfile(userNo);
		
		// 테스트용으로 정보 추출
		String result = me.getEmail();
		
		// 갱신된 내 정보를 loginMember에 담음
		session.setAttribute("loginMember", me);
		
		return result;
		
	}
	
	// b-5 내 대화 상대 정보 표시용 메소드(ajax)
	// 수정 중
	@ResponseBody
	@RequestMapping (value="myChat.me", produces="text/html; charset=UTF-8")
	public String myChat(String userNo,
						HttpSession session) {
		System.out.println("내 대화 상대 유저no"+userNo);
		Member me = memberService.myChat(userNo);
		System.out.println("내 대화 상대 맴버정보"+me);
		
		// 대화 상대의 정보를 ProposeMember 에 담음
		session.setAttribute("ProposeMember", me);
		
		// 테스트용으로 정보 받아옴
		String result = me.getEmail();
		return result;
	}
	
	
	//b-6 마이페이지 - 프로필(수정)
	
	@PostMapping("update.me")
	public String updateMember(Member m,
							   MultipartFile reupfile,
								Model model,
								HttpSession session){
		
		// 프로필 이미지 변경
		if(!reupfile.getOriginalFilename().equals("")) {
			
			// case1. 등록 프로필이 있을 경우
			if(m.getProfileImg() != null) {
				
				String realPath = session.getServletContext()
						.getRealPath(m.getProfileImg());
				
				
				new File(realPath).delete();
			}
			
			// case2. 등록 프로필 이미지가 없을 경우
			String changeName = saveFile(reupfile, session);
			
			// File 메소드에서 변경한 파일 이름으로 포르필 이미지 경로 등록
			m.setProfileImg("/resources/images/profile/" + changeName);
			
		}
				
		int result = memberService.updateMember(m);
		
		if(result > 0) {
			Member updateMem = memberService.loginMember(m);
			
			session.setAttribute("loginMember", updateMem);
			session.setAttribute("alertMsg", "정보 변경에 성공했습니다.");
			
			return "redirect:/myPage.me";
		} else {
			
			model.addAttribute("errorMsg", "회원정보 변경에 실패했습니다.");
			return "common/errorPage";
		}
		
	}
	
	//c 마이페이지 - 내후기
	@RequestMapping(value="myReview.me")
	public String myReview() {
		
		return "member/myReview";
	}
	
	//c-마이페이지 - 내후기 리스트 수 조회 
	@GetMapping(value="myList.me")
	public ModelAndView selectList(
			@RequestParam(value = "uno") String userNo,
			@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			ModelAndView mv) {
		
		int listCount = memberService.selectListCount(userNo);
		
		int pageLimit = 5;
		int boardLimit = 8;
		
		PageInfo pi = Pagination.getPageInfo(listCount, 
						currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> list = memberService.selectList(pi, userNo);
		
		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .setViewName("member/myReview");
	
		return mv;
	}
	
	// d 마이페이지 - 프로필 이미지 첨부용 메소드
	public String saveFile(MultipartFile upfile,
			   HttpSession session) {

		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss")
											.format(new Date());
		
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		// 업로드 하고자 하는 물리적인 경로 입력
		String savePath = session.getServletContext()
			.getRealPath("/resources/images/profile/");
		
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		}
	
	// e-1 마이페이지 - 내 결제 조회 + 결제 페이지 이동용 메소드
	@RequestMapping(value= "myPay.me")
	public String myPay() {
		return "member/myPay";
		
	}
	
	// e-2 마이페이지 - 결제
	@RequestMapping(value="pay.me", produces = "text/xml; charset=UTF-8")
	@ResponseBody
	public String kakaoPay(@RequestParam(value="email") String email) throws IOException{
		System.out.println("잘 전달되나?");
		System.out.println(email);
		
		String url="https://kapi.kakao.com/v1/payment/ready";
				
		// 카카오 페이와 통신하기 위한 주소 객체 생성
		URL requestUrl = new URL(url);
		
		// url 주소를 넘기면서 카카오 페이와 서버 연결
		HttpURLConnection urlConnection
		= (HttpURLConnection)requestUrl.openConnection();
		
		// 카카오페이 요청사항 처리
		// 1. POST 방식으로 연결
		urlConnection.setRequestMethod("POST");
		// 2. Authorization 키 넘기기
		urlConnection.setRequestProperty("Authorization", "KakaoAK 5202c0b22c8b4e8caf0ba17209825b7b");
		// 3. Content-type 넘기기
		urlConnection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		// 서버에게 전해줄 정보가 있을 경우 DoOutPut(true)를 넣어준다
		urlConnection.setDoOutput(true);
		
		String parameter = "cid=TC0ONETIME&"			// cid
				+ "partner_order_id=partner_order_id&"	// 가맹점 주문번호
				+ "partner_user_id=email&"	// 가맹점 회원 id
				+ "item_name=MBTIngCoin&"					// 상품명
				+ "quantity=1&"							// 상품 수량
				+ "total_amount=1000&"					// 상품 총액
				+ "tax_free_amount=0&"					// 비과세 금액
				+ "approval_url=http://localhost:8081/mbting/myPay.me&"  // 결제 성공시 리다이렉트 URL
				+ "cancel_url=http://localhost:8081/mbting/myPay.me&"		// 결제 취소시 리다이렉트 URL
				+ "fail_url=http://localhost:8081/mbting/myPay.me";		// 결제 실패시 리다이렉트 URL
		
		// 서버에 위의 값을 넘겨 줄 때 필요한 스트림 객체 생성
		OutputStream outputStream = urlConnection.getOutputStream();
		// 데이터를 넘기기 때문에 데이터 아웃풋 스트림이 추가로 필요
		DataOutputStream dataOutSteam = new DataOutputStream(outputStream);
		
		// writeBytes()는 
		// parameter에 담긴 값을 bytes 형식으로 형변환 한 뒤 데이터 아웃풋 스트림에게 넘겨줌
		dataOutSteam.writeBytes(parameter);
		dataOutSteam.close();	
		// close를 할때 flush() 가 함께 실행되어 들고 있던 parameter 값을 카카오에 넘김
		
		// 전송 결과 확인
		int result = urlConnection.getResponseCode();
	
		// 카카오 측으로 부터 정보를 받을 수 있도록 준비
		InputStream inputStream;
		
		// HTTP 코드에서 정상적인 통신은 200값을 가짐
		if(result == 200) {		// 성공 시
			inputStream = urlConnection.getInputStream();
		} else {	// 실패 시
			inputStream = urlConnection.getErrorStream();
		}
		
		// 받은 정보를 읽을 수 있는 객체 생성
		BufferedReader br 
		= new BufferedReader(
				new InputStreamReader(
						urlConnection.getInputStream()));
		
		JSONParser parser = new JSONParser();

	
		// System.out.println("리드라인"+br.readLine());
		String line;
		// line = br.readLine();
		// System.out.println("문자열"+line);		
		String responseText = "";
		
		
		while((line = br.readLine()) != null) {
			System.out.println("여기 왜 안들어올까?");
			
			responseText += line;
		}
		
		br.close();
		urlConnection.disconnect();
		
		System.out.println("이거 왜 안찎힘?"+responseText);
		
		// 응답데이터를 ajax 요청했던 곳으로 보내주고자 한다면
		// 굳이 ArrayList 로 내가 직접 파싱할 필요 없이
		// JSON 형태를 바로 보내주면 됨!!
		return responseText;
	}
}