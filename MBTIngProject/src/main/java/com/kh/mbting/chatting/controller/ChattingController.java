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
	
	@RequestMapping("chatting.do")
	public String chatting(Model model) {
		
		ArrayList<Chatting> chattingList = new ArrayList<>();
		
		chattingList = chattingService.chattingList();
		
		model.addAttribute("chattingList", chattingList);
		//System.out.println(chattingList);
		
		return "chatting/chattingView";
	}
	
	@RequestMapping("chatting.me")
	public void sendChatting(Chatting c) {
		System.out.println(c);
	}
}
