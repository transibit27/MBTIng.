package com.kh.mbting.member.model.service;

import java.util.HashMap;

import com.kh.mbting.member.model.vo.Member;

public interface MemberService {

	//회원 로그인을 처리해줄 method
	Member loginMember(Member m);
	
	//회원가입 후 정보를 DB로 입력해줄 method
	int insertMember(Member m);
	
	//kakao연결Token을 얻어오기 위한 method
	String getKakaoAccessToken(String code);
	
	//카카오 Token을 얻은 후, 유저의 정보를 가져올 method
	HashMap<String, Object> getUserInfo (String access_Token);
}

