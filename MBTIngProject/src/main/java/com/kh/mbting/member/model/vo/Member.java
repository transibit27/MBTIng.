package com.kh.mbting.member.model.vo;

import lombok.AllArgsConstructor;
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
	private String status;

}