<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<style>


	#profile-outer{
		margin: auto;
		width: 600px;
	}

	.profile-img-box {
    background-color: white;
    width: 100%;
    height: 100px;

    /* 아이템을 수평, 수직 가운데 정렬하는 코드 */
    display: flex;
    flex-direction: column;
    /* 방향을 row로 바꾸면 한 줄로 나온다! */
    justify-content: center;
    align-items: center;
    box-sizing: border-box;
    }

    .profile-img {
        background-color: grey;
        width: 100px;
        height: 100px;
        border-radius: 50%;
    }
	input {
		height: 30px;
		width: 350px;
		box-sizing: border-box;
	}
	textarea {
		box-sizing: border-box;
		height: 80px;
		width: 350px;
		resize : vertical;
	}

	.profile-title{
		float: right;
		font-weight: bolder;
		height: 20px;
		line-height: 20px;
	}

	.profile-content{
		margin: auto;
		padding-left: 30px;
	}
	
	.profile-message{
		box-sizing: border-box;
		height: 30px;
		padding-bottom: 15px;
		padding-left: 30px;
	}

</style>
</head>
<body>

	<div>

	</div>
	<script>
	    let i = document.getElementById("myProfile");

        i.style.cssText = "border-top : 5px solid pink"
	    
    </script>

	<div id="profile-outer">

		<div class="profile-menu-title">
			<h2>프로필 편집</h2>
		</div>
	
		<div id="mypage-form" 
		action="" method="post">
		
			<!--
				마이페이지에서 보여져야 하는 것들
				아이디, 이름, 전화번호, 이메일, 주소, 취미
			-->
		
			<table border="0px" style="table-layout: fixed;">
				<tr>
					<td style="width: 130px; height: 180px;">
						<div class="profile-img-box">
							<img class="profile-img" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJzWQKAwc2PQhvbHzBljfn1XeZ6RoVkHwVtpN7qziz3410qthreP08tKt0dVG1itRo8Yc&usqp=CAU" alt="" >
						</div> 
					</td>
					<td class="profile-content" style="font-size: 18px">
						mokoko@gmail.com
						<br>
						<a href="" style="font-weight: 600; text-decoration: none;">프로필 사진 바꾸기</a>
					</td>
					
				</tr>
				
				<tr>
					<td class="profile-title">이름</td>
					<td class="profile-content">
						<input type="text" name="userName" required 
						value="">
					</td>
					
				</tr>
				<tr>
					<td></td>
					<td class="profile-message">
						
					</td>
				</tr>
				
				
				<tr>
					<td class="profile-title">나이</td>
					<td class="profile-content">
						<input type="text" name="phone" 
						value="">
					</td>
				</tr>
				<tr>
					<td></td>
					<td class="profile-message">
						
					</td>
				</tr>
				
				<tr>
					<td class="profile-title">성별</td>
					<td class="profile-content">
						<input type="email" name="email" 
						value="">
					</td>
				</tr>
				<tr>
					<td>
						
					</td>
					<td class="profile-message"></td>
				</tr>
				
				<tr>
					<td class="profile-title">소개</td>
					<td class="profile-content">
						<textarea placeholder="응애">
							
						</textarea>
					</td>
					
				</tr>
				
				<tr>
					<td class="profile-content">
						
					</td>
					<td class="profile-message" >
						0/150
					</td>
				</tr>
				
				<tr>
					<td class="profile-title">휴대폰</td>
					<td class="profile-content">
						<input type="text" name="address" placeholder="- 포함해서 입력해주세요"
						value="">
					</td>
				</tr>
				<tr>
					<td>
						
					</td>
					<td class="profile-message"></td>
				</tr>
				
				<tr>
					<td class="profile-title">MBTI</td>
					<td class="profile-content">
						INTP
					</td>
				</tr>
				
				<tr>
					<td></td>
					<td class="profile-message"></td>
				</tr>
				
				<tr>
					<td class="profile-title">MBTI 별명</td>
					<td class="profile-content">
						F가되고싶은T
					</td>
				</tr>
				
				<tr>
					<td></td>
					<td class="profile-message"></td>
				</tr>
				<tr>
					<td class="profile-title">가입일</td>
					<td class="profile-content">
						2023-11-26
					</td>
				</tr>

				<tr>
					<td></td>
					<td class="profile-message"></td>
				</tr>
				<tr>
					<td class="profile-title"></td>
					<td class="profile-content">
						<button>제출</button>
					</td>
				</tr>
			
			</table>
		</div>
	</div>
	
    
</body>
</html>