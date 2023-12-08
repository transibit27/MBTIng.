package com.kh.mbting.pay.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mbting.pay.dao.KakaoPayDao;


@Service
public class KakaoPayService {
	
	@Autowired 
	private KakaoPayDao kakaoPayDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 카카오페이 결제 시도 시 결제 정보를 담을 테이블을 생성하는 용도의 메소드
	public int insertPay(String email) {
		return kakaoPayDao.insertPay(sqlSession, email);
	}
	// 카카오페이 결제 시도시 가맹점 주문번호를 DB에서 받아오는 용도의 메소드
	public int getPartnerOrder(String email) {
		return kakaoPayDao.getPartnerOrder(sqlSession, email);
	}
	
	
	
}