<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#boardList {text-align:center;}
    #boardList>tbody>tr:hover {cursor:pointer;}

    #pagingArea {width:fit-content; margin:auto;}
    
    #searchForm {
        width:500px;
        margin:auto;
    }
    #searchForm>* {
        margin:5px;
    }
    .select {width:20%;}
    .text {width:53%;}
    .searchBtn {width:20%;}
    
    .content {
    	margin-left: 250px;
    	margin-top: 100px;
    }
    .btn-primary, .btn-danger {
    	width: 100px;
    	margin-bottom: 30px;
    	float: right;
    }
    
</style>
</head>
<body>

	<jsp:include page="../common/adminMenubar.jsp" />
	
	<div class="content">
	
	<div class="search">

          <form id="searchForm" action="" method="get">
              <div style="display: flex; align-items: center; margin-top: 40px">
                  <input class="form-control mr-sm-2" type="text" placeholder="Search" id="searchbar" name="keyword">
                  <button id="searchButton" class="btn btn-outline-success" type="submit">Search</button>
              </div>
          </form>

    </div>
	
	
	
		
		<div class="innerOuter" style="padding:1% 8%;">
			<button type="button" class="btn btn-danger">삭제</button>
			<button type="button" class="btn btn-primary" onclick="location.href='enrollForm.no'">등록</button>
          
		
		<table id="noticeList" class="table table-hover" align="center">
			<thead>
				<tr>
					<th><input type="checkbox" class="checkbox"></th>
					<th>순번</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="n" items="${ requestScope.list }">
					<tr>
						<th><input type="checkbox" class="checkbox"></th>
						<th class="nno">${ n.noticeNo }</th>
						<th>${ n.noticeTitle }</th>
						<th>${ n.views }</th>
						<th>${ n.enrollDate }</th>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<script>
    $(function() {
        // 버튼 클릭 시 동작할 함수
        $("#searchButton").click(function() {
            // searchbar의 값을 가져와서 소문자로 변환
            var searchTerm = $("#searchbar").val().toLowerCase();

            // 테이블의 각 행을 순회
            $("#noticeList>tbody>tr").each(function() {
                // 행의 텍스트를 가져와서 소문자로 변환
                var rowText = $(this).text().toLowerCase();

                // 행의 텍스트에 검색어가 포함되어 있다면 행을 보이게 하고, 그렇지 않다면 숨김
                if (rowText.includes(searchTerm)) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        });

        $("#noticeList>tbody>tr").click(function() {
            let nno = $(this).children(".nno").text();
            location.href = "detail.no?nno=" + nno;
        });
    });
</script>
		
		<div id="pagingArea">
			<ul class="pagination">
			
				<c:choose>
					<c:when test="${ requestScope.pi.currentPage eq 1 }">
						<li class="page-item disabled">
							<a class="page-link" href="#">Previous</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="list.no?cpage=${ requestScope.pi.currentPage - 1 }">Previous</a>
						</li>
					</c:otherwise>
				</c:choose>
			
				<c:forEach var="p" begin="${ requestScope.pi.startPage }"
									 end="${ requestScope.pi.endPage }"
									step="1">
					<li class="page-item">
						<a class="page-link" href="list.no?cpage=${ p }">${ p }</a>
					</li>
				</c:forEach>
				
				<c:choose>
					<c:when test="${ requestScope.pi.currentPage eq requestScope.pi.maxPage }">
						<li class="page-item disabled">
							<a class="page-link" href="#">Next</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="list.no?cpage=${ requestScope.pi.currentPage + 1 }">Next</a>
						</li>
					</c:otherwise>	
				</c:choose>
			</ul>
		</div>
		
		
		</div>

	</div>
</body>
</html>