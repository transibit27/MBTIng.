package com.kh.mbting.board.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Board {
	
	private int boardNo;			//	BOARD_NO	NUMBER
	private String boardTitle;		//	BOARD_TITLE	VARCHAR2(100 BYTE)
	private String boardContent;	//	BOARD_CONTENT	VARCHAR2(4000 BYTE)
	private int views;				//	VIEWS	NUMBER
	private Date enrollDate;		//	ENROLL_DATE	DATE
	private Date modifyDate;		//	MODIFY_DATE	DATE
	private String status;			//	STATUS	CHAR(1 BYTE)
	private String userNo;			//	USER_NO	NUMBER
	private int matchNo;			//	MATCH_NO	NUMBER

}
