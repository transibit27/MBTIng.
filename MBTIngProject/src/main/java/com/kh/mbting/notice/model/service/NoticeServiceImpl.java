package com.kh.mbting.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.notice.model.dao.NoticeDao;
import com.kh.mbting.notice.model.vo.Notice;

@Service
@EnableTransactionManagement
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		
		return noticeDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		
		return noticeDao.selectList(sqlSession, pi);
	}
	
	
	
	
	
	
	
	
}
