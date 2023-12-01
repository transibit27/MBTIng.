package com.kh.mbting.admin.model.service;

import java.util.ArrayList;

import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.member.model.vo.Member;

public interface AdminService {

	// 
	int memberSelectListCount();
	
	// 회원관리 게시글 리스트 조회
	ArrayList<Member> memberSelectList(PageInfo pi);
	
	
	
	
	
}
