package com.kh.mbting.mbti.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.mbting.mbti.model.service.MbtiService;

@Controller
public class MbtiController {
	
		
	@Autowired	
	private MbtiService mbtiService; 
	
//	연애 테스트 클릭 시 테스트 화면으로 넘어가기 위한 메소드
	@RequestMapping("mbtiTest.mb")
	public String mbtiTest() {
		
		return "mbti/mbtiTest";
	}
	
//	테스트 후 매칭 버튼 클릭 시 매칭 화면으로 넘어가기 위한 메소드
	@RequestMapping("mbtiMatch.mb")
	public String mbtiMatch() {
		
		return "mbti/mbtiMatch";
	}


	

}
