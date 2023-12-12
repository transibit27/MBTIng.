package com.kh.mbting.chatting.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
@AllArgsConstructor
public class SearchMember {
	private int startAge;
	private int endAge;
	private int startHeight;
	private int endHeight;
	private String address;
	private String mbti; 
	private String gender;
}
