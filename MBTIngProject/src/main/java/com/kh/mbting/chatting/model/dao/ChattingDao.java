package com.kh.mbting.chatting.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mbting.chatting.model.vo.ChatMessage;
import com.kh.mbting.chatting.model.vo.ChatRoom;

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
}
