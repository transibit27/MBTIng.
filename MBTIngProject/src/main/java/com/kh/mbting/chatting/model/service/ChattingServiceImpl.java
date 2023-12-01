package com.kh.mbting.chatting.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mbting.chatting.model.dao.ChattingDao;
import com.kh.mbting.chatting.model.vo.Chatting;

@Service
public class ChattingServiceImpl implements ChattingService{

	
	@Autowired
	private ChattingDao chattingDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Chatting> chattingList(int roomNo) {
		return chattingDao.chattingList(sqlSession, roomNo);
	}

	@Override
	public int sendChatting(Chatting c) {
		return chattingDao.sendChatting(sqlSession, c);
	}

}
