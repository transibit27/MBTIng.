package com.kh.mbting.chatting.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mbting.chatting.model.dao.ChattingDao;
import com.kh.mbting.chatting.model.vo.ChatMessage;
import com.kh.mbting.chatting.model.vo.ChatRoom;
import com.kh.mbting.chatting.model.vo.SearchMember;
import com.kh.mbting.member.model.vo.Member;

@Service
public class ChattingServiceImpl implements ChattingService{

	
	@Autowired
	private ChattingDao chattingDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int createChat(ChatRoom room) {
		return chattingDao.createChat(room);
	}

	@Override
	public ChatRoom searchChatRoom(ChatRoom room) {
		return chattingDao.searchChatRoom(room);
	}

	@Override
	public List<ChatRoom> chatRoomList(String userEmail) {
		return chattingDao.chatRoomList(userEmail);
	}

	@Override
	public ChatRoom chatRoom(ChatRoom room) {
		return chattingDao.chatRoom(room);
	}

	@Override
	public ChatRoom selectChatRoom(String roomNo) {
		return chattingDao.selectChatRoom(roomNo);
	}

	@Override
	public int insertMessage(ChatMessage chatMessage) {
		return chattingDao.insertMessage(chatMessage);
	}

	@Override
	public List<ChatMessage> messageList(String roomNo) {
		return chattingDao.messageList(roomNo);
	}

	@Override
	public int updateCount(ChatMessage message) {
		return chattingDao.updateCount(message);
	}

	@Override
	public Member masterInfo(String email) {
		return chattingDao.masterInfo(email);
	}

	@Override
	public ArrayList<Member> allMemberList(Member loginMember) {
		return chattingDao.allMemberList(loginMember);
	}

	@Override
	public ArrayList<Member> searchMember(SearchMember sm) {
		return chattingDao.searchMember(sm);
	}

	
}
