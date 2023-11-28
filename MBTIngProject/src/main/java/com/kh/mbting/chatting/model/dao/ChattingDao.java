package com.kh.mbting.chatting.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.mbting.chatting.model.vo.Chatting;

@Repository
public class ChattingDao {
	
	public ArrayList<Chatting> chattingList(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("chattingMapper.chattingList");
	}
}
