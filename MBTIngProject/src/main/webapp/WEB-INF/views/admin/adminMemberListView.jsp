<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원관리</title>

<style>

/* 회원관리 스타일 */
 #member-table{
    width: 1000px;
    margin-left: 100px;
    text-align: center;
 }
 #searchForm{
    width: 450px;
    margin: auto;
    margin-top: 100px;
 }
.btn-primary{
   margin-left: 1000px;;
   margin-bottom: 30px;
}
.checkbox{
    margin: auto;
    display: block;
}
#wrap {
	margin-left: 250px;
    margin-top: 100px;
}
</style>
</head>
<body>
	<jsp:include page="../common/adminMenubar.jsp" />
	
 	<div id="wrap">

        <div class="search">

            <form id="searchForm" action="search.adme" method="get">
                <div style="display: flex; align-items: center; margin-top: 40px">
                    <input class="form-control mr-sm-2" type="text" placeholder="Search" id="searchbar" name="keyword">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </div>
            </form>
		</div>
            <button type="button" class="btn btn-primary" onclick="updateSelectedStatus()">저장</button>

        <table border="1" id="member-table">
            <thead>
                <th><input type="checkbox" class="checkbox" onclick="toggleAllCheckboxes()"></th>
                <th>순번</th>
                <th>이름</th>
                <th>MBTI</th>
                <th>이메일</th>
                <th>
                	<form action="#">
				        <label for="gen"></label>
				        <select name="gender" id="gen">
				            <option value="both">성별</option>
				            <option value="man">남자</option>
				            <option value="woman">여자</option>
				        </select>
				    </form>
                </th>
                <th>상태</th>
            </thead>
            
            <tbody id="searchResultBody">
            <c:forEach var="a" varStatus="vs" items="${requestScope.list}">
			    <!-- 토글 한 회원씩 클릭 가능하게 하는 script -->
			    <script>
			        var abc = 1;
			        var str_${vs.index + 1} = 'switch' + abc;
			    </script>
			    
			    <tr>
			        <th><input type="checkbox" class="checkbox"></th>
			        <th class="amno">${a.userNo}</th>
			        <th>${a.userName}</th>
			        <th>${a.mbti}</th>
			        <th>${a.email}</th>
			        <th>${a.gender}</th>
			        <th>
			    <form>
				    <div class="custom-control custom-switch">
				        <input type="checkbox" class="custom-control-input" 
				               id="switch${vs.index + 1}" ${a.status == 'Y' ? 'checked' : ''}>
				        <label class="custom-control-label" for="switch${vs.index + 1}"></label>
				    </div>
				</form>
			        </th>
			    </tr>
			</c:forEach>
            </tbody>
        </table>
    
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
                                <a class="page-link" href="list.adme?cpage=${ requestScope.pi.currentPage - 1 }">Previous</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                    <c:forEach var="p" begin="${ requestScope.pi.startPage }" end="${ requestScope.pi.endPage }" step="1">
                        <li class="page-item">
                            <a class="page-link" href="list.adme?cpage=${ p }">${ p }</a>
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
                                <a class="page-link" href="list.adme?cpage=${ requestScope.pi.currentPage + 1 }">Next</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
    
    
    
    
    
    
    
    
    
    
    
    
    <!-- 체크박스 전체 설정/해제 -->
    <script>
	    function toggleAllCheckboxes() {
	        // 체크박스 상태 가져오기
	        var isChecked = document.querySelector('.checkbox').checked;
	
	        // 모든 체크박스 상태 변경
	        var checkboxes = document.querySelectorAll('.checkbox');
	        checkboxes.forEach(function (checkbox) {
	            checkbox.checked = isChecked;
	        });
	    }
	
	    </script>
		
		
		
		
		
		
		
		<!-- 이 밑에 있는 코드는 다시 수정할 코드들 -->
	    <!-- 클라이언트 코드 -->

	    <script>
	        function updateStatus(userNo, index) {
	            var checkbox = document.getElementById('switch' + index);
	            var status = checkbox.checked ? 'Y' : '';

	            // AJAX를 사용하여 서버에 상태 업데이트 요청
	            var xhr = new XMLHttpRequest();
	            xhr.open('PUT', 'updateStatus.ad' + userNo + '?status=' + status, true);
	            xhr.onload = function () {
	                if (xhr.status === 200) {
	                    // 성공적으로 업데이트된 경우 추가 로직 작성
	                    console.log('Status updated successfully');
	                } else {
	                    console.error('Failed to update status');
	                }
	            };
	            xhr.send();

	            // 폼 전송 방지
	            return false;
	        }

	        // 각 체크박스에 이벤트 리스너 등록
	        document.addEventListener('DOMContentLoaded', function () {
	            var checkboxes = document.querySelectorAll('.custom-control-input');
	            checkboxes.forEach(function (checkbox, index) {
	                checkbox.addEventListener('change', function () {
	                    updateStatus(${a.userNo}, ${vs.index + 1});
	                });
	            });
	        });
	    </script>

	
		<script>

	// 체크된 회원 저장
    function updateSelectedStatus() {
        // 선택된 모든 체크박스 가져오기
        var checkboxes = document.querySelectorAll('.custom-control-input:checked');
        var selectedUserNos = [];

        // 선택된 체크박스의 userNo 가져와 배열에 저장
        checkboxes.forEach(function (checkbox) {
            var index = checkbox.id.replace('switch', '');
            selectedUserNos.push(${requestScope.list[index - 1].userNo});
        });

        // AJAX를 사용하여 서버에 상태 일괄 업데이트 요청
        var xhr = new XMLHttpRequest();
        xhr.open('PUT', 'updateSelectedStatus.ad', true);
        xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
        xhr.onload = function () {
            if (xhr.status === 200) {
                // 성공적으로 업데이트된 경우 추가 로직 작성
                console.log('Selected statuses updated successfully');
            } else {
                console.error('Failed to update selected statuses');
            }
        };

        // 선택된 회원들의 userNo를 JSON 형태로 변환하여 전송
        xhr.send(JSON.stringify({ selectedUserNos: selectedUserNos }));

        // 폼 전송 방지
        return false;
    }

</script>
		
    
    
    
</div>

</body>
</html>