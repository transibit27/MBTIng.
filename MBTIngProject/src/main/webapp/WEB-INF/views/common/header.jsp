<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
   
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	  
	<!-- 부트스트랩때문에 연결함 -->
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	
	<!-- Popper JS -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
	
	<!-- swiper.js 라이브러리추가 (cdn) -->
	    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
	    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
	    
	<!-- 글씨체 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap" rel="stylesheet">

  
    <style>
        div {box-sizing:border-box;}
        
        #header {
            width:100%;
            height:100px;
            padding-top:20px;
            margin:auto;
            background-color: rgb(255, 255, 255);
        }

        #header>div {width:100%; margin-bottom:10px;}
        #header_1 {height:40%;}
        #header_2 {height:60%;}

        #header_1>div{
            height:100%;
            float:left;
        }
        #header_1_left {width:20%; position:relative;}
        #header_1_center {width:50%;}
        #header_1_right {width:30%;}

        #header_1_left>img {height:100px; position:absolute; margin:auto; top:30px; bottom:0px; right:0px; left:0px;}
        #header_1_right {text-align:center; line-height:35px; font-size:12px; text-indent:35px; font-family: 'Sunflower', sans-serif;}
        #header_1_right>a {margin:5px;}
        #header_1_right>a:hover {cursor:pointer; color: pink;}

        #header_1_center>ul {width:100%; height:100%; list-style-type:none; margin:auto; padding:0;}
        #header_1_center>ul>li {float:left; width:14%; height:100%; line-height:55px; text-align:center;}
        #header_1_center>ul>li a {text-decoration:none; color:black; font-size:17px; font-weight:900; font-family: 'Sunflower', sans-serif;}
        #header_1_center>ul>li a:hover {color : pink; font-size:20px;}
        #header_1_center {}

        #header a {text-decoration:none; color:black; }

        /* 세부페이지마다 공통적으로 유지할 style */
        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
		
		#profile{
			width  : 30px;
			height : 30px;
		}
		
		#loggo {
		 width : 150px;
		 height : 300px;
		}
		
		#profile {
		width : 50px;
		height : 50px;
		}
		

    </style>
</head>


<body>

    <div id="header">
        <div id="header_1">
            <div id="header_1_left">
               <img id="loggo" src="${pageContext.request.contextPath}/resources/images/mbtingLoggo2.png" alt=""> 
            </div>
            <div id="header_1_center">	 
	             <ul>
	                <li><a href="">HOME</a></li>
	                <li><a href="">INTRODUCE</a></li>
	                <li><a href="">이용안내</a></li>
	                <li><a href="">만남후기</a></li>
	                <li><a href="">연애테스트</a></li>
	                <li><a href="">고객센터</a></li>
	            	<li><a href="">신청하기(매칭)</a></li>
	            </ul>    	
	        </div>
	            
            <div id="header_1_right">
            
            <c:choose>
                <c:when test="${empty sessionScope.loginMember and empty sessionScope.nickname}">
	                <a href="enrollForm.me">회원가입</a>
	                <a data-toggle="modal" data-target="#loginModal">로그인</a> <!-- 모달의 원리 : 이 버튼 클릭시 data-target에 제시되어있는 해당 아이디의 div요소를 띄워줌 -->
                </c:when>
               	<c:otherwise>
               		<c:choose>
               		
	               		<c:when test="${not empty sessionScope.loginMember}">
	               			
		               		<label>${sessionScope.loginMember.memberName}님 환영합니다</label> &nbsp;&nbsp;
		                    <a href="myPage.me">마이페이지</a>
		                    <a href="logout.me">로그아웃</a>
	               		</c:when>
               		
               			<c:otherwise>
               		
               				<table>
				                   <tr>
				                   	<td><label>${sessionScope.nickname}님 환영합니다</label> &nbsp;&nbsp; </td>
				                 
					                <td><img id="profile" src="${sessionScope.profile}" ></td>
					                <td> <a href="myPage.me">마이페이지</a></td>
					                <td> <a href="https://kauth.kakao.com/oauth/logout?client_id=670371a54748d4645ec474b68405a19c&logout_redirect_uri=http://localhost:8081/mbting/logout.me">로그아웃</a> </td>
				               	   </tr>
			               	</table>
	               	 	</c:otherwise>
               	 	</c:choose>
                </c:otherwise>
               </c:choose>
           </div>
        </div>
    </div>


    <!-- 로그인 클릭 시 뜨는 모달 (기존에는 안보이다가 위의 a 클릭 시 보임) -->
    <div class="modal fade" id="loginModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Login</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <form action="login.me" method="post">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <label for="userId" class="mr-sm-2">ID : </label>
                        <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter ID" id="userId" name="memberId"> <br>
                        <label for="userPwd" class="mr-sm-2">Password : </label>
                        <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter Password" id="userPwd" name="memberPwd">
                    	<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=670371a54748d4645ec474b68405a19c&redirect_uri=http://localhost:8081/mbting/kakaoLog.me"><img style="display : block; margin : auto;" src="${pageContext.request.contextPath}/resources/images/kakaoLoginSmall.png"></a>
                    </div>
                           
                           
                           
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">로그인</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
     <!--<br clear="both">-->
</body>
</html>