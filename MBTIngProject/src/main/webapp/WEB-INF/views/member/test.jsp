<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>

	<h1>웹소켓</h1>
	
	<h3>1. WebSocketBasicServer 로 연결해보기</h3>

	<button onclick="connect1();">접속</button>
	<button onclick="disconnect1();">종료</button>
	
	<br><br>
	
	<input type="text" id="chat_input1">
	<button onclick="send1();">전송</button>
	
	<script>
		let socket; // 전역변수 선언
	
		function connect1() {
			// 웹소켓 서버 접속 함수
			
			// 접속할 웹소켓의 url 주소를 넘기면서 WebSocket 객체 생성
			let url = "ws://localhost:8006/websocket/basic.do";
			
			socket = new WebSocket(url);
			
			// 접속, 메세지 수신, 종료, 오류 발생, ... 
			// => 매번 실행할 함수 (메소드 속성) 을 정의 가능
			
			// 연결 성공 시 실행할 함수
			socket.onopen = function() {
				console.log("서버와 연결 되었습니다.");
			};
			
			// 연결 종료 시 실행할 함수
			socket.onclose = function() {
				console.log("서버와 연결이 종료되었습니다.");
			};
			
			// 연결 오류 발생 시 실행할 함수
			socket.onerror = function() {
				console.log("서버 연결 과정에서 오류가 발생했습니다.");
			};
			
			// 메세지 수신 시 실행할 함수
			socket.onmessage = function() {
				console.log("메세지가 도착했습니다.");
			};
		}
		
		function disconnect1() {
			// 웹소켓 서버 접속 종료 함수
			
			// WebSocket 객체의 close 메소드를 호출
			socket.close();
			// 해당 페이지가 닫히면 소켓 접속은 자동으로 종료
		}
		
		function send1() {
			// 메세지를 전송하는 함수
			
			// 입력된 글자를 불러와서 서버로 전송
			let text = $("#chat_input1").val();
			
			if(text.trim() != "") {
				// 입력한 메세지가 있을 경우에만 전송하겠다.
				
				// WebSocket 객체의 send 메소드를 호출
				socket.send(text);
				$("#chat_input1").val(""); // 초기화효과
			}
		}
	</script>

	<br>
	<hr>
	
	<h3>2. 그룹채팅 만들어보기</h3>

	<button onclick="connect2();">접속</button>
	<button onclick="disconnect2();">종료</button>
	
	<br><br>
	
	<input type="text" id="chat_input2">
	<button onclick="send2();">전송</button>
	
	<br>
	
	<!-- 수신된 메세지가 출력될 영역 -->
	<div id="message_wrap2"></div>

	<script>
		let socket2;
		
		function connect2() {
			// 그룹채팅 웹소켓 서버 접속 함수
			
			let url = "ws://localhost:8006/websocket/group.do";
			
			socket2 = new WebSocket(url);
			
			socket2.onopen = function() {
				console.log("서버와 연결 되었습니다.");
			};
			
			socket2.onclose = function() {
				console.log("서버와 연결이 종료되었습니다.");
			};
			
			socket2.onerror = function() {
				console.log("서버와 연결 과정에서 오류가 발생했습니다.");
			};
			
			socket2.onmessage = function(e) {
				
				// console.log("메세지가 도착했습니다.");
				// console.log(e); // e.data 속성에 메세지 내용이 담겨있음
				
				let div = $("<div>" + e.data + "</div>");
				
				$("#message_wrap2").append(div);
			};
		}
		
		function disconnect2() {
			// 그룹채팅 웹소켓 서버 접속 종료 함수
			
			socket2.close();
		}
		
		function send2() {
			// 그룹채팅 웹소켓 서버로 메세지를 보내주는 함수
			
			let text = $("#chat_input2").val();
			
			if(text.trim() != "") {
				
				socket2.send(text);
				$("#chat_input2").val("");
			}
		}
	</script>
	
	<br>
	<hr>
	
	<h3>3. 로그인이 연동된 채팅 기능 만들기</h3>

	<c:choose>
		<c:when test="${ empty sessionScope.loginUser }">
			<!-- 로그인 전 보여져야 하는 로그인 폼 -->
			<form action="login.me" method="post">
				아이디 : <input type="text" name="userId"> <br>
				비밀번호 : <input type="password" name="userPwd"> <br>
				<button type="submit">로그인</button>
			</form>
		</c:when>
		<c:otherwise>
			<!-- 로그인 후 보여져야 하는 채팅 폼 -->
			<h4>
				${ sessionScope.loginUser } 님 환영합니다^^
				<a href="logout.me">로그아웃</a>
			</h4>
			
			<br>
			
			<button onclick="connect3();">접속</button>
			<button onclick="disconnect3();">종료</button>
			
			<br><br>
			
			<input type="text" id="chat_input3">
			<button onclick="send3();">전송</button>
			
			<br>
			
			<!-- 수신된 메세지가 출력될 영역 -->
			<div id="message_wrap3"></div>
			
			<script>
				let socket3;
				
				function connect3() { 
					// 웹소켓 서버 접속 함수
					
					let url = "ws://localhost:8006/websocket/member.do";
					
					socket3 = new WebSocket(url);
					
					socket3.onopen = function() {
						console.log("서버와 연결 되었습니다.");
					};
					
					socket3.onclose = function() {
						console.log("서버와 연결이 종료되었습니다.");
					};
					
					socket3.onerror = function() {
						console.log("서버 연결 과정에서 오류가 발생했습니다.");
					};
					
					socket3.onmessage = function(e) {
						// console.log(e.data); // 메세지 내용이 담겨있음
						// {"userId":"user01","msg":"안녕?","sendTime":"2023-11-15 11:14:52"}
						// => JSON 모양을 한 문자열 타입임!!
						
						// 객체 형식으로 바꾸어 필요한 정보를 추출
						let obj = JSON.parse(e.data);
						// console.log(obj);
						
						let data = obj.userId + " : " + obj.msg 
										+ "\t" + obj.sendTime;
						
						let div = $("<div>" + data + "</div>");
						
						$("#message_wrap3").append(div);
					};
				}
				
				function disconnect3() {
					// 접속 종료 함수
					
					socket3.close();
				}
				
				function send3() {
					// 메세지 전송 함수
					
					let text = $("#chat_input3").val();
					
					if(text.trim() != "") {
						
						socket3.send(text);
						$("#chat_input3").val("");
					}
				}
			</script>
			
		</c:otherwise>
	</c:choose>


</body>
</html>









