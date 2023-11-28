<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gasoek+One&family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
    	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    
<style>
#all {
    margin: auto;
    width : 1200px;
    height : 700px;
    font-family: 'Sunflower', sans-serif;
}
.wrapPC {
    width : 1200px;
    height : 700px;
    display: inline-block;
    display: flex;
    font-family: 'Sunflower', sans-serif;
}


#profileDiv {
    display: flex;
    border: 1px solid black;
    width: 600px;
    height: 900px;
}

#profileDiv img {
    height: 400px;
    width : 400px;

    
}
#profileDiv div {
    width : 400px;
    margin: auto;
}

#mPro {
    position : relative;
    left: 100px;
}

#yPro {
    position : absolute;
    left : 400px;
    top  : 300px;
}


#profileText {
    margin-top: 10px;
}

#chatInputTable td{
    width : 50%;
}
/*---------------------------chatting--------------------------------*/


#chatDiv {
    width: 650px;
    height: 100%;
    border-left: 1px solid #ffffff;
    border-right: 1px solid #ffffff;
    background-color: #ffcece;
    overflow:auto;
}

.otherChat {
    border : 1px solid red;
    font-family: 'IBM Plex Sans KR', sans-serif;
    width :100%;
    /*
  height: 50px;
  line-height: 28px;
  margin : 20px;
  border: 2px solid transparent;
  border-radius: 8px;
  outline: none;
  background-color: rgb(248, 230, 248);
  color: #0d0c22;
  box-shadow: 0 0 5px rgb(233, 255, 231), 0 0 0 10px #f5f5f5eb;
  margin-left: 20px;
  width: 300px;
  padding: 0 1rem;
  font-family: 'IBM Plex Sans KR', sans-serif;
  line-height: 28px;
  */
}

.myChat {
    border : 1px solid black;
    font-family: 'IBM Plex Sans KR', sans-serif;
    width :100%;
    /*
  width : 100%;
  border: 1px solid black;
  height: 60px;
  line-height: 55px;
  padding: 0 1rem;
  margin : 20px;
  border: 2px solid transparent;
  border-radius: 8px;
  background-color: rgb(207, 207, 207);
  color: #0d0c22;
  box-shadow: 0 0 5px rgb(233, 255, 231), 0 0 0 10px #f5f5f5eb;
  margin-left: 240px;
  font-family: 'IBM Plex Sans KR', sans-serif;
  text-align: left;
  */
}

.message {
    width: 100%;
    display: inline-block;
    align-items: flex-end;
    color: black;
}

.Right {
    text-align: right;
}

.Left {
    text-align: left;
}
.text {
  display: inline-block;
  max-width: 500px;
  border: 1px solid black;
  height: 60px;
  line-height: 55px;
  padding: 0 1rem;
  margin : 20px;
  border: 2px solid transparent;
  border-radius: 8px;
  background-color: rgb(207, 207, 207);
  color: #0d0c22;
  box-shadow: 0 0 5px rgb(233, 255, 231), 0 0 0 10px #f5f5f5eb;
  font-family: 'IBM Plex Sans KR', sans-serif;
}

#chatInputTable {
    display: block;
    width : 1200px;
    height: 200px;
    display: fiex;
}

.grow-wrap {
  display: grid;
}
.grow-wrap::after {
  content: attr(data-replicated-value) " ";
  white-space: pre-wrap;
  visibility: hidden;
}
.grow-wrap > textarea {
  resize: none;
  overflow: hidden;
  width : 572px;
  height: 130px;
}
.grow-wrap > textarea,
.grow-wrap::after {
  border: 1px solid black;
  padding: 0.5rem;
  font: inherit;
  grid-area: 1 / 1 / 2 / 2;
}

label {
  display: block;
}

#submitButton {
 align-items: center;
 background-color: #ffd8d8;
 border: 1px solid rgba(0, 0, 0, 0.1);
 border-radius: .25rem;
 box-shadow: rgba(0, 0, 0, 0.02) 0 1px 3px 0;
 box-sizing: border-box;
 color: rgba(0, 0, 0, 0.85);
 cursor: pointer;
 display: inline-flex;
 font-size: 16px;
 font-weight: 600;
 justify-content: center;
 line-height: 1.25;
 min-height: 3rem;
 padding: calc(.875rem - 1px) calc(1.5rem - 1px);
 text-decoration: none;
 transition: all 250ms;
 user-select: none;
 -webkit-user-select: none;
 touch-action: manipulation;
 vertical-align: baseline;
 width: auto;
}

#submitButton:hover,
#submitButton:focus {
 border-color: rgba(0, 0, 0, 0.15);
 box-shadow: rgba(0, 0, 0, 0.1) 0 4px 12px;
 color: rgba(0, 0, 0, 0.65);
}

#submitButton:hover {
 transform: translateY(-1px);
}

#submitButton:active {
 background-color: #F0F0F1;
 border-color: rgba(0, 0, 0, 0.15);
 box-shadow: rgba(0, 0, 0, 0.06) 0 2px 4px;
 color: rgba(0, 0, 0, 0.65);
 transform: translateY(0);
}

/*----------------------------사용자 화면 --------------------------*/
  .card-image > img{
        border: 1px solid black;
        width : 200px;
        height: 200px;
  }
</style>
</head>
<body>
<div id="all">
    <div class="wrap">
        <div class="wrapPC">
            <div id="profileDiv">
                <div><button onclick="disconnect();">채팅 종료하기</button></div>
                    <div class="card-image">
                    
                    </div>
            </div>

            <div id="chatDiv">
                        <c:forEach var="chat" items="${requestScope.chattingList}" >
	                         <c:choose>
			                         <c:when test="${sessionScope.loginMember.userNo eq chat.senderNo}">
			                            <div class="message Right">
			                                <p class="text">${chat.message}</p>
			                            </div>
			                     	 </c:when>
			                     	 <c:otherwise>
				                     	 <div class="message Left">
				                                <p class="text">${chat.message}</p>
				                         </div>
			                     	 </c:otherwise>
		                     </c:choose>
                        </c:forEach>
            </div>
        </div>
 
<div id="chatInputTable" >
    <table>
        <tr style="height: 120px;">
            <td></td>
            <td style="border: 1px solid black;">
                <div class="grow-wrap">
                    <textarea name="text" id="text" onInput="this.parentNode.dataset.replicatedValue = this.value" placeholder="메시지를 입력해주세요."></textarea>
                </div>
                <div align="right"><button type="submit" id="submitButton" onclick="send();">전송하기</button></div>
            </td>
        </tr>
    </table>
</div>
</div>
         
  <script>
    let socket;
	//연결 실행 시 실행될 함수

	$(function(){
		let url = "ws://localhost:8081/mbting/chat.do";
			
		socket = new WebSocket(url);
		
		//연결 성공 시 실행할 함수 onopen 
		socket.onopen = function() {
			console.log("서버와 연결 되었습니다.");
		};
		
		//연결 종료 시 실행할 함수 onclose
		socket.onclose = function() {
			console.log("서버와 연결이 종료");
		};
		
		//연결 오류 발생 시 실행할 함수
		socket.onerror = function() {
			console.log("서버 오류남");
		};
		
		socket.onmessage = function(e) {
		
			let div = $("<div>" + e.data + "</div");
			console.log(div);
			
			$("#message_wrap1").append(div);
		};

	});

	//메시지를 전송하는 함수
	function send() {
		let text = $("#text").val();
		//console.log(text);
		
		if(text.trim() !== "") {
				//입력한 메세지가 있을 경우에만 전송하겠다는 뜻. 
				//websocket 객체의 send 메소드를 호출
				
				socket.send(text); //socket으로 메시지 전송
				$("#text").val("");//초기화 효과
			}

	};
	
	
	//연결 종료 시 실행될 함수 
	function disconnect() {
		socket.close();
        location.href="http://localhost:8081/mbting";
	};
	
	
	</script>   


</body>
</html>