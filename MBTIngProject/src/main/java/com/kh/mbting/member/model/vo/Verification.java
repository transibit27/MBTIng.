package com.kh.mbting.member.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Verification {

	private String email;
	private int emailCode;
	private String createDate;
}
