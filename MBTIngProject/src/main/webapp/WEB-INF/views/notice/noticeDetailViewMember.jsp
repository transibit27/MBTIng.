<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<!-- 아이콘 추가 -->
<script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>

</head>

<style>
    .noticeBanner {
        position: relative; /* 부모 요소를 상대 위치로 설정 */
        width: 100%;
        height: 150px;
        overflow: hidden; /* 오버플로우를 숨기기 위해 추가 */
    }

    .noticeBanner h3 {
        position: absolute; /* 절대 위치로 설정 */
        font-size: 30px;
        font-weight: bold;
        top: 50%; /* 부모 요소의 중앙에 배치하기 위해 50%로 설정 */
        left: 50%; /* 부모 요소의 중앙에 배치하기 위해 50%로 설정 */
        transform: translate(-50%, -50%); /* 세로 및 가로 중앙에 정렬 */
        color: white; /* 텍스트 색상을 보이게 하기 위해 추가 */
        z-index: 1; /* 텍스트가 이미지 위에 오도록 설정 */
    }

    .noticeBanner img {
        width: 100%;
        height: 100%; /* 이미지의 높이를 100%로 설정하여 부모 요소에 맞게 조정 */
        object-fit: cover; /* 이미지를 확장하여 부모 요소를 완전히 채우도록 설정 */
    }

    .notice-innerOuter {
        /* border:1px solid lightgray; */
        width: 1000px;
        margin:auto;
        margin-top: 40px;
        padding: 30px;
    }

    .notice-table {
        width: 100%;
    }

    .notice-list {
        width: 100px;
        font-size: 14px;
        color: black;
        text-align: center;
        text-decoration: none;
        padding: 3px 10px;
        border: 0;
        border-radius: 5px;
        transition: color 0.3s ease; /* 텍스트 색상이 0.3초 동안 서서히 변하도록 설정 */
        float: left;
        margin-bottom: 40px;
    }

    .notice-list:hover {
        cursor: pointer;
        color: rgb(125, 125, 125);
    }

    .notice-name {
        background-color: #f2f2f2;
        border-radius: 5px;
        padding: 25px 40px;
        margin-top: 20px;
    }
    
</style>

<body>

	<jsp:include page="../common/header.jsp" />
	
    <div class="noticeBanner">
        <h3>공지사항</h3>
        <img src="./resources/images/NoticeBanner.jpg" alt="">
    </div>

	<div class="notice-content">
		
		<div class="notice-innerOuter">
		
			
			
			<table id="contentArea" align="center" class="notice-table">
			<a class="notice-list" href="listMember.no" style="text-decoration: none;"><i class="fas fa-chevron-left"></i>&nbsp; 목록으로</a>
				<tr>
					<th style="font-size: 18px;"> &nbsp;&nbsp;${ requestScope.n.noticeTitle }</th>
					<td colspan="3" style="float: right; font-size: 14px; margin-right: 10px;">${ requestScope.n.enrollDate }</td>
				</tr>
				<tr>
					<td colspan="4">
						<p class="notice-name">
							${ requestScope.n.noticeName }
						</p>
					</td>
				</tr>
			</table>
			
		</div>
        <br><br><br><br>	
	</div>

	<jsp:include page="../common/footer.jsp" />

</body>
</html>