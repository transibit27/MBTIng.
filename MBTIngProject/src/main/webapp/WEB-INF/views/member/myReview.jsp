<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Document</title>

  
<style>
    

    .profile-menu-title, .ptlist-wrap{
        width: 800px;
        margin: auto;
        margin-top: 50px;
        margin-bottom: 50px;
    }
    
    /*
    ////////////////////
    내 후기 리스트 관련 스타일
    ////////////////////
    */

    ul,li {
        margin-left: 0px;
        -webkit-padding-start: 0px;
    }
    
    .ptlist {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    list-style-type: none;
    }

    .ptlist > li {
        width: 49%;
        background-color: #fff;
        margin-bottom: 20px;
    }

    .ptlist > li :hover {
        background-color: pink
    }

    .ptlist > li > div {
        display: flex;
        align-items: center;
        padding: 10px;
        padding-top: 25px;
        height: 100px;
        border-radius: 5px;
        background-color: #fff;
        box-shadow: 0 1px 4px 2px rgb(0 0 0 / 10%);
    }
    .ptlist > li > div > div {
        margin-left: 10px;
        flex-grow: 1;
    }

    .list_thumbimg {
    display: block;
    width: 72px;
    height: 72px;
    border-radius: 5px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    -ms-border-radius: 5px;
    -o-border-radius: 5px;
	overflow: hidden;
    }
    .list_thumbimg img {
        width: 100%;
        height: 100%;
    }


    /*
    ///////////
    페이징바 스타일
    ///////////
    */


</style>
</head>
<body>

	<div>
		<jsp:include page="./myPage.jsp"></jsp:include>
	</div>

    <script>
	    let i = document.getElementById("myReview");

        i.style.cssText = "border-top : 5px solid pink"
	    
    </script>

    <div class="profile-menu-title">
        <h5>내 후기</h5>
    </div>


    <div class="ptlist-wrap">
        <ul class="ptlist">
        
        	<c:forEach var="b" items="${ requestScope.list }">
			    <li>                
	                <div>
	                    <p class="list_thumbimg"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJzWQKAwc2PQhvbHzBljfn1XeZ6RoVkHwVtpN7qziz3410qthreP08tKt0dVG1itRo8Yc&usqp=CAU" alt="" ></p>    
	                    <div>
	                        <p class="pt_title">${b.boardTitle}
	                        </p>
	                        <p class="pt_info">
	                            ${b.userNo}
	                        </p>                                                     
	                    </div>
	                    <p class="b_info"><span><b>${b.views}</b>명 읽음</span></p>
	                </div>                
	            </li>
           	</c:forEach>
           
        </ul>
    </div>

	<!-- 페이징 바 -->
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
		    		<a class="page-link" href="myList.me?uno=${ sessionScope.loginMember.userNo }&cpage=${ requestScope.pi.currentPage - 1 }">Previous</a>
		    	</li>
		   	</c:otherwise>
	     </c:choose>
	        
	     <c:forEach var="p" begin="${ requestScope.pi.startPage }" 
	     					  end="${ requestScope.pi.endPage }"
	     					 step="1">
			<li class="page-item">
				<a class="page-link" href="myList.me?uno=${ sessionScope.loginMember.userNo }&cpage=${ p }">${ p }</a>
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
					<a class="page-link" href="myList.me?uno=${ sessionScope.loginMember.userNo }&cpage=${ requestScope.pi.currentPage + 1 }">Next</a>
				</li>
			</c:otherwise>
	   	</c:choose>
	    
	    </ul>
           
	</div>


    

    



</body>


</html>