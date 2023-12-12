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

/*------------검색바-------------------*/
.searchBar input {
    width : 300px;
    height: 45px;
    border-top-left-radius: 20px;
    border-bottom-left-radius: 20px;
    padding: 6px;
    padding-left: 10px;
  }

.searchBar {
    text-align: center;
    border-bottom: 50px;
    border-right: 0px;
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

/*검색바*/
 #searchButton {
  border-top-right-radius: 20px;
  border-bottom-right-radius: 20px;
  height: 45px;
  border-left: 0px;
  width : 60px;
  box-sizing: border-box;
 }
</style>
</head>

<body>

	<!-- 메뉴바 header -->
	<jsp:include page="../common/header.jsp"/>
		
    <div class="wrap">
        <p class="title">MBTIng 회원들</p>
        <div class="searchBar"><p><input type="text" placeholder="원하시는 회원의 정보를 검색해보세요."><button id="searchButton">검색</button></p></div>
        <div class="user__container">
        
		</div>
	</div>
  
  <script>
  
  	$(function() {
  		
  		
  		$.ajax({
  			url  : "all.memList" , 
  			type : "get" , 
  			success : function(mem) {
  				resultStr = "";
  				
  				console.log(mem);
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
  				console.log("멤버 전체 조회에 실패했습닏.");	
  			}
  		});
  	});
  	
  </script>
        
  <script>
	function requestMatch(e) {
		alert("채팅을 위한 신청을 완료했습니다. 수락을 대기해주세요 ");
		e.style.backgroundColor = "#f54d3e";
		e.innerText = "수락 대기중";
 	}
  </script>
</body>
</html>