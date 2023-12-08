package com.kh.mbting.pay.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class KakaoPayDao {

	public int insertPay(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.insert("kakaoPayMapper.insertPay", email);
	}

	public int getPartnerOrder(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("kakaoPayMapper.getPartnerOrder", email);
	}

}
