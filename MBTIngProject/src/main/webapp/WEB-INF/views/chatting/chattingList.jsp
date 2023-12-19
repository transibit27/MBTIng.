<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.wrap {
	width : 1200px;
	margin: auto;
	font-family: 'NanumSquareBold';
}

.content_1  {
	width : 100%;
	margin: auto;
  	background-color: rgb(255,215,215);
  	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  	border-radius: 8px;
  	padding: 20px;
  	margin: 20px 0;
 	transition: transform 0.3s ease-in-out;
}

#div {
    margin: 0 !important;
    width: 100%;
    border: 1px solid lightgray;
}
.content_2 {
  padding-top : 20px;
  font-family: 'Gasoek One', sans-serif;
  width : 100%;
  border-radius: 15px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  margin: auto;
}

.title, .more {
  padding: 10px 15px;
  text-shadow: 3px 3px 5px white;
}


.user {
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
  padding: 10px 15px;
  height : 200px;
  border-bottom : 1px solid lightgray;
  padding : 20px;
}

.user__content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-grow: 1;
}

.user__container {
  display: flex;
  flex-direction: column;
}

.title {
  font-weight: 900;
  font-size: 1.3em;
  margin-bottom: 50px;
  text-align: center;
}

.name {
  font-weight: 800;
}

.mbti {
  font-size: .9em;
  color: #64696e;
}

.image {
  width: 200px;
  height: 200px;
  border-radius: 25px;
  margin-right: 15px;
}

.follow {
  border: none;
  border-radius: 25px;
  background-color: #0f1113;
  color: white;
  padding: 8px 15px;
  font-weight: 700;
}

.more {
  display: block;
  text-decoration: none;
  color: rgb(29, 155, 240);
  font-weight: 800;
}

.user:hover {
  background-color: white;
  border: 1px solid gray;
  transform: scale(1.05);
  border-radius: 50px;
}

.more:hover {
  background-color: white;
  border-radius: 0px 0px 15px 15px;
}

.follow:hover {
  background-color: #2c3136;
}

.introMe {
	/*border : 1px solid lightgray;*/
	width : 550px;
	height : 130px;
	padding-top : 45px;
}
/*----------프로필 사진 card 스타일-----------------*/

.image {
	margin-top : 35px;
}
.cardImage img {
    width : 160px;
    height : 160px; 
    border-radius: 100px;
    border: 2px solid lightgray;
}


.cardImage {
	 border-radius: 100px;
	 background-color: transparent;
}

.cardImage img:active {
 	 transform: scale(0.95) rotateZ(1.7deg);

}

/*-------------좋어요 버튼----------------*/
#button {
    padding: 0 15px 0 15px;
    border-radius: 10px;
    box-shadow: 0px 0px 5px 7px #e7413373;
    color: gray;
    font-size: 14px;
    border: none;
    display: flex;
    align-items: center;
    transition: all .5s ease-in-out;
    letter-spacing: 2px;
}
			
#button:hover {
    background-color: #f54d3e;
    transition: all .5s ease-in-out;
    box-shadow: 0px 0px 5px 3px #e7413373;
    color: white;
}
			
#button::before {
    content: "";
    background-image: url("data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB3aWR0aD0iNzUycHQiIGhlaWdodD0iNzUycHQiIHZlcnNpb249IjEuMSIgdmlld0JveD0iMCAwIDc1MiA3NTIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiA8cGF0aCBkPSJtMzc2LjMyIDU1Mi4zYy0wLjM4NjcyIDAtMC43ODEyNS0wLjAxNTYyNS0xLjE3MTktMC4wNTA3ODEtMS4wNzgxLTAuMDc0MjE5LTIuMTM2Ny0wLjI2NTYyLTMuMTU2Mi0wLjU0Njg4LTIuNzMwNS0wLjU5Mzc1LTUuMjkzLTEuODUxNi03LjM0MzgtMy43ODEybC0xMzcuNTQtMTI5LjY2Yy00NC40NTMtNDEuOTAyLTQ5LjQ4LTExNS40Ni0xMS4yMTUtMTYzLjk3IDE5LjA4Mi0yNC4xODQgNDUuNzctMzguNjk1IDc1LjE1Mi00MC44NTUgMjguOTMtMi4xMTcyIDU2Ljg2MyA4LjAzMTIgNzguNjggMjguNTk4bDYuMjY1NiA1LjkwMjMgNi4yNjU2LTUuOTAyM2MyMS44MzItMjAuNTcgNDkuODA1LTMwLjY5MSA3OC42OTEtMjguNTk4IDI5LjM4MyAyLjE2NDEgNTYuMDY2IDE2LjY3NiA3NS4xNDUgNDAuODU1IDM4LjI2MiA0OC41MTIgMzMuMjM0IDEyMi4wNy0xMS4yMTUgMTYzLjk3bC0xMzcuNTQgMTI5LjY3Yy0yLjk5MjIgMi44MTY0LTYuOTM3NSA0LjM3NS0xMS4wMjMgNC4zNzV6bS03Ny44MTItMzA3LjAxYy0xLjY5NTMgMC0zLjM5NDUgMC4wNjI1LTUuMTAxNiAwLjE4NzUtMjAuMjgxIDEuNDk2MS0zOC44NTIgMTEuNjkxLTUyLjI4MSAyOC43MTEtMjguMjE1IDM1Ljc3My0yNC42MTMgODkuOTEgOC4wMjczIDEyMC42OGwxMjYuODQgMTE5LjU5IDEyNi44NC0xMTkuNTljMzIuNjQ1LTMwLjc3MyAzNi4yNDYtODQuOTEgOC4wMjczLTEyMC42OC0xMy40MjItMTcuMDItMzEuOTg0LTI3LjIxNS01Mi4yNy0yOC43MTEtMTkuODI4LTEuNDY0OC0zOS4xMDUgNS42MjExLTU0LjI4NSAxOS45MzRsLTE3LjI4NSAxNi4yOTNjLTYuMTk1MyA1LjgzOTgtMTUuODU5IDUuODM5OC0yMi4wNDcgMGwtMTcuMjg1LTE2LjI5M2MtMTMuODcxLTEzLjA3OC0zMS4xNzYtMjAuMTE3LTQ5LjE4LTIwLjExN3oiIGZpbGw9IiNmZmYiLz4KPC9zdmc+Cg==");
    background-size: 100%;
    background-repeat: no-repeat;
    color: transparent;
    position: relative;
    width: 50px;
    height: 50px;
    display: block;
    margin-right: 5px;
    transition: all .9s ease-in-out;
}
			
#button:hover:before {
    background-image: url("data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB3aWR0aD0iNzUycHQiIGhlaWdodD0iNzUycHQiIHZlcnNpb249IjEuMSIgdmlld0JveD0iMCAwIDc1MiA3NTIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiA8cGF0aCBkPSJtMzY5Ljg0IDU1MC4yOGMwLjQ3MjY2IDAuNDcyNjYgMC45NDUzMSAwLjQ3MjY2IDAuOTQ1MzEgMC45NDUzMSA2NS4zNTUtNTEuNjIxIDE5My43LTE0OC4yMyAxOTMuNy0yNDkuMTEgMC01NS44ODMtNDUuNDY1LTEwMS4zNS0xMDEuMzUtMTAxLjM1LTM5Ljc4MSAwLTc0LjM1MiAyMy4yMDctOTAuOTI2IDU2LjgyOC0wLjQ3MjY2IDAuOTQ1MzEtMS40MjE5IDMuMzE2NC0xLjQyMTkgMy4zMTY0cy0wLjk0NTMxLTEuODk0NS0wLjk0NTMxLTIuMzY3MmMtMTYuMTAyLTM0LjA5LTUwLjY3Mi01Ny43Ny05MC45MjYtNTcuNzctNTUuODgzIDAtMTAxLjM1IDQ1LjQ2MS0xMDEuMzUgMTAxLjM0IDAgMTAxLjgyIDEyNy44NyAxOTcuMDEgMTkyLjI3IDI0OC4xNnoiIGZpbGw9IiNmZmYiLz4KPC9zdmc+Cg==");
    transition: all .9s ease-in-out;
    transform: rotate(-1turn);
}
			
.like {
    display : inline-block;
    margin-left: 80px;
}

/*---------------------------------검색바--------------------------------*/

 #searchTable {
 	text-align : center;
 	margin : auto;
	/*text-shadow: 2px 2px  white;*/
	font-size: 16px;
	font-weight: bold;
 }
 
 .select {
 	 width : 150px;
 	 padding: .8em .5em;
 	 border : none;
 	 font-family: 'Gasoek One', sans-serif;
 	 border-radius: 0px;
	 appearance: none;
	 border-radius : 50px;
	 text-align : center;
	 box-shadow: 0px 0px 3px 5px white;
	 cursor: pointer;
	 height : 50px;
	 margin : 10px;
 } 
 
  .select:hover {
  	background-color: #e6f0ff;
	transition: all .5s ease-in-out;
  }
 

 #genderCheck {
 	text-align : center;
 }
 
 .genderButton {
 	border : 0px;
 	background-color : transparent;
 	border-radius : 5px;
 }
 
  .borders {
	/*background-color: white;*/
	transition: all .5s ease-in-out;
  }

  #Men , #woMen{
	  padding: 8px 16px;
	  font-size: 14px;
	  color: black;
	  background-color: white;
	  border: none;
	  border-radius: 6px;
	  cursor: pointer;
	  transition: background-color 0.3s ease-in-out;
  }
  #Men:hover {
	background-color: skyblue;
	transition: all .5s ease-in-out;
  }
  #woMen:hover {
	background-color: pink;
	transition: all .5s ease-in-out;
  }

 #searchButton {
  display: inline-block;
  position: relative;
}

#searchButton button {
  position: relative;
  padding: 30px 60px; /* 버튼의 크기 및 간격을 조절할 수 있습니다. */
  border: none;
  background-color: transparent; /* 배경색을 투명하게 설정합니다. */
  cursor: pointer;
  left : 725px;
}

#searchButton button::before {
  content: '\2665'; /* 유니코드로 하트 모양을 나타냅니다. */
  font-size: 100px; /* 아이콘의 크기를 조절할 수 있습니다. */
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  color: white; /* 하트의 색상을 지정합니다. */
}

#searchButton button::after {
  content: '검색'; /* 추가하고자 하는 텍스트를 지정합니다. */
  display: block;
  position: absolute;
  left: 48%;
  top: 38%; /* 텍스트의 위치를 조절할 수 있습니다. */
  transform: translateX(-50%);
  font-size: 20px; /* 텍스트의 크기를 조절할 수 있습니다. */
  color : rgb(160, 160, 160);
}
</style>
</head>

<body>

	<!-- 메뉴바 header -->
	<jsp:include page="../common/header.jsp"/>
		
    <div class="wrap">
    <br><br><br>
    	<div class="content_1">
        <p class="title">MBTIng 회원들</p>
        
         <input type="hidden" value="N"  name="gender" id="gender">
        <div id="genderCheck">
        	<button id="Men"   class="genderButton " type="button" onclick="Gender(1);" >남</button>
        	<button id="woMen" class="genderButton " type="button" onclick="Gender(2);" >여</button>
        </div>	
        	<table id="searchTable">
        		<tr>
        			<td>키</td>
        			<td>거주지</td>
        			<td>나이</td>
        			<td>MBTI</td>
        		</tr>
        		<tr>
        			<td>
	        			<select name="height" class="select" onchange="searchPerson();">
	        				   <option value="없음">없음</option>
			    			   <option value="000160">160이하</option>
			    			   <option value="160165">160~165</option>
			    			   <option value="165170">165~170</option>
			    			   <option value="170175">170~175</option>
			    			   <option value="175180">175~180이상</option>
			    			   <option value="180250">180이상</option>
	    				</select>
        			</td>
        			<td>
        				<select name="address" class="select" onchange="searchPerson();">
        						<option value="없음">없음</option>
		    			   		<option value="서울특별시">서울특별시</option>
						   		<option value="부산광역시">부산광역시</option>
						   		<option value="대구광역시">대구광역시</option>
							    <option value="인천광역시">인천광역시</option>
							    <option value="광주광역시">광주광역시</option>
							    <option value="대전광역시">대전광역시</option>
							    <option value="울산광역시">울산광역시</option>
							    <option value="세종특별시">세종특별시</option>
							    <option value="경기도">경기도</option>
							    <option value="강원도">강원도</option>
							    <option value="충청북도">충청북도</option>
							    <option value="충청남도">충청남도</option>
							    <option value="전라북도">전라북도</option>
							    <option value="전라남도">전라남도</option>
							    <option value="경상북도">경상북도</option>
								<option value="경상남도">경상남도</option>
								<option id="jeju" value="제주도">제주도</option>
    					</select>
        			</td>
        			<td>
        				<select name="age" class="select" onchange="searchPerson();">
        					   <option value="없음">없음</option>
			    			   <option value="2025">20~25</option>
			    			   <option value="2530">25~30</option>
			    			   <option value="3035">30~35</option>
			    			   <option value="3540">35~40</option>
			    			   <option value="4045">40~45</option>
			    			   <option value="4550">45~50</option>
			    			   <option value="5099">50대이상</option>
    					</select>
        			</td>
        			<td>
        				<select name="mbti" class="select" onchange="searchPerson();">
        					   <option value="없음">없음</option>
			    			   <option value="INTP">INTP</option>
			    			   <option value="INTJ">INTJ</option>
			    			   <option value="INFP">INFP</option>
			    			   <option value="INFJ">INFJ</option>
			    			   <option value="ISTP">ISTP</option>
			    			   <option value="ISFP">ISFP</option>
			    			   <option value="ISTJ">ISTJ</option>
			    			   <option value="ISFJ">ISFJ</option>
			    			   <option value="ENTP">ENTP</option>
			    			   <option value="ENTJ">ENTJ</option>
			    			   <option value="ESTP">ESTP</option>
			    			   <option value="ESTJ">ESTJ</option>
			    			   <option value="ENFP">ENFP</option>
			    			   <option value="ENFJ">ENFJ</option>
			    			   <option value="ESFP">ESFP</option>
			    			   <option value="ESFJ">ESFJ</option>
    					</select>
        			</td>
        		</tr>
    		</table>
	</div>
    
    <div id="div"></div>
    

	<div class="content_2">	
		<div class="user__container">
        	
		</div>
		<div id="hiddenDiv" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: white; padding: 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
			  <p>아하하 안녕하세요 저는 카리나 입니다. 아하하 </p>
			  <button id="hiddenDivCloseBtn">닫기</button>
		</div>
	</div>

   </div> 

   
   <!-- gender를 처리하기 위한 script -->
   <script>
   	function Gender(num) {
   		if(num == 1) {
   			$("#gender").val("M"); 
   			$("#Men").addClass("borders");
   			$("#woMen").removeClass("borders");
   			searchPerson();
   		}else {
   			$("#gender").val("F"); 
   			$("#woMen").addClass("borders");
   			$("#Men").removeClass("borders");
   			searchPerson()
   		}	
   	}        
   	                       
   </script>
  
  
  <!-- memberList를 불러오기 위한 script -->
  <script>
  
  	$(function() {
  		personDetail();
  		selectAllMemberList();
  	});
  	
  	function selectAllMemberList() {
  		
  		$.ajax({
  			url  : "all.memList" , 
  			type : "get" , 
  			success : function(mem) {
  				resultStr = "";
  				//console.log(mem);
  				for(let i in mem) {
 				
					 resultStr +=  "<div class='user' id='user" + mem[i].userNo + "'>" +
					 			 	"<div class='image'>" + 
					 			 		"<div class='cardImage'>" +
					 			 			"<img src='${pageContext.request.contextPath}" + mem[i].profileImg +   "'>" +
						  				"</div>" +
						  			"</div>" +
						  			"<div class='user__content'>" +
						  			 "<div class='text'>" +
						  			 "<span class='name'>" + mem[i].userName + "<p class='mbti'>" + mem[i].mbti + "</p></span>" +
						  			 "</div>" +
						  			 "<div class='introMe'>" + mem[i].address + "에 사는 " + mem[i].age + "살 이에요" + "</div>" +
						  			 "<div class='like'><button id='button' onclick='requestMatch(this , " + mem[i].userNo + ");' ><span>채팅신청</span></button></div>" +
						  			 "</div>" +
						  			 "</div>"
						  			 
						  $(".user__container").html(resultStr);	

  				}
  				
  				checkReceiver();
  		  		checkProposer();
  		  		checkMatching();
  		  		
  			},
  			error : function() {
  				console.log("멤버 전체 조회에 실패했습니다.");	
  			}
  		});
  	}
  	
  	<!--사람을 검색한 값을 넘겨주는 function-->
  	function searchPerson() {
  		$.ajax({
  			url : "search.li" ,
  			type : "get",
  			data : {"height" : $('select[name="height"]').val(),
  					"age" 	 : $('select[name="age"]').val(),
  					"address": $('select[name="address"]').val(),
  					"mbti"	 : $('select[name="mbti"]').val(),
  					"gender" : $('input[name="gender"]').val(),
  					"userNo" : ${sessionScope.loginMember.userNo},
  					"email"  : "${sessionScope.loginMember.email}"
  			},
  			success : function(searchMem) {
  				//console.log(searchMem);
  				if(searchMem == "") {
  					 $(".user__container").html("<h1 style='margin : auto;'> 일치하는 회원이 없습니다. </h1>");
  				}else {
  				
  				resultStr = "";
  				
  				for(let i in searchMem) {
  					 //$('.content_2').children().remove();
  					 console.log(searchMem);
					 resultStr +=  "<div class='user' id='user" + searchMem[i].userNo + "'>" +
					 			 	"<div class='image'>" + 
					 			 		"<div class='cardImage'>" +
					 			 			"<img src='${pageContext.request.contextPath}" + searchMem[i].profileImg +   "'>" +
						  				"</div>" +
						  			"</div>" +
						  			"<div class='user__content'>" +
						  			 "<div class='text'>" +
						  			 "<span class='name'>" + searchMem[i].userName + "</span>" +
						  			 "<p class='mbti'>" + searchMem[i].mbti + "</p>" +
						  			 "</div>" +
						  			"<div class='like'><button id='button' onclick='requestMatch(this , " + searchMem[i].userNo + ");' ><span>채팅신청</span></button></div>" +
						  			 "</div>" +
						  			 "</div>"
						  			 
						  $(".user__container").html(resultStr);
  				}
  				
  			 }
  				checkReceiver();
  		  		checkProposer();
  		  		checkMatching();
  			},
  			error : function() {
  				console.log("검색 회원 조회에 실패했습니다.");
  			}
  		}); 		
  	}

	
  </script>
        
  <script>
	function requestMatch(e , num) {
		
		let receiverNo;
		
		if(e.innerText == '수락') {
			
			receiverNo = ${sessionScope.loginMember.userNo};
			proposerNo = num;
			
			$.ajax({
	             type: "GET",
	             url: "accept.me",
	             data: {"receiverNo" : receiverNo, "proposerNo" : proposerNo},
	             success: function(response) {
	            	 console.log("하하 성공");
	            	 e.style.backgroundColor = "#DDDEA5";
	            	 e.style.color = "gray";
	            	 e.innerText = "채팅하기";
	            	 location.href="http://localhost:8081/mbting/convert.ch";
	             },
	
	             error: function() {
	                 // 에러 처리
	                 alertify.error('Error occurred while processing the request.');
	             }
        });
			
		}else if(e.innerText == '수락 대기중'){
			$.ajax({
				type : "POST",
				url  : "cancle.mat",
				data : {"proposerNo" : ${sessionScope.loginMember.userNo}, "receiverNo" : num },
				success : function(response) {
					
					 if (response.success) {
	                      // 성공 메시지 표시
	                      alertify.alert('Alert', response.message, function() {
	                            alertify.success('Ok');
	                      });
	                      e.style.backgroundColor = "";
	                      e.innerText = "채팅신청";
	                      
					 }else {
						  alertify.alert('Alert', response.message, function() {
	                            alertify.error('Error');
	                      });
					 }   
	                      

				},
				error : function() {
					console.log("취소 실패");
				}
			});
			
		}else if(e.innerText == '채팅하기'){
			location.href="http://localhost:8081/mbting/convert.ch";
		}else {
			
			receiverNo  = num;
			$.ajax({
	             type: "GET",
	             url: "updateMatchRequestList.mb",
	             data: {"receiverNo" : receiverNo},
	             success: function(response) {
	            	 //console.log("하하 성공");
	                 if (response.success) {
	                     // 성공 메시지 표시
	                     alertify.alert('Alert', response.message, function() {
	                         alertify.success('Ok');
	                     });
						
	             		e.style.backgroundColor = "#f54d3e";
	            		e.innerText = "수락 대기중";
	
	                     // 코인 수 업데이트
	                     var matchCoin = Number('${sessionScope.matchCoin}') - 1;
	                     // 세션의 matchCoin 값을 업데이트하는 코드를 추가해야 합니다.
	                     // 예: sessionScope.matchCoin = matchCoin;
	                 } else {
	                     // 실패 메시지 표시
	                     alertify.alert('Alert', response.message, function() {
	                         alertify.error('Error');
	                     });
	
	                     // 코인 부족 시 처리
	                     if (response.message.includes("코인 부족")) {
	                         alert("코인이 부족합니다. 코인 충전 후 다시 시도해 주세요.");
	                     }
	                 }
	             },
	
	             error: function() {
	                 // 에러 처리
	                 alertify.error('Error occurred while processing the request.');
	             }
         });
		}
 	}
  </script>
  
  <script>
  	function personDetail() {
	  // 이미지 클릭 시 이벤트 처리
	  $(".user__container").on("click", ".image img", function() {
	    // 클릭한 이미지의 인덱스를 가져옴
	    var index = $(this).index();

	    // 미리 만들어진 div 요소의 ID
	    var divId = "hiddenDiv";

	    // 모든 이미지의 투명도를 초기화
	    $(".user__container .image img").css("opacity", "1");

	    // 선택한 이미지의 투명도를 조절
	    $(this).css("opacity", "0.5");

	    // 미리 만들어진 div 요소를 보이게 함
	    $("#" + divId).show();
	  });

	  // div 닫기 버튼 클릭 시 이벤트 처리
	  $("#hiddenDivCloseBtn").on("click", function() {
	    // 미리 만들어진 div 요소를 숨김
	    $("#hiddenDiv").hide();

	    // 모든 이미지의 투명도를 초기화
	    $(".user__container .image img").css("opacity", "1");
	  });
	  
	  }
  	
  	  function checkProposer() {
  		  $.ajax({
  			 url : "check.pro",
  			 data : {"userNo" : ${sessionScope.loginMember.userNo}},
			 success : function(proposerNoList) {
				 
				 for(let i in proposerNoList) {
					 const button = $("#user" + proposerNoList[i].receiverNo).find("button");
					 button.css("background-color", "#f54d3e");
					 button.text("수락 대기중");
				 }
				 
			 }, 
			 error : function() {
				 console.log("내가 신청한 회원 정보 불러오기 실패...");
			 }
  		  });
  	  }
  	  
  	  function checkReceiver() {
  		$.ajax({
 			 url : "check.rec",
 			 data : {"userNo" : ${sessionScope.loginMember.userNo}},
			 success : function(receiverNoList) {
				 //console.log("나한테 신청 온 사람들");
				 //console.log(receiverNoList);
				 for(let i in receiverNoList) {
					 const button = $("#user" + receiverNoList[i].proposerNo).find("button");
					 button.css("background-color", "#94B9F3");
					 button.css("box-shadow", "0px 0px 5px 3px #AAB59E");
					 button.text("수락");
				 }
				 
			 }, 
			 error : function() {
				 console.log("나한테 요청한 회원 정보 불러오기 실패...");
			 }
 		  });
  	  }
  	  
  		function checkMatching() {
  		$.ajax({
 			 url : "check.mat",
 			 data : {"userNo" : ${sessionScope.loginMember.userNo}},
			 success : function(matchingList) {
				// console.log("매칭리스트" + matchingList[0].receiverNo);
						 
				 for(let i in matchingList) {
					 
					 let matchPerson = (${sessionScope.loginMember.userNo} == matchingList[i].proposerNo ) ? matchingList[i].receiverNo : matchingList[i].proposerNo;
					 
					 //console.log("나랑 매칭된 사람 번호임 :" +  matchPerson);
					
					 const button = $("#user" + matchPerson).find("button");
					
					 button.css("background-color", "#DDDEA5");
					 button.css("box-shadow", "0px 0px 5px 3px #AAB59E");
					 button.css("color", "white");
					 button.text("채팅하기");
					 
				 }
				 
			 }, 
			 error : function() {
				 console.log("함께 매칭된 사람들 요청 실패...");
			 }
 		  });
  	  }

  </script>

</body>
</html>