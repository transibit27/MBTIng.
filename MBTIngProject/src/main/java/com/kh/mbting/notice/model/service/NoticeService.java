package com.kh.mbting.notice.model.service;

import java.util.ArrayList;

import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.notice.model.vo.Notice;

public interface NoticeService {
	
	// 공지사항 게시글 총 갯수 조회
	int selectListCount();

	// 공지사항 게시글 리스트 조회
	ArrayList<Notice> selectList(PageInfo pi);
}
