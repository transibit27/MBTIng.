package com.kh.mbting.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mbting.member.model.vo.Member;


@Repository
public class MemberDao {

	public Member loginMember(SqlSession sqlSession , Member m ) {
	
		return sqlSession.selectOne("memberMapper.loginMember", m);
		
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int proposerList(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("memberMapper.proposerList", userNo);
	}
}

