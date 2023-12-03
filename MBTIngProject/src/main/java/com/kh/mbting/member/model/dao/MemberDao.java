package com.kh.mbting.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mbting.board.model.vo.Board;
import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.member.model.vo.Member;


@Repository
public class MemberDao {

	public ArrayList<Member> selectTopMemberList(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectTopMemberList");
	}
	
	public Member loginMember(SqlSession sqlSession , Member m ) {
	
		return sqlSession.selectOne("memberMapper.loginMember", m);
		
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int proposerCount(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("memberMapper.proposerCount", userNo);
	}
	
	public int proposeAccept(SqlSessionTemplate sqlSession, String proposerNo) {
		return sqlSession.update("memberMapper.proposeAccept", proposerNo);
	}
	public int proposeAccepted(SqlSessionTemplate sqlSession, String receiverNo) {
		return sqlSession.update("memberMapper.proposeAccepted", receiverNo);
	}
	
	public ArrayList<Member> proposerList(SqlSessionTemplate sqlSession, String userNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.proposerList", userNo);
	}

	public int selectListCount(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("memberMapper.selectListCount", userNo);
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String userNo) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("memberMapper.selectList", userNo, rowBounds);
	}

	public Member myStatProfile(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("memberMapper.myStatProfile", userNo);
	}

	public Member myChat(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("memberMapper.myChat", userNo);
	}


	

}

