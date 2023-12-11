package com.kh.mbting.chatting.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mbting.chatting.model.vo.ChatMessage;
import com.kh.mbting.chatting.model.vo.ChatRoom;
import com.kh.mbting.chatting.model.vo.SearchMember;
import com.kh.mbting.member.model.vo.Member;

@Repository
public class ChattingDao {
	
	@Autowired
    SqlSessionTemplate sqlSession;

    public int createChat(ChatRoom room) {
        return sqlSession.insert("chatMapper.createChat", room);
    }

    public ChatRoom searchChatRoom(ChatRoom room) {
        return sqlSession.selectOne("chatMapper.searchChatRoom", room);
    }
    
    public List<ChatRoom> chatRoomList(String userEmail) {
        return sqlSession.selectList("chatMapper.chatRoomList", userEmail);
    }
    
    public ChatRoom chatRoom(ChatRoom room) {
    	return sqlSession.selectOne("chatMapper.chatRoom", room);
    }
    
    public ChatRoom selectChatRoom(String roomNo) {
        return sqlSession.selectOne("chatMapper.selectChatRoom", roomNo);
    }
    
    public int insertMessage(ChatMessage chatMessage) {
        return sqlSession.insert("chatMapper.insertMessage", chatMessage);
    }
    
    public List<ChatMessage> messageList(String roomNo) {
        return sqlSession.selectList("chatMapper.messageList", roomNo);
    }
    
    public int updateCount(ChatMessage message) {
        return sqlSession.update("chatMapper.updateCount", message);
    }
    
    public Member masterInfo(String email) {
    	return sqlSession.selectOne("chatMapper.masterInfo" , email);
    }
    
    public ArrayList<Member> allMemberList(Member loginMember) {
    	return (ArrayList)sqlSession.selectList("chatMapper.allMemberList" , loginMember);
    }
    
    public ArrayList<Member> searchMember(SearchMember sm) {
    	return (ArrayList)sqlSession.selectList("chatMapper.searchMember" , sm);
    }
}

