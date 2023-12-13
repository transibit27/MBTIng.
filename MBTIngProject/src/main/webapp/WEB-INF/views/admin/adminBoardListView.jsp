<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 #boardList{
    width: 1000px;
    margin-left: 300px;
    text-align: center;
 }
 #searchForm{
    width: 450px;
    margin: auto;
    margin-top: 100px;
    margin-bottom: 70px;
 }
.checkbox{
    margin: auto;
    display: block;
}
#boardList>tbody>tr:hover {cursor:pointer;}
#pagingArea {width:fit-content; margin:auto;}

</style>
</head>
<body>

	<jsp:include page="../common/adminMenubar.jsp" />

 <div class="wrap">
 	
        <div class="search">

            <form id="searchForm" action="search.adbo" method="get">
                <div style="display: flex; align-items: center; margin-top: 40px">
                    <input class="form-control mr-sm-2" type="text" placeholder="Search" id="searchbar" name="keyword">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </div>
            </form>
        </div>
        
        <table border="1" id="boardList" class="table-hover" align="center">
            
            <thead>
            	<tr>
	                <th><input type="checkbox" class="checkbox" id="checkbox${b.seq}" name="selectedCheckbox"></th>
	                <th>순번</th>
	                <th>제목</th>
	                <th>작성자</th>
	                <th>작성일자</th>
	                <th>조회수</th>
	          	</tr>
            </thead>
            <tbody id="searchResultBody">
            	<c:forEach var="b" items="${ requestScope.list }">
		            <tr>
		                <th><input type="checkbox" class="checkbox"></th>
		                <th class="bno">${ b.boardNo }</th>
		                <th>${ b.boardTitle }</th>
						<th>${ adminService.getUserNameByUserId(b.userNo).userName }</th>         
						<th>${ b.enrollDate }</th>
		                <th>${ b.views }</th>
		            </tr>
            	</c:forEach>
            </tbody>
        </table>
        
        <script>
			    $(document).ready(function() {
			        $("#boardList>tbody>tr").click(function() {
			            let bno = $(this).children(".bno").text();
			
			            // AJAX를 이용하여 서버에 조회수 업데이트 요청
			            $.ajax({
			                type: "POST",
			                url: "updateViews.adbo",
			                data: { "bno": bno },
			                success: function(response) {
			                    // 서버에서 성공적으로 응답받으면 상세화면으로 이동
			                    location.href = "detail.adbo?bno=" + bno;
			                },
			                error: function(error) {
			                    console.error("Error updating views: ", error);
			                }
			            });
			        });
			    });
			</script>
        
        
        
        
        <div id="pagingArea">
    <ul class="pagination">
        <c:choose>
            <c:when test="${requestScope.pi.currentPage eq 1}">
                <li class="page-item disabled">
                    <a class="page-link" href="#">Previous</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="list.adbo?cpage=${requestScope.pi.currentPage - 1}">Previous</a>
                </li>
            </c:otherwise>
        </c:choose>
        
        <c:forEach var="p" begin="${requestScope.pi.startPage}" end="${requestScope.pi.endPage}" step="1">
            <li class="page-item">
                <a class="page-link" href="list.adbo?cpage=${p}">${p}</a>
            </li>
        </c:forEach>
        
        <c:choose>
            <c:when test="${requestScope.pi.currentPage eq requestScope.pi.maxPage}">
                <li class="page-item disabled">
                    <a class="page-link" href="#">Next</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="list.adbo?cpage=${requestScope.pi.currentPage + 1}">Next</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>

        
     </div>
  
</body>
</html>