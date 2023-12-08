package com.kh.mbting.pay.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mbting.member.model.service.MemberService;
import com.kh.mbting.pay.model.service.KakaoPayService;

@Controller
public class KakaoPayController {
	
	@Autowired	
	private KakaoPayService kakaoPayService; 

	@RequestMapping(value="pay.me", produces = "text/xml; charset=UTF-8")
	@ResponseBody
	public String kakaoPay(@RequestParam(value="email") String email) throws IOException{
		
		String url="https://kapi.kakao.com/v1/payment/ready";
				
		// 카카오 페이와 통신하기 위한 주소 객체 생성
		URL requestUrl = new URL(url);
		
		// url 주소를 넘기면서 카카오 페이와 서버 연결
		HttpURLConnection urlConnection
		= (HttpURLConnection)requestUrl.openConnection();
		
		// 카카오페이 요청사항 처리
		// 1. POST 방식으로 연결
		urlConnection.setRequestMethod("POST");
		// 2. Authorization 키 넘기기
		urlConnection.setRequestProperty("Authorization", "KakaoAK 5202c0b22c8b4e8caf0ba17209825b7b");
		// 3. Content-type 넘기기
		urlConnection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		// 서버에게 전해줄 정보가 있을 경우 DoOutPut(true)를 넣어준다
		urlConnection.setDoOutput(true);
		
		System.out.println("이메일"+email);
		// 결제 시도 시 결제 테이블 데이터 생성하기
		int cResult = kakaoPayService.insertPay(email);
		
		System.out.println("이메일 담김?"+cResult);
				
		// 생성된 결제 테이블로 부터 가맹점 주문번호 받아오기 
		String partner_order_id = Integer.toString(kakaoPayService.getPartnerOrder(email));
		
		System.out.println("오더아이디" + partner_order_id);
				
		String parameter = "cid=TC0ONETIME&"			// cid
				+ "partner_order_id="+partner_order_id+"&"	// 가맹점 주문번호
				+ "partner_user_id="+email+"&"				// 가맹점 회원 id
				+ "item_name=MBTIngCoinx5&"				// 상품명
				+ "quantity=1&"							// 상품 수량
				+ "total_amount=1000&"					// 상품 총액
				+ "tax_free_amount=0&"					// 비과세 금액
				+ "approval_url=http://localhost:8081/mbting/myPay.me&"  // 결제 성공시 리다이렉트 URL
				+ "cancel_url=http://localhost:8081/mbting/myPay.me&"	// 결제 취소시 리다이렉트 URL
				+ "fail_url=http://localhost:8081/mbting/myPay.me";		// 결제 실패시 리다이렉트 URL
		
		// 서버에 위의 값을 넘겨 줄 때 필요한 스트림 객체 생성
		OutputStream outputStream = urlConnection.getOutputStream();
		// 데이터를 넘기기 때문에 데이터 아웃풋 스트림이 추가로 필요
		DataOutputStream dataOutSteam = new DataOutputStream(outputStream);
		
		// writeBytes()는 
		// parameter에 담긴 값을 bytes 형식으로 형변환 한 뒤 데이터 아웃풋 스트림에게 넘겨줌
		dataOutSteam.writeBytes(parameter);
		dataOutSteam.close();	
		// close를 할때 flush() 가 함께 실행되어 들고 있던 parameter 값을 카카오에 넘김
		
		// 전송 결과 확인
		int result = urlConnection.getResponseCode();
	
		// 카카오 측으로 부터 정보를 받을 수 있도록 준비
		InputStream inputStream;
		
		// HTTP 코드에서 정상적인 통신은 200값을 가짐
		if(result == 200) {		// 성공 시
			inputStream = urlConnection.getInputStream();
			//System.out.println("결제 요청/ 바코드 노출 순간 tid 발급 됨");
			
			
			
		} else {	// 실패 시
			inputStream = urlConnection.getErrorStream();
		}
		
		// 받은 정보를 읽을 수 있는 객체 생성
		BufferedReader br 
		= new BufferedReader(
				new InputStreamReader(
						urlConnection.getInputStream()));

		// System.out.println("리드라인"+br.readLine());
		String line;
		// line = br.readLine();
		// System.out.println("문자열"+line);		
		String responseText = "";
		
		
		while((line = br.readLine()) != null) {
			
			responseText += line;
		}
		
		br.close();
		urlConnection.disconnect();
		
		// 응답데이터를 ajax 요청했던 곳으로 보내주고자 한다면
		// 굳이 ArrayList 로 내가 직접 파싱할 필요 없이
		// JSON 형태를 바로 보내주면 됨!!
		return responseText;
	}
	
}