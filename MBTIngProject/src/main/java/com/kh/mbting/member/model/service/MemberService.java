package com.kh.mbting.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.mbting.board.model.vo.Board;
import com.kh.mbting.chatting.model.vo.ChatMessage;
import com.kh.mbting.chatting.model.vo.ChatRoom;
import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.matching.model.vo.Matching;
import com.kh.mbting.member.model.vo.Member;
import com.kh.mbting.pay.vo.KakaoPay;

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
	
	// 마이페이지 - 회원정보 수정용 method
	int updateMember(Member m);
	// 마이페이지 - 내 비밀번호 수정용 method
	int updatePwd(Member m);

	// 내게 매칭을 신청한 대상자 수 확인 용 method
	int proposerCount(String userNo);
	
	// 내게 매칭을 신청한 대상자 리스트 확인 용 method
	ArrayList<Member> proposerList(String userNo);
	
	// 매칭 신청 수락용 method(신청자의 상태 변환)
	int proposeAccept(String proposerNo);
	// 매칭 신청 수락용 method(대상자의 상태 변환)
	int proposeAccepted(String receiverNo);
	// 매칭 신청이 수락되었을 때 해당 회원의 정보를 추출하는 method
	Member proposerInfo(String proposerNo);
	// 매칭 신청이 수락되었을 때 쳇룸 생성용 method
	int createChatroom(ChatRoom cr);
	// 매칭 신청 수락 후 첫 메세지(쳇봇) 생성용 method
	int createChatMessage(ChatMessage cm);
	// 1:1 대화 시작 시 매칭 테이블 의 매칭 상태를(3/매칭 진행) 업데이트용 method
	int matchingStrat(Matching mc);
	
	// 마이페이지 하단메뉴(내상태 - 프로필) 조회용 method
	Member myStatProfile(String userNo);
	
	// 내 후기 게시글 숫자 확인용 method
	int selectListCount(String userNo);

	// 내 후기 게시글 조회용 method
	ArrayList<Board> selectList(PageInfo pi, String userNo);

	// 마이페이지 - 내 대화 상대 조회용 method
	ArrayList<Member> myChat(String userNo);

	// 마이페이지 - 결제 내역 조회용 method
	ArrayList<KakaoPay> orderList(PageInfo pi, String userNo);

	// 회원가입 - 이메일 중복 검사용 method
	int checkEmail(Member m);







	
	
}

