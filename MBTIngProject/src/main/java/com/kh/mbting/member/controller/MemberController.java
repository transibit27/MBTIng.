package com.kh.mbting.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.mbting.member.model.service.MemberService;
import com.kh.mbting.member.model.vo.Member;



@Controller
public class MemberController {

	@Autowired	
	private MemberService memberService; 

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	//1. 로그인 기능을 위한 method.
	@PostMapping("/login.me")
	public String loginMember(Member m, Model model, HttpSession session) {
		
		//로그인한 회원의 정보를 담아서 service로 요청함
		Member loginMember = memberService.loginMember(m);
		System.out.println(loginMember);
		
		if(loginMember == null) {
			//로그인 실패
			
			 model.addAttribute("errorMsg" , "로그인에 실패했습니다.");
			 return "common/errorPage";
			
		
		}else {
			
			//로그인을 성공했을 경우
			session.setAttribute("loginMember", loginMember);
			return "redirect:/";
		
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
	public void insertMember(Member m, HttpSession session) {
		
		Member loginMember = memberService.insertMember(m);
		
		session.setAttribute("loginMember", loginMember);
		
	}

	//5. 카카오 로그인을 시도했을 경우 실행될 method
	@GetMapping("/kakaoLog.me")
	public String kakaoCallback(@RequestParam String code,HttpSession session ) {
		
		String access_Token = memberService.getKakaoAccessToken(code);
								
		 HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token);
		 System.out.println("login Controller : " + userInfo);
		
		
		 if (userInfo.get("email") != null) {
		       
		 session.setAttribute("access_Token", access_Token);
		 session.setAttribute("nickname", userInfo.get("nickname"));
		 session.setAttribute("profile",userInfo.get("profile_image"));
		 
		 }
		return "main";
	}
	
	//6. 마이페이지 진입용 method

	@RequestMapping("myPage.me")
	public String myPage() {

		
		return "member/myPage";

	}

}

