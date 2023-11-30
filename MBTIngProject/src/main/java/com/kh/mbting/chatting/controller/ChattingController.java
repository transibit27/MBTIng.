package com.kh.mbting.chatting.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.mbting.chatting.model.service.ChattingServiceImpl;
import com.kh.mbting.chatting.model.vo.Chatting;


@Controller
public class ChattingController {
	

	@Autowired
	private ChattingServiceImpl chattingService;
	private ArrayList<Chatting> chattingList;
	
	@RequestMapping("chatting.do")
	public String chatting(Model model) {
		
		chattingList = new ArrayList<>();
		
		chattingList = chattingService.chattingList();
		
		model.addAttribute("chattingList", chattingList);
		//System.out.println(chattingList);
		
		return "chatting/chattingView";
	}
	
	@RequestMapping("chatting.me")
	public String sendChatting(Chatting c , Model model) {
		
		
		int result = chattingService.sendChatting(c);
		//System.out.println(result);
		
		if(result > 0) {
			return "chatting/chattingView";
		}else {
			model.addAttribute("errorMsg", "채팅을 보내는 것에 실패했습니다.");
			return "common/errorPage";
		}
	}
}
