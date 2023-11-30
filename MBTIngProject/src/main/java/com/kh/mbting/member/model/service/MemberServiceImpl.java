package com.kh.mbting.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.mbting.board.model.vo.Board;
import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.member.model.dao.MemberDao;
import com.kh.mbting.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	//Autowired할 구문들만 모아놓음.
	@Autowired 
	private MemberDao memberDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	@Override
	public ArrayList<Member> selecToptMemberList() {
		return memberDao.selectTopMemberList(sqlSession);
	}
	
	
	//login한 회원의 정보를 처리해줄 method
	@Override
	public Member loginMember(Member m) {		
	
		return memberDao.loginMember(sqlSession, m);
	
	}

	//회원가입 후 회원의 정보를 처리해줄 method
	@Override
	public int insertMember(Member m) {
		
		return memberDao.insertMember(sqlSession, m);
	}

	//카카오로 로그인을 했을 경우, 카카오에 접속할 수 있는 Token을 얻어오기 위한 method
	@Override
	public String getKakaoAccessToken(String code) {
		
		 //필요한 변수명 먼저 빼놓음 
		 String access_Token 	= "";
	     String refresh_Token 	= "";
	     String reqURL 			= "https://kauth.kakao.com/oauth/token";
	     //저 위에 reqURL은 kakao에서 제공하는 token에 접근하기 위한 공식 주소임 !!
	     
	     try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	            //POST 요청을 위해서 기본값이 false인 setDoOutPut을 true로 만들어줌. ! 
	            //Post로 요청을 할 때는 OutputStream 객체로 데이터를 전송하는데, 
	            //DoOutPut 객체가 false라면 데이터를 전송 안한다는 뜻이라서 true로 바꿔주는 거임요. 
	            conn.setRequestMethod("POST");
	            conn.setDoOutput(true);

	            //POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송합니담.
	            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	            StringBuilder sb = new StringBuilder();
	            sb.append("grant_type=authorization_code");
	            sb.append("&client_id=670371a54748d4645ec474b68405a19c"); //본인이 발급받은 REST_API를 넣어주면 됨. 
	            sb.append("&redirect_uri=http://localhost:8081/mbting/kakaoLog.me"); //본인이 설정한 주소를 넣어주면 됨. 
	            sb.append("&code=" + code); //get방식으로 받아온 code임.
	            bw.write(sb.toString());
	            bw.flush();

	            //결과 코드가 200이라면 성공 !!
	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);

	            // Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);

	            access_Token = element.getAsJsonObject().get("access_token").getAsString();
	            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

	            System.out.println("access_token : " + access_Token);
	            System.out.println("refresh_token : " + refresh_Token);

	            br.close();
	            bw.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }

	        return access_Token;
	    }

	//카카오로 로그인한 회원의 정보를 얻어내기 위한 service
	@Override
	public HashMap<String, Object> getUserInfo(String access_Token) {
		
		  //회원의 정보를 받을 HashMap을 설정해줌. 
		  HashMap<String, Object> userInfo = new HashMap<String , Object>();
		  String reqURL = "https://kapi.kakao.com/v2/user/me";
		   
		  try {
		        URL url = new URL(reqURL);
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("POST");
		        
		        // 이건 kakao 공식 문서에 있는 건데 권한을 얻어내기 위한 공식적인 문구임!!!
		        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
		        
		        int responseCode = conn.getResponseCode();
		        System.out.println("responseCode : " + responseCode);
		        
		        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        
		        String line = "";
		        String result = "";
		        
		        while ((line = br.readLine()) != null) {
		            result += line;
		        }
		        System.out.println("response body : " + result);
		        
		        JsonParser parser = new JsonParser();
		        JsonElement element = parser.parse(result);
		       
		        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
		        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
		        
		        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
		        String profile_image = properties.getAsJsonObject().get("profile_image").getAsString();
		        System.out.println("�뀑1" +nickname);
		        
		        String email = kakao_account.getAsJsonObject().get("email").getAsString();
		        
		        System.out.println("email" + email);
		        
		        userInfo.put("nickname", nickname);
		        userInfo.put("profile_image", profile_image);
		        userInfo.put("email", email);
		       
		    } catch (IOException e) {
		        e.printStackTrace();
		    }
		    
		    return userInfo;
	}

	// 마이페이지 - 회원정보 수정용 메소드
	@Override
	public int updateMember(Member m) {
		return memberDao.updateMember(sqlSession, m);
	}

	// 마이페이지 - 내게 매칭을 신청한 회원의 수 확인용 메소드
	@Override
	public int proposerList(String userNo) {
		return memberDao.proposerList(sqlSession, userNo);
	}

	// 마이페이지 - 내 후기 게시글 총 갯수 확인용 메소드
	@Override
	public int selectListCount(String userNo) {
		return memberDao.selectListCount(sqlSession, userNo);
	}

	// 마이페이지 - 내 후기 조회용 메소드
	@Override
	public ArrayList<Board> selectList(PageInfo pi, String userNo) {
		return memberDao.selectList(sqlSession, pi, userNo);
	}

	
}


	

		
	


