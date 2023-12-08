package com.kh.mbting.pay.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mbting.pay.vo.KakaoPay;

@Repository
public class KakaoPayDao {

	public int insertPay(SqlSessionTemplate sqlSession, KakaoPay kp) {
		return sqlSession.insert("kakaoPayMapper.insertPay", kp);
	}

	public String getPartnerOrder(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("kakaoPayMapper.getPartnerOrder", email);
	}

	public int insertPgToken(SqlSessionTemplate sqlSession, KakaoPay kp) {
		return sqlSession.update("kakaoPayMapper.insertPgToken", kp);
	}

	public int insertTid(SqlSessionTemplate sqlSession, KakaoPay kp) {
		return sqlSession.update("kakaoPayMapper.insertTid", kp);
	}



}
