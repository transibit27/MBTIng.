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
.wrap {
    width : 1500px;
    height : 900px;
    margin: auto;
    border: double 3px rgb(255, 149, 166);
    font-family: 'IBM Plex Sans KR', sans-serif;
}
.wrapPC {
    width : 1550px;
    height : 900px;
    display: inline-block;
    display: flex;
}

#profileDiv {
    width: 400px;
    height: 900px;
    margin-left: 40px;
    margin-right: 50px;
    background-color: #ffcece;
}

#profileDiv table {
    width: 400px;
    height: 100%;
}

#profileDiv table td{
    text-align: center;
}

#profileDiv img {
    height: 300px;
    width : 300px; 
    border-radius: 200px; 
}


/*---------------------------chatting--------------------------------*/

 ul , li {
	list-style: none;
 }
 
.chatDiv {
    width: 670px;
    height: 80%;
    border-left: 1px solid #ffffff;
    border-right: 1px solid #ffffff;
    overflow:auto;
    margin-top: 100px;
    margin-left: 100px;
}

.chatList {
    width: 500px;
    height: 900px;
    border : 1px solid black;
}

.Right {
    text-align: right;
}

.Right > .message {
   background-color : pink;
}
.Left {
    text-align: left;
}
.message {
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

.chat {
    width: 100%;
    display: inline-block;
    align-items: flex-end;
    color: black;
}

#chatInput {
    width: 670px;
    height: 200px;
    margin-left: 540px;
}

#chatInput > table {
    width: 100%;
    height : 95%;
}

#chatInput textarea {
    resize: none;
}

#chatInput td {
    height : 100%;
}

.chatList_box {
    border: 1px solid rgb(165, 165, 165);
    height : 110px;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #ffffff;
}

#chatList {
    overflow : auto;
    width : 450px;
    height : 900px;
}


.chatList_box table {
    width : 100%;
    height : 80%; 
}

.chatList_box img {
    width : 50px;
    height : 50px;
    border-radius: 30px;
}

.chatListText {
    font-size: 10px;
    color: gray;
    vertical-align: top;
    width :200px;
}

.chatListName {
    font-weight: bold;
    vertical-align: bottom;
}

.chatListTime {
    text-align: center;
    font-size: 10px;
    color: gray;
}

.chatListPic {
    text-align: center;
    width : 60px;
    height: 60px;
    margin-left: 10px;
}
/*-------------------------전송버튼 css---------------------------------*/
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

<br><br><br><br>
    <div class="wrap">
        <div class="wrapPC">

            <div class="chatList">
                
            </div>

             <div class="chatDiv">
		        <ul>
		            <li>
		                <div class="sender">
		                    <div></div>
		                </div>
		                <div class="chat">
		                    <p></p>
		                </div>
		            </li>
		        </ul>
	    	</div>
	    	
	    	<div class="chatDiv2" style="display : none">
		        <ul>
		            <li>
		                <div class="sender">
		                    <div></div>
		                </div>
		                <div class="chat">
		                    <p></p>
		                </div>
		            </li>
		        </ul>
	    	</div>
             
             
             <div id="profileDiv">
               
                <table > 
                   <tr>
                       <td colspan="3" style="height: 300px; padding-top: 100px; "><img id="masterImg"> </td>
                   </tr>
                   <tr>
                       <td colspan="3" style="height: 10px; "><p style="font-size: 60px;" id="masterName"></p></td>
                   </tr>
                   <tr>
                       <td colspan="3"></td>
                   </tr>
                   <tr>
                       <td colspan="3" style="height: 10px;" ><p id="mbti" style="font-size : 30px;"></p></td>
                   </tr>
                   <tr>
                       <td colspan="3"></td>
                   </tr>
                   <tr>
                       <td colspan="3" style="height: 10px;"><p id="intro"></p></td>
                   </tr>
                   <tr>
                       <td colspan="3"></td>
                   </tr>
                   <tr>
                       <td colspan="3"></td>
                   </tr>
                   <tr>
                       <td colspan="3">후기 남기기</td>
                   </tr>
                   <tr>
                       <td colspan="3"></td>
                   </tr>
                   <tr>
                       <td><div><button id="submitButton" onclick="">차단하기</button></div></td>
                       <td><div><button id="submitButton" onclick="">신고하기</button></div></td>
                       <td> <div><button id="submitButton" onclick="Home();">나가기</button></div></td>
                   </tr>
                </table>
           </div>
        </div>
        <div id="chatInput">
            <table>
                <tr>
                    <td colspan="2" style="height: 30px;"><img style="width : 40px; height: 30px;"  src="https://cdn-icons-png.flaticon.com/128/6350/6350285.png"></img>></td>
                </tr>
                <tr>
                    <td>
                        <textarea style="width: 100%; height: 90%;" placeholder="메시지를 입력해주세요" name="message" id="message"></textarea>
                    </td>
                    <td style="width: 15%;"><button id="submitButton" style="width: 100%; height: 90%;" onclick="sendMessage();" >전송</button></td>
                </tr>
            </table>
        </div>
      </div>
    
        
  <script>
    $(function() {
    	getRoomList();	
    });
    
	function getRoomList() {
  		
  	
  		 $.ajax({
             url:"chatRoomList.do",
             data : {
                 userEmail:"${sessionScope.loginMember.email}"
             },
             dataType:"json",
             async:false, // async : false를 줌으로써 비동기를 동기로 처리 할 수 있다.
             success:function(data){
            	 
            	 console.log(data);
            	
            	 $chatWrap = $(".chatList");

            	 for (var i in data) {
            	     // user가 보낸사람인지, 나인지 확인하는 코드입니다.
            	     var isCurrentUser = data[i].userEmail === "${sessionScope.loginMember.email}";

            	     // main div를 먼저 생성해주고.
            	     var $div = $("<div class='chatList_box' onclick='enterRoom(this);'>")
            	         .attr("id", data[i].roomNo)
            	         .attr("email", isCurrentUser ? data[i].masterEmail : data[i].userEmail);

            	     // table 구조를 만드는 코드
            	     var $table = $("<table>");

            	     // 첫 번째 행을 만드는 코드
            	     var $tr1 = $("<tr>");
            	     $tr1.append($("<td rowspan='2' class='chatListPic'>").append($("<img>").attr("src", isCurrentUser ? "http://localhost:8081/mbting" + data[i].masterPic : "http://localhost:8081/mbting" + data[i].userPic)));
            	     $tr1.append($("<td class='chatListName' style='height: 35px;'>").text(isCurrentUser ? data[i].masterName : data[i].userName));
            	     $tr1.append($("<td class='chatListTime'>").text(data[i].sendTime + "분"));

            	     // 2번째 행을 만드는 코드
            	     var $tr2 = $("<tr>");
            	     $tr2.append($("<td class='chatListText'>").text(data[i].messageContent));

            	     // 테이블에 넣어서 먼저 테이블 구조 완성하기
            	     $table.append($tr1);
            	     $table.append($tr2);

            	     // main div에 붙여주기
            	     $div.append($table);

            	     // 그걸 chatWrap에 붙여주기
            	     $chatWrap.append($div);

            	 }
            	 
            	 
             }
  		});
    
	}
	
	</script>
	
	<!--  채팅방 관련 -->
	<script>
	 let roomNo;
	 let check = false; 
	 
	 
	 function enterRoom(obj){
		 
		// 현재 html에 추가되었던 동적 태그 전부 지우기
         $('div.chatDiv').html("");
		
         // obj(this)로 들어온 태그에서 id에 담긴 방번호 추출
         roomNo 	= obj.getAttribute("id");
     	 var masterPic	 = obj.querySelector('img').src;
     	 
     	 email		= obj.getAttribute("email");
     	 
     	 //console.log(masterPic);
     	
          //console.log(roomNo);
          // 해당 채팅 방의 메세지 목록 불러오기
           $.ajax({
             url:"messageList.do" ,
             data:{
            	 roomNo   : roomNo,
                 userEmail:"${sessionScope.loginMember.email}"
             },
             async:false,
             dataType:"json",
             success:function(data){
            	 
            	 //console.log(data);
                 for(var i = 0; i < data.length; i++){
                     // 채팅 목록 동적 추가
                     CheckLR(data[i]);
                 }
                 
                 $.ajax({
                	url : "master.In",
                	data : {email : email},
                	success : function(master) {
						console.log(master);
                		$("#masterName").text(master.userName);
                        $("#masterImg").attr("src" , masterPic);
                        $("#mbti").text(master.mbti);
                        $("#intro").text(master.introduce);
                	},
                	error : function() {
                		console.log("클릭한 방의 master 정보 얻어오기 실패");
                	}
                 
                 });
                 
             }
         });
          // 웹소켓 연결
          if (check){
        	  disconnect();
          }
        	  
          connect();
          console.log("enterRoom");
          
          
     }
	</script>
	
	
	<script>
    let socket;
	//연결 실행 시 실행될 함수
		
		function connect() {
			check = true;
			let url ="ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/chat.do";
				
			socket = new WebSocket(url);
			
			//연결 성공 시 실행할 함수 onopen 
			socket.onopen = function() {
				 const data = {
			                    "roomNo" : roomNo,
			                    "name"   : "${ loginMember.userName }",
			                    "email"  : "${ loginMember.email }",
			           "messageContent"  : "ENTER-CHAT"
		            };
		            
				 	let jsonData = JSON.stringify(data);
		            socket.send(jsonData);
			};
			
			//연결 종료 시 실행할 함수 onclose
			socket.onclose = function() {
				console.log("서버와 연결이 종료");
			};
			
			//연결 오류 발생 시 실행할 함수
			socket.onerror = function() {
				console.log("서버 오류남");
			};
			
			//메시지 수신 시에 실행되는 함수
			socket.onmessage = function(evt) {
				  let receive = evt.data.split(",");
				  
				  //console.log(receive);
				  const data = {
		                    "name" : receive[0],
		                    "email" : receive[1],
		                 "messageContent" : receive[2]
		            };
				  
				  if(data.email != "${ loginUser.email }"){
		                CheckLR(data);
		          }
			};
			
		}
	
		//연결 종료 시 실행될 함수 
		function disconnect() {
			socket.close();
	        //location.href="http://localhost:8081/mbting";
		};
	

	//메세지를 전송하는 함수
	function sendMessage() {
		
		let message = $("#message").val();
		//console.log(message);
		
		if(message.trim() !== "") {
				//입력한 메세지가 있을 경우에만 전송하겠다는 뜻. 
				//websocket 객체의 send 메소드를 호출
				
				const data = {
                "roomNo" 		   : roomNo,
                "name" 			   : "${ sessionScope.loginMember.userName }",
                "email" 		   : "${ sessionScope.loginMember.email }",
                "messageContent"   : message 
            	};
				//console.log(data);
				//CheckLR(data);
		
				let jsonData = JSON.stringify(data);
        
       		 	socket.send(jsonData);
        
				$("#message").val("");//초기화 효과
			}
		
	}
	
	
	
	// * 2-1 추가 된 것이 내가 보낸 것인지, 상대방이 보낸 것인지 확인하기
    function CheckLR(data) {
        // email이 loginSession의 email과 다르면 왼쪽, 같으면 오른쪽
        const LR = (data.email != "${ sessionScope.loginMember.email }") ? "Left" : "Right";
         // 메세지 추가
        //console.log(LR);
        appendMessageTag(LR, data.email, data.messageContent, data.name);
    }
	
    // * 3 메세지 태그 append
    function appendMessageTag(LR_className, email, message, name) {
         
        const chatLi = createMessageTag(LR_className, email, message, name);
     
        //console.log(chatLi);
        $('div.chatDiv').append(chatLi);
     
        // 스크롤바 아래 고정
        $('div.chatDiv').scrollTop($('div.chatDiv').prop('scrollHeight'));
    }
    
 	// * 4 메세지 태그 생성
    function createMessageTag(LR_className, email, message, name) {
     
 		//console.log(LR_className +email+message +name);
         // 형식 가져오기
         let chatLi = $("div.chatDiv2 ul li").clone();

         //console.log(chatLi);
         
         chatLi.find('.chat').addClass(LR_className);              	// left : right 클래스 추가
         // find() : chatLi의 하위 요소 찾기
         chatLi.find('.sender div').text(name);      				// 이름 추가
         chatLi.find('.chat p').text(message); 						// 메세지 추가
         chatLi.find('.chat p').addClass("message");
         chatLi.find('.sender div').addClass(LR_className);
         
         //console.log(chatLi);
         return chatLi;
    };
	</script>   

	
	
	
	
	<!-- 채팅 ui를 위한 script -->
	<script>
	$(".chatList").on("click", ".chatList_box", function() {
		
		$(".chatList_box").not(this).css("background-color", "white");
		
	    $(this).css("background-color", "pink");
	});
	
	function Home() {
		 location.href="http://localhost:8081/mbting";
	};
		
	</script>
</body>
</html>