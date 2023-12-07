package com.kh.mbting.pay.dao.vo;

import java.sql.Date;

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
public class Payment {
	
	private int payCode;			// 일련번호
	private long odrCode;			// 주문번호
	private String pay_method;		// 결제방식선택
	private Date pay_date;			// 결제일
	private int pay_tot_price;		// 결제급액
	private int pay_rest_price;		// 미지급금
	private String pay_nobank_user;	// 입금자명(무통장)
	private String pay_nobank;		// 입금은행

}
