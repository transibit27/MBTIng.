package com.kh.mbting.chatting.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mbting.chatting.model.vo.ChatRoom;

@Repository
public class ChattingDao {
	
	@Autowired
    SqlSessionTemplate sqlSession;

    public int createChat(ChatRoom room) {
        return sqlSession.insert("chatMapper.createChat", room);
    }

}
