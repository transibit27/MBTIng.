package com.kh.mbting.chatting.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mbting.chatting.model.dao.ChattingDao;
import com.kh.mbting.chatting.model.vo.ChatMessage;
import com.kh.mbting.chatting.model.vo.ChatRoom;

@Service
public class ChattingServiceImpl implements ChattingService{

	
	@Autowired
	private ChattingDao chattingDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ChatRoom selectChatRoom(String roomId) {
		return chattingDao.selectChatRoom(sqlSession, roomId);
	}

	@Override
	public int insertMessage(ChatMessage chatMessage) {
		return chattingDao.insertMessage(sqlSession, chatMessage);
	}

	@Override
	public List<ChatMessage> messageList(String roomId) {
		return chattingDao.messageList(sqlSession, roomId);
	}

	@Override
	public int createChat(ChatRoom room) {
		return chattingDao.createChat(sqlSession, room);
	}

	@Override
	public ChatRoom searchChatRoom(ChatRoom room) {
		return chattingDao.searchChatRoom(sqlSession, room);
	}

	@Override
	public List<ChatRoom> chatRoomList(String userEmail) {
		return chattingDao.chatRoomList(sqlSession, userEmail);
	}

	@Override
	public int selectUnReadCount(ChatMessage message) {
		return chattingDao.selectUnReadCount(sqlSession, message);
	}

	@Override
	public int updateCount(ChatMessage message) {
		return chattingDao.updateCount(sqlSession, message);
	}
	
	
}
