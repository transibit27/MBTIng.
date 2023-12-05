package com.kh.mbting.mbti.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.mbting.mbti.model.vo.Mbti;

@Repository
public class MbtiDao {

	public int updateMbti(SqlSession sqlSession, Mbti mbti) {
		
		return sqlSession.update("mbtiMapper.updateMbti", mbti);
	}

}
