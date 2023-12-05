package com.kh.mbting.mbti.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Mbti {
	private String userNo;
	private String mbti;
	private String mbtiNick;
	private String mbtiMatch;
}
