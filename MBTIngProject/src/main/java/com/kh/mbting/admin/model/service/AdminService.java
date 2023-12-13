package com.kh.mbting.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.mbting.admin.model.vo.Month;
import com.kh.mbting.board.model.vo.Board;
import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.matching.model.vo.Matching;
import com.kh.mbting.member.model.vo.Member;
import com.kh.mbting.notice.model.vo.Notice;
import com.kh.mbting.pay.vo.KakaoPay;

public interface AdminService {

	// 전체 회원 조회
    int selectTotalMembers();
	
    // 전체 커플매칭수 조회
    int selectTotalCouple();
    
    // 전체 결제금액 조회
    int selectTotalPay();
    
    // 전체 게시글 수 조회
    int selectTotalBoard();
    
    // 월별 회원가입 그래프
    ArrayList<Month> selectTotalMonthly();
    
    // 커플 매칭 상태 수락 그래프
    ArrayList<Matching> totalMatchingSuccess();
    
    // 커플 매칭 상태 거절 그래프
    ArrayList<Matching> totalMatchingRefusal();
    
    // 커플 매칭 상태 보류 그래프
    ArrayList<Matching> totalMatchingPending();
    
    // MBTI 성향 분포도
    ArrayList<Member> totalMbtiCount();
    
    // 남녀 성비 원그래프
    ArrayList<Member> totalGenderRate();
    
    // 매칭 성공률 원그래프
    ArrayList<Matching> totalMatchingRate();
    
    // 유료계정비율 원그래프totalFreeCount
    ArrayList<KakaoPay> totalPremiumCount();
    
    // 무료계정비율 원그래프
    ArrayList<KakaoPay> totalFreeCount();
    
    // 월별배출 그래프
    ArrayList<KakaoPay> totalMonthlySalesCount();
    
    // 년별매출 그래프
    ArrayList<KakaoPay> totalyearlySalesCount();
    
    /* 회원 관리 시작!!!!!!!!!!!!!!!!!! */
    
    // 회원 리스트 총 개수 조회
 	int memberSelectListCount();
 	
 	// 회원 리스트 조회
 	ArrayList<Member> memberSelectList(PageInfo pi);
 	
 	// 회원 검색 총 개수 조회
 	int memberSearchListCount(String keyword);
 	
	// 회원 검색 조회
    List<Member> memberSearchList(String keyword, int currentPage, int pageLimit, int boardLimit);
 	
    // 회원 상태 업데이트
    int updateStatus(String status, String userNo);

    // 선택된 회원 상태 일괄 업데이트
    int updateSelectedStatus(String status, List<String> selectedUserNos);
 	
 	// 상태에 따른 토글바 조회용 (보류)
 	Member getUserByEmail(String email);
     void updateUserStatus(String email, String newStatus);


     /* 매칭후기 관리 시작!!!!!!!!!!!!!!!!!! */
    
     // 매칭후기 게시글 총 개수 조회
 	int boardSelectListCount();

 	// 매칭후기 게시글 리스트 조회
 	ArrayList<Board> boardSelectList(PageInfo pi);
    
 	// 검색 게시글 개수 조회
 	int adminSearchListCount(String keyword);

	// 검색된 후기게시글 리스트 조회
    List<Board> adminSearchList(String keyword, int currentPage, int pageLimit, int boardLimit);

    
    
    
    
    
    
}
