package com.kh.mbting.chatting.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class SearchMember {
	private String height;  
	private String address;
	private String age;
	private String mbti; 
	private String gender;
}
