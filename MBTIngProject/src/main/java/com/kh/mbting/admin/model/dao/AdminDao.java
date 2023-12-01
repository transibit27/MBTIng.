package com.kh.mbting.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.member.model.vo.Member;

@Repository
public class AdminDao {
	
	public int memberSelectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("memberMapper.memberSelectListCount");
	}
	
	public ArrayList<Member> memberSelectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.memberSelectList", null, rowBounds);
	}

}
