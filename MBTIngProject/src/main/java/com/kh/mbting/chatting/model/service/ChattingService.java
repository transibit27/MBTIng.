package com.kh.mbting.chatting.model.service;

import java.util.ArrayList;

import com.kh.mbting.chatting.model.vo.Chatting;

public interface ChattingService {
	ArrayList<Chatting> chattingList(int roomNo);
	
	int sendChatting(Chatting c);
}
