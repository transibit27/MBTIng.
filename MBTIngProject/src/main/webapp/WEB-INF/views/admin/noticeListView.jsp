<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원관리</title>
<style>

#noticeList {
   width: 1000px;
   margin-left: 100px;
   text-align: center;
}
#searchForm {
   width: 450px;
   margin: auto;
   margin-top: 100px;
}
.btn-primary {
   margin-left: 880px;;
   margin-bottom: 30px;
   width: 100px;
}
.btn-danger {
    margin-bottom: 30px;
    margin-left: 10px;
    width: 100px;
}
.checkbox {
    margin: auto;
    display: block;
}
#notice-content {
	margin-left:250px;
	margin-top: 150px;
}
</style>
</head>
<body>

	<jsp:include page="../common/adminMenubar.jsp" /> 
     
    <div id="notice-content">
        <div class="search">
            <form id="searchForm" action="" method="get">
                <div style="display: flex; align-items: center; margin-top: 40px">
                    <input class="form-control mr-sm-2" type="text" placeholder="Search" id="searchbar" name="keyword">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </div>
            </form>

            <button type="button" class="btn btn-primary">등록</button>
            <button type="button" class="btn btn-danger">삭제</button>
        </div>
        
        <table id="noticeList">
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
	            <tr>
	                <th><input type="checkbox" class="checkbox"></th>
	                <th class="nno">${ n.noticeNo }</th>
	                <th>${ n.noticeTitle }</th>
	                <th>${ n.count }</th>
	                <th>${ n.enrollDate }</th>
	            </tr>
            </tbody>
        </table>
        
        <script>
	        $(function() {
	    		
	    		$("#noticeList>tbody>tr").click(function() {
	    			
	    			let nno = $(this).children(".nno").text();
	    			
	    			location.href = "detail.nno=" + nno;
	    		});
	    	});
        </script>
  	
  		<div id="pagingArea">
  			<ul class = "pagination">
  				
			<c:choose>
				<c:when test="${ requestScope.pi.currentPage eq 1 } ">
					<li class="page-item disabled">
						<a class="page-link" href="#">Previous</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<a class=page-link" href="list.no?cpage=${ requestScope.pi.currentPage - 1 }">Previous</a>
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
  

</body>
</html>
    