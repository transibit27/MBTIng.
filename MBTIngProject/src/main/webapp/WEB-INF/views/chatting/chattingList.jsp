<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.wrap {

	width : 1500px;
	margin: auto;
}
.content_1  {
	border : 2px solid lightgray;
	width: 1500px;
	margin: auto;
	border-radius : 20px;
}

.content_2 {
  font-family: 'Gasoek One', sans-serif;
  width: 1500px;
  background: #E8EAEA;
  border-radius: 15px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  margin: auto;
}

.title, .more {
  padding: 10px 15px;
}

.user {
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
  padding: 10px 15px;
  height : 200px;
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

/*----------프로필 사진 card 스타일-----------------*/

.cardImage img {
    width : 200px;
    height : 200px; 
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
    padding: 0 20px 0 10px;
    border-radius: 10px;
    box-shadow: 0px 0px 5px 7px #e7413373;
    color: lightgray;
    font-size: 17px;
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
 }
 
 .select {
 	 width : 200px;
 	 padding: .8em .5em;
 	 border: 1px solid #999;
 	 font-family: 'Gasoek One', sans-serif;
 	 border-radius: 0px;
	 appearance: none;
	 border-radius : 50px;
	 text-align : center;
 } 
 
 #genderCheck {
 	text-align : center;
 }
 
 .genderButton {
 	border : 0px;
 	background-color : transparent;
 }
 
  .genderButton img {
  	width : 50px;
  	height : 50px;
  }

  #searchButton {
  	text-align  : center;
  	margin : 10px;
  }
  
  .borders {
  	border : 1px solid black;
  	background-color : pink;
  	border-radius : 20px;
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
        	<button id="Men" class="genderButton " type="button" onclick="Gender(1);">남</button>
        	<button id="woMen" class="genderButton " type="button" onclick="Gender(2);">여</button>
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
	        			<select name="height" class="select">
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
        				<select name="address" class="select">
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
        				<select name="age" class="select">
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
        				<select name="mbti" class="select">
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
    		<div id="searchButton"><button type="submit" onclick="searchPerson();"> 검색 </button></div>
	</div>

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
   		}else {
   			$("#gender").val("F"); 
   			$("#woMen").addClass("borders");
   			$("#Men").removeClass("borders");
   		}	
   	}        
   	                       
   </script>
  
  
  <!-- memberList를 불러오기 위한 script -->
  <script>
  
  	$(function() {
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
 				
					 resultStr +=  "<div class='user'>" +
					 			 	"<div class='image'>" + 
					 			 		"<div class='cardImage'>" +
					 			 			"<img src='${pageContext.request.contextPath}" + mem[i].profileImg +   "'>" +
						  				"</div>" +
						  			"</div>" +
						  			"<div class='user__content'>" +
						  			 "<div class='text'>" +
						  			 "<span class='name'>" + mem[i].userName + "</span>" +
						  			 "<p class='mbti'>" + mem[i].mbti + "</p>" +
						  			 "</div>" +
						  			 "<div class='like'><button id='button' onclick='requestMatch(this);' ><span>채팅신청</span></button></div>" +
						  			 "</div>" +
						  			 "</div>"

						  $(".user__container").html(resultStr);
						  
  				}
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
  					"gender" : $('input[name="gender"]').val()
  			},
  			success : function(searchMem) {
  				
  				if(searchMem == "") {
  					 $(".user__container").html("<h1 style='margin : auto;'> 일치하는 회원이 없습니다. </h1>");
  				}else {
  				
  				resultStr = "";
  				
  				for(let i in searchMem) {
  					 //$('.content_2').children().remove();
  					 
					 resultStr +=  "<div class='user'>" +
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
						  			 "<div class='like'><button id='button' onclick='requestMatch(this);' ><span>채팅신청</span></button></div>" +
						  			 "</div>" +
						  			 "</div>"

						  $(".user__container").html(resultStr);
  				}
  			 }
  			},
  			error : function() {
  				console.log("검색 회원 조회에 실패했습니다.");
  			}
  			
  		});
  		
  	}
  </script>
        
  <script>
	function requestMatch(e) {
		alert("채팅을 위한 신청을 완료했습니다. 수락을 대기해주세요 ");
		e.style.backgroundColor = "#f54d3e";
		e.innerText = "수락 대기중";
 	}
  </script>
  
  <script>
  $(document).ready(function() {
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
	});
  </script>
</body>
</html>