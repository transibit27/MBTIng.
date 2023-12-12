package com.kh.mbting.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mbting.admin.model.dao.AdminDao;
import com.kh.mbting.admin.model.vo.Month;
import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.matching.model.vo.Matching;
import com.kh.mbting.member.model.vo.Member;

@Service
@EnableTransactionManagement
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int memberSelectListCount() {
		
		return adminDao.memberSelectListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> memberSelectList(PageInfo pi) {
	
		return adminDao.memberSelectList(sqlSession, pi);
	}

	// 상태에 따른 토글바 조회용 (보류)
	@Override
	public Member getUserByEmail(String email) {

		return adminDao.getUserByEmail(sqlSession, email);
	}
	@Override
	public void updateUserStatus(String email, String newStatus) {
		adminDao.updateUserStatus(sqlSession, email, newStatus);
		
	}

	// 선택된 회원 저장
	@Override
	public void updateSelectedUserStatus(List<Integer> selectedUserNos) {
	    
		adminDao.updateSelectedUserStatus(sqlSession, selectedUserNos);
	}
	
	// 전체 회원 수 조회
	@Override
	@Transactional
	public int selectTotalMembers() {

		return adminDao.selectTotalMembers(sqlSession);
	}
	
	// 전체 커플매칭 수 조회
	@Override
	@Transactional
	public int selectTotalCouple() {

		return adminDao.selectTotalCouple(sqlSession);
	}

	// 전체 결제금액 조회
	@Override
	@Transactional
	public int selectTotalPay() {
		
		return adminDao.selectTotalPay(sqlSession);
	}

	// 전체 후기게시글 수 조회
	@Override
	@Transactional
	public int selectTotalBoard() {
		
		return adminDao.selectTotalBoard(sqlSession);
	}

	// 월 별 회원가입 수 조회
	@Override
	public ArrayList<Month> selectTotalMonthly() {
		return adminDao.selectTotalMonthly(sqlSession);
	}

	// 커플 매칭 상태 수락 그래프
	@Override
	public ArrayList<Matching> TotalMatchingSuccess() {

		return adminDao.TotalMatchingSuccess(sqlSession);
	}

}
