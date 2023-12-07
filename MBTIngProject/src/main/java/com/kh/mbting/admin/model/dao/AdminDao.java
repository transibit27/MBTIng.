package com.kh.mbting.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	// 상태에 따른 토글바 조회용 (보류)
	public Member getUserByEmail(SqlSessionTemplate sqlSession, String email) {
		
		return sqlSession.selectOne("memberMapper.getUserByEmail", email);
	}
	public void updateUserStatus(SqlSessionTemplate sqlSession, String email, String newStatus) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("email", email);
        parameters.put("newStatus", newStatus);

        sqlSession.update("memberMapper.updateUserStatus", parameters);
    }
	
	// 선택된 회원 저장
	public void updateSelectedUserStatus(SqlSessionTemplate sqlSession, List<Integer> selectedUserNos) {
		
		sqlSession.update("memberMapper.updateSelectedUserStatus");
	}
	
	// 전체회원 조회
	public int selectTotalMembers(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("memberMapper.selectTotalMembers", userNo);
	}

}
