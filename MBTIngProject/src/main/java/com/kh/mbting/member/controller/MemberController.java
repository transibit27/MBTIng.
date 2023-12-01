package com.kh.mbting.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	
	//b-3 매칭 신청 수락용 메소드 [ 이곳에 채팅 생성 메소드를 연결 필요 ]
	//매칭 신청을 수락하는 순간 자신의 MatchStat=3 으로 UPDATE (accepted) 메소드
	// proposerNo => 매칭 신청자의 userNo
	// receiverNo => 매칭 대상자의 userNo

	@RequestMapping	(value="accept.me")
	public String proposeAccept(@RequestParam String proposerNo,
								@RequestParam String receiverNo,
								 Model model,
							     HttpSession session) {
		
		int result1 = memberService.proposeAccept(proposerNo);
		int result2 = memberService.proposeAccepted(receiverNo);
		
			if(result1>0 && result2>0) {	// 수락 성공 시

				session.setAttribute("alertMsg", "매칭 수락 완료");
				
			return "redirect:/myPage.me";
			
			// 이 시점에 1:1 대화방 생성해줘야함
			// 1:1 대화 소켓 생성 시점
			
			} else {
				
				model.addAttribute("errorMsg", "매칭 수락에 실패했습니다. 관리자한테 연락하세요.");
				
				return "common/errorPage";
			}
		
	}
	
	//b-4 내 상태 하단 메뉴 표시용 메소드 (ajax)
	// 작성 중
	@ResponseBody
	@RequestMapping (value="myStat.me")
	public String myStat(String userNo,
						HttpSession session) {
		
		Member me = memberService.myStat(userNo);
		
		session.setAttribute("loginMember", me);
		
		return "redirect:/myPage.me";
		
	}

	
	
	//b-5 마이페이지 - 프로필(수정)
	@ResponseBody
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
}