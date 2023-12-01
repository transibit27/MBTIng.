package com.kh.mbting.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.mbting.board.model.vo.Board;
import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.member.model.vo.Member;

public interface MemberService {

	//인기 회원을 불러오기 위한 method 
	ArrayList<Member> selecToptMemberList();
	
	//회원 로그인을 처리해줄 method
	Member loginMember(Member m);
	
	//회원가입 후 정보를 DB로 입력해줄 method
	int insertMember(Member m);
	
	//kakao연결Token을 얻어오기 위한 method
	String getKakaoAccessToken(String code);
	
	//카카오 Token을 얻은 후, 유저의 정보를 가져올 method
	HashMap<String, Object> getUserInfo (String access_Token);
	
	// 마이페이 회원정보 수정용 method
	int updateMember(Member m);

	// 내게 매칭을 신청한 대상자 수 확인 용 method
	int proposerCount(String userNo);
	
	// 내게 매칭을 신청한 대상자 리스트 확인 용 method
	ArrayList<Member> proposerList(String userNo);
	
	// 내 후기 게시글 숫자 확인용 method
	int selectListCount(String userNo);

	// 내 후기 게시글 조회용 method
	ArrayList<Board> selectList(PageInfo pi, String userNo);

	
}

