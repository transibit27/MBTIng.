package com.kh.mbting.mbtiTest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.mbting.mbtiTest.model.service.MbtiTestService;

// 2023.11.26 김선아

@Controller
public class MbtiTestController {
	
	@Autowired	
	private MbtiTestService mbtiTestService; 
	
//	연애 테스트 클릭 시 테스트 화면으로 넘어가기 위한 메소드
	@RequestMapping("mbtiTest.mb")
	public String mbtiTest() {
		
		return "mbti/mbtiTest";
	}

}
