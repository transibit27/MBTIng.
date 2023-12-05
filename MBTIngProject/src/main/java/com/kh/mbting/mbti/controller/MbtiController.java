package com.kh.mbting.mbti.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.mbting.mbti.model.service.MbtiService;
import com.kh.mbting.mbti.model.vo.Mbti;
import com.kh.mbting.member.model.vo.Member;

@Controller
public class MbtiController {
	
		
	@Autowired	
	private MbtiService mbtiService; 
	
//	연애 테스트 클릭 시 테스트 화면으로 넘어가기 위한 메소드
	@RequestMapping("mbtiTest.mb")
	public String mbtiTest() {
		
		return "mbti/mbtiTest";
	}
	
//	테스트 후 mbti를 자기 정보에 추가하려는 method
	@RequestMapping("updateMbti.mb")
	public String updateMbti(Mbti mbti, Model model) {

		int result = mbtiService.updateMbti(mbti);
		
		if(result > 0) {
			model.addAttribute("alertMsg", "성공적으로 내 mbti를 추가했습니다.");
			return "mbti/mbtiTest";
			
		} else {
			model.addAttribute("errorMsg", "내 mbti 추가를 실패했습니다.");
			return "redirect:/";
		}
	
	}
	
//	연애 테스트 클릭 시 테스트 화면으로 넘어가기 위한 메소드
	@RequestMapping("mbtiMatch.mb")
	public String mbtiMatch() {
		
		return "mbti/mbtiMatch";
	}
	
	


	

}
