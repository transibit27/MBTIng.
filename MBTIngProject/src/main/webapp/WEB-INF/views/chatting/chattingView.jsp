<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.format.DateTimeFormatter , java.time.LocalDateTime" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("a hh:mm");
	String formattedTime = LocalDateTime.now().format(formatter);
%>
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

body {
	width : 100%;
	height : 100%;
}

.wrap {
    width : 484px;
    height : 700px;
    margin: auto;
    border: solid 5px lightgray;
    font-family: 'IBM Plex Sans KR', sans-serif;
    border-radius : 20px;
}
.wrapPC {
    width : 1640px;
    height : 500px;
    display: inline-block;
    display: flex;
    margin : auto;
    border-radius : 20px;
}

#profileDiv {
    width: 400px;
    height: 700px;
    margin-left: 40px;
    margin-right: 50px;
    background-color: #ffcece;
    border-radius : 16px;
}

#profileDiv table {
    width: 400px;
    height: 80%;
}

#profileDiv table td{
    text-align: center;
    height : 40%;
}

#profileDiv img {
    height: 250px;
    width : 250px; 
    border-radius: 200px; 
}


/*---------------------------chatting--------------------------------*/

 ul , li {
   list-style: none;
 }
 
.chatDiv {
    width: 690px;
    height: 80%;
    border-left: 1px solid #ffffff;
    border-right: 1px solid #ffffff;
    overflow:auto;
    margin-top: 100px;
    margin-left: 50px;
}

.chatList {
    width: 402px;
    height: 700px;
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
  height: 40px;
  line-height: 43px;
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
    margin-left : 500px;
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
    width : 400px;
    border-top-right-radius: 20px;
}

#chatList {
    overflow : auto;
    width : 450px;
    height : 800px;
    border-top-right-radius: 20px;
}

.chatList {
	 border-top-right-radius: 20px;
	 border-bottom-right-radius: 20px;
}
.chatList_box table {
    width : 100%;
    height : 80%; 
    border-top-right-radius: 20px;
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

.time {
   font-size : 13px;
   color      : gray;
}

.timeLeft {
 display : float;
 margin-left : 20px;
 border : 1px solid black;
}

.chatInfo {
    width : 80px;
    height : 700px;
    border : 1px solid black;
    background-color: rgb(255, 218, 218);
	border-top-left-radius: 18px;
    border-bottom-left-radius: 20px;
}

#chatInfoTable {
    width : 100%;
    text-align: center;
}

#chatInfoTable img {
    width : 80%;
    height : 80%;
    cursor: pointer;
}

#chatInfoTable tr {
    height : 30px;
}

/*
#chatAllCount {
    border-radius: 50px;
    border: 1px solid black;
    width: 50px;
    height : 50px;
    margin: auto;
    cursor: pointer;
}
*/
 .count {
 	width : 35px;
 	height : 35px;
 	box-shadow : 0 0.05rem 0.6rem red;
 	border-radius : 17px;
 	margin : auto;
 	background-color : red;
 	color : white;
 	text-align : center;
 	line-height: 37px;
 	font-size : 14px;
 } 

#chatInfoTable button {
    background-color: transparent;
    border: 0px;
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
  
 /*-------------------맨 처음 화면을 위한 css-------------------------*/
  .hidden {
       display: none;
   }
   
   /*----------------------편지봉투-------------------------*/

	 .tooltip-container {
	  height: 70px;
	  width: 110px;
	  border-radius: 5px;
	  background-color: #fff;
	  background-image: linear-gradient(
	    to left bottom,
	    #f2f5f8,
	    #ecf1f2,
	    #e7eceb,
	    #e3e7e4,
	    #e1e2de
	  );
	  border: 1px solid white;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  cursor: pointer;
	  box-shadow: 0px 10px 10px rgba(0, 0, 0, 0.151);
	  position: relative;
	  transition: transform 0.3s ease;
	}
	
	.tooltip-container::before {
	  position: absolute;
	  content: "";
	  top: -50%;
	  clip-path: polygon(50% 0, 0 100%, 100% 100%);
	  border-radius: 5px;
	  background-color: fff;
	  background-image: linear-gradient(
	    to left bottom,
	    #f2f5f8,
	    #e4eaec,
	    #d8dfde,
	    #cdd3cf,
	    #c5c7c1
	  );
	  width: 100%;
	  height: 50%;
	  transform-style: preserve-3d;
	  transform: perspective(1000px) rotateX(-150deg) translateY(-110%);
	  transition: transform 0.3s ease;
	}
	
	.tooltip-container .text {
	  color: rgb(32, 30, 30);
	  font-weight: bold;
	  font-size: 40px;
	}
	
	.tooltip {
	  position: absolute;
	  top: -20px;
	  opacity: 0;
	  background: linear-gradient(-90deg, rgba(0, 0, 0, 0.05) 1px, white 1px),
	    linear-gradient(rgba(0, 0, 0, 0.05) 1px, white 1px),
	    linear-gradient(-90deg, rgba(0, 0, 0, 0.04) 1px, white 1px),
	    linear-gradient(rgba(0, 0, 0, 0.04) 1px, white 1px),
	    linear-gradient(white 3px, #f2f2f2 3px, #f2f2f2 78px, white 78px),
	    linear-gradient(-90deg, #aaa 1px, white 1px),
	    linear-gradient(-90deg, white 3px, #f2f2f2 3px, #f2f2f2 78px, white 78px),
	    linear-gradient(#aaa 1px, white 1px), #f2f2f2;
	  background-size: 4px 4px, 4px 4px, 80px 80px, 80px 80px, 80px 80px, 80px 80px,
	    80px 80px, 80px 80px;
	  padding: 5px 10px;
	  border: 1px solid rgb(206, 204, 204);
	
	  height: 70px;
	  width: 110px;
	  border-radius: 5px;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  transition-duration: 0.2s;
	  pointer-events: none;
	  letter-spacing: 0.5px;
	  font-size: 18px;
	  font-weight: 600;
	  text-shadow: 10px salmon;
	}
	.tooltip-container:hover {
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
	}
	
	.tooltip-container:hover::before {
	  transform: rotateY(0);
	  background-image: none;
	  background-color: white;
	}
	
	.tooltip-container:hover .tooltip {
	  top: -90px;
	  opacity: 1;
	  transition-duration: 0.3s;
	}
   
</style>
</head>
<body>

<br><br><br><br>



	<div class="tooltip-container">
	  <span class="tooltip"></span>
	  <span class="text">💗</span>
	</div>
	
    <div class="wrap">    
        <div class="wrapPC">
            <div class="chatInfo">
                <table id="chatInfoTable">
                    <tr>
                        <td>
                            <button onclick="chatHome();"><img src="https://cdn-icons-png.flaticon.com/128/5448/5448341.png"></button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div id="chatAllCount">
                                
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="chatList">

            </div>

             <div class="chatDiv">
              <ul>
                  <li>
                      <div class="sender ">
                          <div></div>
                      </div>
                      <div class="chat">
                        <p></p> <label></label>
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
                          <p></p> <label></label>
                      </div>
                  </li>
              </ul>
          </div>
          
          
          <div class="chatDiv3" style="display : none">
              <ul>
                  <li>
                      <div class="sender">
                          <div></div>
                      </div>
                      <div class="chat">
                          <label style="align : right;"></label><p></p> 
                      </div>
                  </li>
              </ul>
          </div>
          

            <div id="profileDiv" class="hidden">
               
                <table> 
                   <tr>
                       <td colspan="3" style="height:250px; padding-top: 70px; "><img id="masterImg"> </td>
                   		<input type="hidden" id="deleteMasterEmail" value="">
                   </tr>
                   <tr>
                       <td colspan="3" style="height: 10px; "><p style="font-size: 60px; margin : 0px;" id="masterName"></p></td>
                   </tr>
                   <tr>
                       <td colspan="3"></td>
                   </tr>
                   <tr>
                       <td colspan="3" style="height: 10px;" ><p id="mbti" style="font-size : 25px;"></p></td>
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
                       <td><div><button id="submitButton" onclick="deleteMessage(this);">톡방 나가기</button></div></td>
                       <td><div><button id="submitButton" onclick="Home();">홈으로</button></div></td>
                   </tr>
                </table>
           </div>
        </div>
        <div id="chatInput" class="hidden">
            <table>
                <tr>
                    <td colspan="2" style="height: 30px;"><img style="width : 40px; height: 30px;"  src="https://cdn-icons-png.flaticon.com/128/6350/6350285.png"></img></td>
                </tr>
                <tr> 
                    <td>
                        <textarea style="width: 100%; height: 90%;" placeholder="메시지를 입력해주세요" name="message" id="message"></textarea>
                    </td>
                    <td style="width: 15%;"><button id="submitButton" style="width: 100%; height: 95%; margin-bottom : 5px;>" onclick="sendMessage();" >전송</button></td>
                </tr>
            </table>
        </div>
      </div>
    
        
  <script>

  
    $(function() {
       getRoomList(); 
       countRoomAll();
       countAll();
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
                
                //console.log(data);
               
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
                    $tr2.append($("<td class='chatListText'>").append($("<div class='countMessage'>")));
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
    var masterPic;
    function enterRoom(obj){
       
      // 현재 html에 추가되었던 동적 태그 전부 지우기
         $('div.chatDiv').html("");
      
         // obj(this)로 들어온 태그에서 id에 담긴 방번호 추출
         roomNo       = obj.getAttribute("id");
         masterPic    = obj.querySelector('img').src;
         email        = obj.getAttribute("email");
         
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
                  //console.log(master);
                        $("#masterName").text(master.userName);
                        $("#masterImg").attr("src" , masterPic);
                        $("#mbti").text(master.mbti);
                        $("#intro").text(master.introduce);
                   },
                   error : function() {
                      console.log("클릭한 방의 master 정보 얻어오기 실패");
                   }
                 
                 });
                 
             }, 
             error : function() {
            	 console.log("메시지 리스트 불러오기 실패");
             }
         });
          // 웹소켓 연결
          if (check){
             disconnect();
          }
             
          connect();
          console.log("enterRoom");

          $('#chatInput').removeClass('hidden');
          $('#profileDiv').removeClass('hidden');
          $('.wrap').css("width" , "1590px");
          $('.wrapPc').removeAttr("margin");
          $('.chatDiv').removeClass('hidden');
     }
   </script>
   
    <script>
        function chatHome() {
          disconnect();
        	
          $('#chatInput').addClass('hidden');
          $('#profileDiv').addClass('hidden');
          $('.wrap').css("width" , "482px");
          $('.wrapPc').attr("margin" , "auto");
          $('.chatDiv').addClass('hidden');
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
              
              console.log(receive[0] + receive[1]);
              
              if(receive[0] == "세션 두명임 읽음팡팡 " || receive[0] == "한 명이다 ") {
            	  
            	  $.ajax({
                      url:"messageList.do" ,
                      data:{
                         roomNo   : receive[1],
                         userEmail:"${sessionScope.loginMember.email}"
                      },
                      async:false,
                      dataType:"json",
                      success:function(data){
                         
                         console.log(data);
                         
                          for(var i = 0; i < data.length; i++){
                              // 채팅 목록 동적 추가
                              CheckLR(data[i]);
                          }
                          
                          $.ajax({
                            url : "master.In",
                            data : {email : email},
                            success : function(master) {
                           //console.log(master);
                                 $("#masterName").text(master.userName);
                                 $("#masterImg").attr("src" , masterPic);
                                 $("#mbti").text(master.mbti);
                                 $("#intro").text(master.introduce);
                                 $("#deleteMasterEmail").val(master.email);
                            },
                            error : function() {
                               console.log("클릭한 방의 master 정보 얻어오기 실패");
                            }
                          
                          });
                          
                      }, 
                      error : function() {
                     	 console.log("메시지 리스트 불러오기 실패");
                      }
                  });
            	  
              }else {
            	  
              const data = {
                           "name" : receive[0],
                          "email" : receive[1],
                 "messageContent" : receive[2],
                 "sendTime" 	  : receive[3],
                 "sessionCount"	  : receive[4]
              };
					
   
              if(data.email != "${ loginUser.email }"){
                      CheckLR(data);
              }
            }
         }
 
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
                "roomNo"           : roomNo,
                "name"             : "${ sessionScope.loginMember.userName }",
                "email"            : "${ sessionScope.loginMember.email }",
                "messageContent"   : message,
                "sendTime": "<%= formattedTime %>"
            }
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
       
        let unReadMessage 	= data.unReadMessage;
        let unReadCount 	= data.sessionCount
        let email			= data.email;
        if(unReadCount == 2 || unReadMessage == 0) {
        	unReadCount = '읽음';
        }else {
            unReadCount = 1;
        }
        
        //console.log(unReadCount);
         // 메세지 추가
        //console.log(LR);
        appendMessageTag(LR, data.email, data.messageContent, data.name , data.sendTime, unReadCount);
    }
   
    // * 3 메세지 태그 append
    function appendMessageTag(LR_className, email, message, name , sendTime , unReadCount) {
         
        const chatLi = createMessageTag(LR_className, email, message, name , sendTime , unReadCount);
     
        //console.log(chatLi);
        $('div.chatDiv').append(chatLi);
     
        // 스크롤바 아래 고정
        $('div.chatDiv').scrollTop($('div.chatDiv').prop('scrollHeight'));
    }
    
    // * 4 메세지 태그 생성
    function createMessageTag(LR_className, email, message, name , sendTime , unReadCount) {
     
       //console.log(LR_className +email+message +name);
         // 형식 가져오기
         let chatLi = $("div.chatDiv2 ul li").clone();
         let chatLi2 = $("div.chatDiv3 ul li").clone();

         //console.log(chatLi);
          if(LR_className === 'Right') {
             chatLi2.find('.chat').addClass(LR_className);                 // left : right 클래스 추가
              // find() : chatLi의 하위 요소 찾기
              chatLi2.find('.sender div').text(name);                     // 이름 추가
              chatLi2.find('.chat p').text(message);                   // 메세지 추가
              chatLi2.find('.chat p').addClass("message");
              chatLi2.find('.sender div').addClass(LR_className);
              chatLi2.find('.chat label').addClass("time");
              chatLi2.find('.chat label').text(unReadCount + sendTime);
         }else {
         chatLi.find('.chat').addClass(LR_className);                 // left : right 클래스 추가
         // find() : chatLi의 하위 요소 찾기
         chatLi.find('.sender div').text(name);                  // 이름 추가
         chatLi.find('.chat p').text(message);                   // 메세지 추가
         chatLi.find('.chat p').addClass("message");
         chatLi.find('.sender div').addClass(LR_className);
         chatLi.find('.chat label').addClass("time");
         chatLi.find('.chat label').text(sendTime);
         }
        
         //console.log(chatLi);
         
         return [chatLi, chatLi2];
    };
   </script>   

   <!-- 방 내용 실시간으로 불러오기  -->
   <script>
   $(window).on('load', function(){
       // 초기에도 채팅 목록 불러오기
	   clickDiv();
       countAll();
   });
   
   function clickDiv() {
       var clickedDiv = null;

       // 클릭한 div 요소의 배경을 pink로 변경
       $(".chatList").on('click', '.chatList_box', function() {
           // 이전에 클릭한 div의 배경을 원래대로 돌리기
           if (clickedDiv !== null) {
               clickedDiv.css('background-color', '');
           }

           // 현재 클릭한 div의 배경을 pink로 변경
           $(this).css('background-color', 'pink');
        
           // 클릭한 div 정보 저장
           clickedDiv = $(this);
       });
    }

   function countAll() {
	   $.ajax({
		  	url  : "count.all",
		  	data : {email : "${sessionScope.loginMember.email}"},
		  	success : function(countAllUnReadMessage) {
		  		let countAll = document.querySelector(".tooltip");
		  		countAll.innerText = countAllUnReadMessage;
		  	},
		  	error : function() {
		  		console.log("전체 카톡 수 불러오기 실패 ㅎ.,.,,");
		  	}
	   });
   }
   
   function countRoomAll() {
	   $.ajax({
		  	url  : "countRoom.all",
		  	data : {email : "${sessionScope.loginMember.email}"},
		  	success : function(countRoomUnRead) {
		  		let countRoomAll = document.querySelector(".countMessage");

		  		 $('.chatList_box').each(function(index) {
			  	        let idValue = $(this).attr('id');
			  	  });
		  		 
		  		for(let i = 0; i < countRoomUnRead.length; i++) {
		  			room = countRoomUnRead[i].roomNo;
		  			let	countMessage = $("#" + room).find(".countMessage");
		  			countMessage.addClass("count");
		  			countMessage.text(countRoomUnRead[i].unReadMessage);
		  		}

		  	},
		  	error : function() {
		  		console.log("방 별 카톡 수 불러오기 실패.,.,,");
		  	}
	   });
   }
   </script>
   
   <script>
   let elementId;
   $(".chatList").on("click", ".chatList_box", function() {
      
      $(".chatList_box").not(this).css("background-color", "white");
      $(this).css("background-color", "pink");
        
      elementId = $(this).attr("id");
      //alert(elementId);
   });

	 // 2초에 한번씩 채팅 목록 불러오기
	 setInterval(function(){
	      $(".chatList").html("");
	      // 방 목록 불러오기
	      countRoomAll();
	      getRoomList(); 
	      countAll();
	      $("#" + elementId).css("background-color", "pink");
	 }, 1000);
	  
	 
   <!-- 나가기 버튼 홈화면으로 돌려줌-->
   function Home() {
       location.href="http://localhost:8081/mbting";
   };
      
   function deleteMessage(button) {
	   if(confirm("채팅방 메시지가 모두 사라집니다. 정말로 나가시겠습니까?")){  
		 
		 var masterEmail = $(button).closest('table').find("input[type='hidden'][id='deleteMasterEmail']").val();
		 var userEmail = "${sessionScope.loginMember.email}";
		 
		 $.ajax({
			url : "delete.mes",
			data : {"masterEmail" : masterEmail , "userEmail" : userEmail},
			success : function() {
				location.href="http://localhost:8081/mbting/convert.ch"; 
			},
			error : function() {
				console.log("메시지 삭제 실패함 ㅠ ");
			}
			
		 });
		 
		}else{
		    location.href="http://localhost:8081/mbting/convert.ch"; 
		}
   };
   </script>
</body>
</html>