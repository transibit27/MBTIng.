package com.kh.mbting.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mbting.admin.model.dao.AdminDao;
import com.kh.mbting.common.model.vo.PageInfo;
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

	@Override
	@Transactional
	public int selectTotalMembers(int userNo) {

		return adminDao.selectTotalMembers(sqlSession, userNo);
	}
	
	
}
