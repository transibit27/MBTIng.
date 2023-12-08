package com.kh.mbting.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.member.model.vo.Member;

public interface AdminService {

	// 
	int memberSelectListCount();
	
	// 회원관리 게시글 리스트 조회
	ArrayList<Member> memberSelectList(PageInfo pi);
	
	// 상태에 따른 토글바 조회용 (보류)
	Member getUserByEmail(String email);
    void updateUserStatus(String email, String newStatus);

	// 선택된 회원 저장
    void updateSelectedUserStatus(List<Integer> selectedUserNos);

	// 전체회원 조회
    int selectTotalMembers(int userNo);
	
}
