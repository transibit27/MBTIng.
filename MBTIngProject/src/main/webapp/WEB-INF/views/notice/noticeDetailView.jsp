<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../common/adminMenubar.jsp" />
	
	<div class="content">
		
		<div class="innerOuter">
		
			<a class="btn btn-secondary" style="float:right;" href="list.no">목록으로</a>
			
			<table id="contentArea" align="center" class="table">
				<tr>
					<th width="100">제목</th>
					<td colspan="3">${ requestScope.n.noticeTitle }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td colspan="3">${ requestScope.n.enrollDate } </td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"></td>
				</tr>
				<tr>
					<td colspan="4">
						<p style="height:150px;">
							${ requestScope.n.noticeName }
						</p>
					</td>
				</tr>
			</table>
			<br>
			
			<div align="center">
				<a class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</a>
				<a class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</a>
			
				<form id="postForm" action="" method="post">
					<input type="hidden" name="nno"
							value="${ requestScope.n.noticeNo }">				
				</form>
				
				<script>
					function postFormSubmit(num) {
						
						if(num == 1) {
							// num == 1 일 경우 : 수정 버튼 클릭
							$("#postForm").attr("action", "updateForm.no").submit();
						
						} else {
							// num == 2 일 경우 : 삭제 버튼 클릭
							$("#postForm").attr("action", "delete.no").submit();
						} 
					}
				</script>
			</div>
			<br><br>
			
			
			
		</div>
	
	</div>

</body>
</html>