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
#boardList {text-align:center;}
#pagingArea {width:fit-content; margin:auto;}

.enrollSize { width : 150px; }
#checkSize { width : 30px; }
#numSize { width : 90px; }
#viewSize { width : 90px; }
#writerSize { width : 120px; }
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
	                <th id="checkSize"><input type="checkbox" class="checkbox" id="checkbox${b.seq}" name="selectedCheckbox"></th>
	                <th id="numSize">순번</th>
	                <th>제목</th>
	                <th id="writerSize">작성자</th>
	                <th id="viewSize">조회수</th>
	                <th>작성일자</th>
	          	</tr>
            </thead>
            <tbody id="searchResultBody">
            	<c:forEach var="b" items="${ requestScope.list }">
		            <tr>
		                <th><input type="checkbox" class="checkbox"></th>
		                <th class="bno">${ b.boardNo }</th>
		                <th class="detailView" data-boardNo="${b.boardNo}">${b.boardTitle}</th>
		                <th class="detailView" data-boardNo="${b.boardNo}">홍길동</th>
		                <th>${ b.views }</th>
		                <th class="enrollSize">${ b.enrollDate }</th>
		            </tr>
            	</c:forEach>
            </tbody>
        </table>
        
        <script>
    // JavaScript로 클릭 이벤트 처리
    document.querySelectorAll('.detailView').forEach(title => {
        title.addEventListener('click', function() {
            const boardNo = this.getAttribute('data-boardNo');
            window.location.href = 'detail.adbo?bno=' + boardNo;
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