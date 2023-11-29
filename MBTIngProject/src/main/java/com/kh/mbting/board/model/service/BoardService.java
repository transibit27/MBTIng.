package com.kh.mbting.board.model.service;

import java.util.ArrayList;

import com.kh.mbting.board.model.vo.Board;
import com.kh.mbting.common.model.vo.PageInfo;

public interface BoardService {
	
	int selectListCount();
	
	ArrayList<Board> selectList(PageInfo pi);
	
	int insertBoard(Board b);
	
	int increaseCount(int boardNo);
	
	Board selectBoard(int boardNo);
	
	int deleteBoard(int boardNo);
	
	int updateBoard(Board b);
	
	ArrayList<Board> selectTopBoardList();
	
}
