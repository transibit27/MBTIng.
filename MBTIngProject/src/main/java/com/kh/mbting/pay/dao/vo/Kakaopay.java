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
public class Kakaopay {
	
	private int partnerOrderId;
	private String tid;
	private String cid;
	private String itemName;
	private String payMethod;
	private int quantity;
	private String orderDate;
	private String refundDate;
	private int totalAmount;
	private int taxFreeAmount;

}
