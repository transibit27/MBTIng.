package com.kh.mbting.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mbting.admin.model.vo.Month;
import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.matching.model.vo.Matching;
import com.kh.mbting.member.model.vo.Member;
import com.kh.mbting.notice.model.vo.Notice;
import com.kh.mbting.pay.vo.KakaoPay;

@Repository
public class AdminDao {
	
	// 전체 회원 수 조회
	public int selectTotalMembers(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectTotalMembers");
	}
	
	// 전체 커플매칭 수 조회
	public int selectTotalCouple(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("memberMapper.selectTotalCouple");
	}
	
	// 전체 결제금액 조회
	public int selectTotalPay(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("kakaoPayMapper.selectTotalPay");
	}

	// 전체 후기게시글 수 조회
	public int selectTotalBoard(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("boardMapper.selectTotalBoard");
	}
	
	// 월별 회원 가입 그래프 
	public ArrayList<Month> selectTotalMonthly(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectTotalMonthly");
	}
	
	// 커플 매칭 상태 수락 그래프
	public ArrayList<Matching> totalMatchingSuccess(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.totalMatchingSuccess");
	}
	
	// 커플 매칭 상태 거절 그래프 totalMatchingRefusal
	public ArrayList<Matching> totalMatchingRefusal(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.totalMatchingRefusal");
	}
	
	// 커플 매칭 상태 보류 그래프
	public ArrayList<Matching> totalMatchingPending(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.totalMatchingPending");
	}
	
	// MBTI 성향 분포도
	public ArrayList<Member> totalMbtiCount(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.totalMbtiCount");
	}
	
	// 남녀성비 원그래프
	public ArrayList<Member> totalGenderRate(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.totalGenderRate");
	}
	
	// 매칭 성공률 원그래프
	public ArrayList<Matching> totalMatchingRate(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.totalMatchingRate");
	}
	
	// 유료계정비율 원그래프
	public ArrayList<KakaoPay> totalPremiumCount(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("kakaoPayMapper.totalPremiumCount");
	}
	
	// 무료계정비율 원그래프
	public ArrayList<KakaoPay> totalFreeCount(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("kakaoPayMapper.totalFreeCount");
	}
	
	// 월별매출 그래프
	public ArrayList<KakaoPay> totalMonthlySalesCount(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("kakaoPayMapper.totalMonthlySalesCount");
	}
	
	// 년별매출 그래프
	public ArrayList<KakaoPay> totalyearlySalesCount(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("kakaoPayMapper.totalyearlySalesCount");
	}
	
	public int memberSelectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("memberMapper.memberSelectListCount");
	}
	
	// 회원관리 전체조회
	public ArrayList<Member> memberSelectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.memberSelectList", null, rowBounds);
	}
	
	// 검색된 회원 수 조회
	public int memberSearchListCount(SqlSessionTemplate sqlSession, String keyword) {
      
		return sqlSession.selectOne("memberMapper.memberSearchListCount", keyword);
    }

	// 검색된 회원 리스트 조회
	public List<Member> memberSearchList(SqlSessionTemplate sqlSession, String keyword, int currentPage, int pageLimit, int boardLimit) {
	    int startRow = (currentPage - 1) * boardLimit;
	    int endRow = startRow + boardLimit;

	    Map<String, Object> parameters = new HashMap<>();
	    parameters.put("keyword", keyword);
	    parameters.put("startRow", startRow);
	    parameters.put("endRow", endRow);

	    return sqlSession.selectList("memberMapper.memberSearchList", parameters);
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
