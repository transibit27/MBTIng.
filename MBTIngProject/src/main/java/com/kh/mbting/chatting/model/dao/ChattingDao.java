package com.kh.mbting.chatting.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.mbting.chatting.model.vo.ChatMessage;
import com.kh.mbting.chatting.model.vo.ChatRoom;

@Repository
public class ChattingDao {

	 
	    public ChatRoom selectChatRoom(SqlSession sqlSession, String roomId) {
	        return sqlSession.selectOne("chatMapper.selectChatRoom", roomId);
	    }
	    
	    public int insertMessage(SqlSession sqlSession, ChatMessage chatMessage) {
	        return sqlSession.insert("chatMapper.insertMessage", chatMessage);
	    }
	    
	    public List<ChatMessage> messageList(SqlSession sqlSession, String roomId) {
	        return sqlSession.selectList("chatMapper.messageList", roomId);
	    }
	 
	    public int createChat(SqlSession sqlSession, ChatRoom room) {
	        return sqlSession.insert("chatMapper.createChat", room);
	    }
	 
	    public ChatRoom searchChatRoom(SqlSession sqlSession, ChatRoom room) {
	        return sqlSession.selectOne("chatMapper.searchChatRoom", room);
	    }
	 
	    public List<ChatRoom> chatRoomList(SqlSession sqlSession, String userEmail) {
	        return sqlSession.selectList("chatMapper.chatRoomList", userEmail);
	    }
	 
	    public int selectUnReadCount(SqlSession sqlSession, ChatMessage message) {
	        return sqlSession.selectOne("chatMapper.selectUnReadCount",message);
	    }
	 
	    public int updateCount(SqlSession sqlSession, ChatMessage message) {
	        return sqlSession.update("chatMapper.updateCount", message);
	    };
	 
}
