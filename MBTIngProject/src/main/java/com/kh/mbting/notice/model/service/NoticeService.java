package com.kh.mbting.notice.model.service;

import java.util.ArrayList;

import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.notice.model.vo.Notice;

public interface NoticeService {
	
	// 공지사항 게시글 총 갯수 조회
	int selectListCount();

	// 공지사항 게시글 리스트 조회
	ArrayList<Notice> selectList(PageInfo pi);
	
	// 공지사항 작성
	int insertNotice(Notice n);
	
	// 공지사항 조회수
	int increaseCount(int noticeNo);
	
	// 게시글 상세조회
	Notice selectNotice(int noticeNo);
	
	// 공지사항 삭제
	int deleteNotice(int noticeNo);
	
	// 공지사항 수정
	int updateNotice(Notice n);
	
	// 검색된 공지사항 개수 조회
	int searchListCount(String keyword);

	// 검색된 공지사항 리스트 조회
	ArrayList<Notice> searchList(String keyword, int currentPage, int pageLimit, int boardLimit);

	
}
