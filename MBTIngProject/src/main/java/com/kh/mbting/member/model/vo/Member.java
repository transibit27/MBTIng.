package com.kh.mbting.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor //기본 생성자
@Getter
@Setter
@ToString
public class Member {

	private String memberName;
	private String memberId;
	private String memberPwd;


	
	private String userNo;			//	USER_NO	NUMBER
	private String email; 			//	EMAIL	VARCHAR2(30 BYTE)
	private String userPwd;			//	USER_PWD	VARCHAR2(30 BYTE)
	private String profileImg;		//	PROFILE_IMG	VARCHAR2(100 BYTE)
	private String userName;		//	USER_NAME	VARCHAR2(30 BYTE)
	private int age;				//	AGE	NUMBER
	private String gender;			//	GENDER	CHAR(1 BYTE)
	private String phone;			//	PHONE	VARCHAR2(13 BYTE)
	private String mbti;			//	MBTI	VARCHAR2(4 BYTE)
	private String mbtieNick;		//	MBTI_NICK	VARCHAR2(30 BYTE)
	private String introduce;		//	INTRODUCE	VARCHAR2(1000 BYTE)
	private Date enrollDate;		//	ENROLL_DATE	DATE
	private Date modifyDate;		//	MODIFY_DATE	DATE
	private int matchStat;			//	MATCH_STAT	NUMBER
	private int matchCoin;			//	MATCH_COIN	NUMBER
	private String status;			//	STATUS	CHAR(1 BYTE)
	private int number;				//	ROOM_NO	NUMBER
	
}