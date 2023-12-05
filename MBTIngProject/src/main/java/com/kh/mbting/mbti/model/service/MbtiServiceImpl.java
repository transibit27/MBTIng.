package com.kh.mbting.mbti.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mbting.mbti.model.dao.MbtiDao;
import com.kh.mbting.mbti.model.vo.Mbti;

@Service
public class MbtiServiceImpl implements MbtiService {

    @Autowired
    private SqlSession sqlSession;
    
    @Autowired
    private MbtiDao mbtiDao;

    @Override
    public int updateMbti(Mbti mbti) {
        return mbtiDao.updateMbti(sqlSession, mbti);
    }
}