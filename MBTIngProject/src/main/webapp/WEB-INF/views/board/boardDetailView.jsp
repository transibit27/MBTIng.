<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList, com.kh.mbting.board.model.vo.BoardImg" %>
<% 
    ArrayList<BoardImg> list = (ArrayList<BoardImg>)request.getAttribute("list");
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MBTIng - 만남후기</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Single+Day&display=swap" rel="stylesheet">
    <style>
        body * {
            font-family: 'Noto Sans KR', sans-serif;
        }
        .outer {
            width: 100%;
            margin: auto;
            margin-top: 10px;
        }
        .reviewbanner {
            width: 100%;
            height: 150px;
            margin: auto;
            background-image:url(https://images.unsplash.com/photo-1480623826718-27e89ac63a4f?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D);
            background-position: center center;
            background-size: cover;
        }
        .reviewbanner-text {
            width: 1200px;
            height: 150px;
            text-align: center;
            line-height: 150px;
            color: white;
            font-size: xx-large;
        }
        .reviewdetail-top-button {
            width: 1200px;
            margin: auto;
        }
        .reviewdetail-top-button button {
            width: 65px;
            height: 30px;
            border: none;
            border-radius: 5px;
            background-color: pink;
        }
        .reviewdetail-top-button button:hover {
            border: 1px solid pink;
            background-color: white;            
        }
        .reviewdetail-area {
            width: 1200px;
            margin: auto;
        }
        .reviewdetail-table {
            width: 300px;
            border-bottom: 2px solid pink;
        }
        .reviewdetail-table *{
        	font-family: 'Single Day', cursive;
            font-size:large;
            font-weight: bold;
        }
        .reviewdetail-table td {
            width: 150px;
        }
        .reviewdetail-table-title {
            font-size: xx-large;
            font-weight: bold;
        }
        .thumbnail-img {
            width: 33%;
        }
        .reviewdetail-content p {       
            white-space: pre-wrap;
        }
        .content-img {
            width: 250px;
        }
        .reviewdetail-like {
            font-family: 'Single Day', cursive;
            font-size: x-large;
            font-weight: bold;
        }
        .reviewdetail-bottom-button {
            width: 1200px;
            margin: auto;            
        }
        .reviewdetail-bottom-button button {
            width: 65px;
            height: 30px;
            border: none;
            border-radius: 5px;
            background-color: pink;
        }
        .reviewdetail-bottom-button button:hover {
            border: 1px solid pink;
            background-color: white;            
        }
        .move-page {
            width: 1200px;
            margin: auto;
        }
    </style>
</head>
<body>

    <jsp:include page="../common/header.jsp" />

    <div class="outer">
        <div class="reviewbanner" align="center">
            <div class="reviewbanner-text">
                <p>만남후기</p>
            </div>
        </div>
        
        <br>

        <div class="reviewdetail-top-button" align="right">
            <button onclick="location.href='list.bo';">목록</button>
        </div>
        <div class="reviewdetail-area">
            <table class="reviewdetail-table">
                <tr>
                    <td colspan="2" class="reviewdetail-table-title">${ requestScope.b.boardTitle }</td>
                </tr>
                <tr>
                    <td>💑${ requestScope.b.mbtiNick }</td>
                    <td>${ requestScope.b.enrollDate }</td>
                </tr>
                <tr>
                    <td colspan="2">조회수 : ${ requestScope.b.views }</td>
                </tr>
            </table>

            <br>

            <div class="reviewdetail-content">

                <br>

                <div align="center">
                    <img src="<%= contextPath %>/<%= list.get(0).getChangeName() %>" class="thumbnail-img">
                </div>

                <br><br>

                <table align="center">
                    <tr>
                    <% for(int i = 1; i < list.size(); i++) { %>
                        <td>
                            <img src="<%= contextPath %>/<%= list.get(i).getChangeName() %>" class="content-img">
                        </td>
                    <% } %>
                    </tr>
                </table>

                <br><br>

                <p>${ requestScope.b.boardContent }</p>
            </div>
            <div class="reviewdetail-like" align="center">
            
            	<!-- 좋아요 기능 작성 영역 -->
            	<c:if test="${empty sessionScope.loginMember}">
            		❤️<br>
            		${ requestScope.b.thumbCount }
            	</c:if>


            </div>

            <br>

        </div>
        <div class="reviewdetail-bottom-button" align="right">
            <c:if test="${ not empty sessionScope.loginMember and sessionScope.loginMember.userNo eq requestScope.b.userNo }">
				<button onclick="postFormSubmit(1);">수정</button>
                <button onclick="postFormSubmit(2);">삭제</button>
                <form id="postForm" action="" method="post">
                    <input type="hidden" name="bno" value="${ requestScope.b.boardNo }">
                </form>
                <script>
                    function postFormSubmit(num) {
                        if(num == 1) {
                            $("#postForm").attr("action", "updateForm.bo").submit();
                        } else {
                            $("#postForm").attr("action", "delete.bo").submit();
                        }
                    }
                </script>
            </c:if>
        </div>

        <br><br><br>

        <div class="move-page" align="center">
           <table class="move-page-table">
                <tr onclick="location.href='detail.bo?bno=${ requestScope.b.boardNo - 1 }';">
                    <td class="move-page-info">
                        ▲ 이전 후기
                    </td>

                </tr>
                <tr style="border-top: 1px dotted pink;" onclick="location.href='detail.bo?bno=${ requestScope.b.boardNo + 1}';">
                    <td class="move-page-info">
                        ▼ 다음 후기
                    </td>
                </tr>
            </table>
        </div>

        <br>

    </div>

    <jsp:include page="../common/footer.jsp" />

</body>
</html>