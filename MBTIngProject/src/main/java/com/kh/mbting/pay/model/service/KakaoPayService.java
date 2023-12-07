package com.kh.mbting.pay.model.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.kh.mbting.pay.dao.vo.ReadyResponse;

@Service
public class KakaoPayService {
	
	public ReadyResponse payReady(String itemName, int quantity, String email, int totalAmount) {
		
		String order_id = "100";
		
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", "TC0ONETIME"); 							//가맹점 코드 10자
		parameters.add("partner_order_id", order_id);					// 가맹점 주문번호, 최대 100자
		parameters.add("partner_user_id", email);						// 가맹점 회원 id
		parameters.add("item_name", itemName);							// 상품명
		parameters.add("quantity", String.valueOf(quantity));			// 상품 수량
		parameters.add("total_amount", String.valueOf(totalAmount));	// 상품 총액
		parameters.add("tax_free_amount","0");							// 상품 비과세금액
		parameters.add("approval_url","");
		parameters.add("tax_free_amount","http://localhost:8081/mbting/myPay.me");		// 결제 성공시 리다이렉트 URL
		parameters.add("cancel_url","http://localhost:8081/mbting/myPay.me");
		parameters.add("fail_url","http://localhost:8081/mbting/myPay.me");

		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters,this.getHeaders());
		
		// 외부API 통신
		RestTemplate template = new RestTemplate();
		
		String url = "https:kapi.kakao.com/v1/payment/ready";
		
		ReadyResponse readyResponse = template.postForObject(url, requestEntity, ReadyResponse.class);
		
		return readyResponse;
	}
	
	private HttpHeaders getHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "KakaoAK 5202c0b22c8b4e8caf0ba17209825b7b");
		headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		return headers;
	}
	
}