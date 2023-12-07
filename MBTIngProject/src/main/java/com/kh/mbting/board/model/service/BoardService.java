package com.kh.mbting.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.mbting.board.model.vo.Board;
import com.kh.mbting.board.model.vo.BoardImg;
import com.kh.mbting.common.model.vo.PageInfo;

public interface BoardService {
	
	int selectListCount();
	
	ArrayList<Board> selectList(PageInfo pi);
	
	int insertBoard(Board b);
	
	int insertBoardImg(BoardImg bi);
	
	int increaseCount(int boardNo);
	
	Board selectBoard(int boardNo);

	ArrayList<BoardImg> selectBoardImg(int boardNo);

	int deleteBoard(int boardNo);
	
	ArrayList<Board> selectTopBoardList();

    int selectSearchListCount(HashMap<String, String> map);

    ArrayList<Board> selectSearchList(HashMap<String, String> map, PageInfo pi);
	
}
