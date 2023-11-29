package com.kh.mbting.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mbting.board.model.vo.Board;
import com.kh.mbting.common.model.vo.PageInfo;

@Repository
public class BoardDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<Board> selectTopBoardList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return null;
	}



}
