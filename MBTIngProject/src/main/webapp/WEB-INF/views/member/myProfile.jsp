<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<!-- 폰트(notosans)-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
  

<style>
    * {font-family: 'Noto Sans KR', sans-serif;
    caret-color: transparent;
    }

    
    div{border: px solid red;
    }
    
    #profile-outer{
        margin: auto;
		margin-bottom: 50px;
		width: 1000px;

	}
    
    
    
    .profile-intro{
        margin-top: 100px;
        height: 100px;
        width: 1000px;
        border-radius: 10px;
        margin-bottom: 20px;
        
        background-image:url(https://dudeplace.co/wp-content/uploads/2021/04/1.%E0%B8%8B%E0%B8%B5%E0%B8%A3%E0%B8%B5%E0%B8%AA%E0%B9%8C%E0%B9%80%E0%B8%81%E0%B8%B2%E0%B8%AB%E0%B8%A5%E0%B8%B5-Please-Dont-Meet-the-Man-%E0%B8%9B%E0%B9%88%E0%B8%A7%E0%B8%99%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%83%E0%B8%88-%E0%B9%80%E0%B8%AD%E0%B9%84%E0%B8%AD%E0%B8%A7%E0%B8%B8%E0%B9%88%E0%B8%99%E0%B8%A3%E0%B8%B1%E0%B8%81.jpg);
        background-size: cover;
        background-position:10% 50%;
        
        font-size: 26px;
        font-weight: bold;
        color: white;
        text-align: center;
        line-height: 100px;
    }
    
    
    #mypage-form{
        display: flex;
    }
    
    .left-profile{
        width: 550px;
    }
    .right-profile{
        width: 410px;
    }
    .right-profile-content{
        padding: 30px;
        background-color: #EBEDEF;
        border-radius: 10px;
        border: px solid ;
        -webkit-box-shadow: 15px 15px 20px -10px rgba(66, 68, 90, 1);
        -moz-box-shadow: 15px 15px 20px -10px rgba(66, 68, 90, 1);
        box-shadow: 15px 15px 20px -10px rgba(66, 68, 90, 1);
    }
    .right-profile-header{
        display: flex;
        align-items: center;
        flex-direction: column;
        
    }
    
    .line{
        margin-top: 7px;
        margin-bottom: 7px;
        height: 0px;
        width: 100%;
        border: 1px solid silver;
    }
    
    
	.profile-img-box {
        background-color: #EBEDEF;
        width: 150px;
        height: 150px;
        box-sizing: border-box;
    }
    
    .profile-img {
        background-color: snow;
        width: 100%;
        height: 100%;
        border-radius: 50%;
        
    }
    
    .profle-img-title{
        padding: 15px;
        border-radius: 10px;
        background-color: white;
    }
    
    #email{
        font-size: 16px;
        font-weight: bold;
        margin-bottom: 10px;
        margin-top: 10px;
        
    }
    
    #name{
        font-size: 16px;
        font-weight: bold;
        margin-bottom: 2px;
    }
    #mbtiNick{
        font-size: 14px; 
    }
    
    input{
        padding-left: 10px;
    }

	textarea {
        padding-left: 10px;
        background-color: #EBEDEF;
        border: 0px;
		box-sizing: border-box;
        border-radius: 5px;
		height: 150px;
		width: 310px;
		resize : none;
	}

	.profile-title{
		font-weight: bolder;
		height: 30px;
		line-height: 20px;
        font-size: 15px;
        font-weight: bold;
	}

	.profile-content{
		margin: auto;
        border: 0px;
        border-radius: 5px;
        height: 40px;
        width: 300px;
        background-color: #EBEDEF;
	}
	
	#change-profile{
        width: 100%;
        height: 40px;
        border: 2px solid pink;
        border-radius: 5px;
        background-color: pink;
        color: white;
        font-weight: bold;
        font-size: 15px;
	}
	
	#change-profile:hover{
		cursor: pointer;
        background-color: hotpink;
        color: white;
	}

    .final-button{
        margin-top: 25px;
    }

    .final-button button{
        width: 410px;
        height: 40px;
        font-size: 18px;
        font-weight: bold;
        color: white;
        border: 1px solid hotpink;
        border-radius: 5px;
        margin-top: 10px;
    }

    .final-button button:hover{
        cursor: pointer;
    }

    #final-button1{
        background-color: plum;
    }
    #final-button2{
        background-color: skyblue;
    }

    #final-button1:hover{
        background: rgb(212, 134, 212);
    }

    #final-button2:hover{
        background-color: rgb(79, 178, 218);
    }

    #mbti-test{
        margin-left: 10px;
        height: 40px;
        border-radius: 5px;
        border: 1px solid hotpink;
        background-color: pink;
        line-height: 30px;
        color: white;
        font-weight: bold;
    }

    #mbti-test:hover{
        background-color: hotpink;
        cursor: pointer;
    }


</style>
</head>
<body>

	<div>

	</div>
	<script>
	    let i = document.getElementById("myProfile");

        // i.style.cssText = "border-top : 5px solid pink"
	    
    </script>

	<div id="profile-outer">

        <div class="profile-intro">
            사용자 프로필
        </div>
	
		<form id="mypage-form" 
		  action="update.me"
		  method="post"
		 enctype="multipart/form-data"
         style="border: 1px solid pink; padding: 20px; border-radius: 5px;">
		
			<!--
				마이페이지에서 보여져야 하는 것들
				아이디, 이름, 전화번호, 이메일, 주소, 취미
			-->

            <div class="left-profile">

                <table border="0px" style="table-layout: fixed;">

                    <tr>
                        <td style="display: flex; height: 40px; line-height: 40px; font-size: 18px; font-weight: bold;"> 
                            기본 정보 (수정 불가) 
                            <div style="border: 1px solid gray; width: 135px; height: 0px; margin-top: 20px; margin-left: 20px;"></div></td>
                    </tr>
                                        
                    <tr>
                        <td class="profile-title">이름</td>
                    </tr>
                    <tr>
                        <td>
                        <input class="profile-content" type="text" name="userName" required 
                                value="${sessionScope.loginMember.userName}" disabled>
                    </td>
                    </tr>

                    <tr>
                        <td class="profile-title">나이</td>
                    </tr>
                    <tr>
                        <td>
                            <input class="profile-content" type="text" name="age" 
                            value="${sessionScope.loginMember.age}" disabled>
                        </td>
                    </tr>
                   
                    <tr>
                        <td class="profile-title">성별</td>
                    </tr>
                    <td>
                        <input class="profile-content" type="text" name="gender" 
                        value="${sessionScope.loginMember.gender}" disabled>
                    </td>

                    <tr>
                        <td class="profile-title">가입일</td>
                    </tr>
                    <tr>
                        <td>
                            <input class="profile-content" type="text" name="phone" placeholder="- 포함해서 입력해주세요"
                            value="${sessionScope.loginMember.enrollDate}" disabled>
                        </td>
                    </tr>

                    <tr>
                        <td style="display: flex; height: 40px; line-height: 40px; font-size: 18px; font-weight: bold; margin-top: 20px; "> 
                            부가 정보 (수정 가능)
                            <div style="border: 1px solid gray; width: 130px; height: 0px; margin-top: 20px; margin-left: 20px;"></div></td>
                    </tr>
                    
                    <tr>
                        <td class="profile-title">휴대폰</td>
                    </tr>
                    <td>
                        <input class="profile-content" type="text" name="phone" placeholder="- 포함해서 입력해주세요" style="caret-color: auto;"
                        value="${sessionScope.loginMember.phone}">
                    </td>

                    <tr>
                        <td class="profile-title">소개</td>
                    </tr>
                    <tr>
                        <td>
                            <textarea style="caret-color: auto;" placeholder="사용자의 소개 내용을 입력해 주세요." name="introduce">${sessionScope.loginMember.introduce}</textarea>
                        </td>
                    </tr>
             
                    <tr>
                        <td class="profile-title">MBTI</td>
                    </tr>
                    <tr>
                        <td>
                            <input class="profile-content" type="text" name="phone" placeholder="- 포함해서 입력해주세요"
                            value="${sessionScope.loginMember.mbti}" disabled>
                        </td>
                    </tr>
                                      
                    <tr>
                        <td class="profile-title">MBTI 별명</td>
                    </tr>
                    <tr>
                        <td>
                            <input class="profile-content" type="text" name="phone" placeholder="- 포함해서 입력해주세요"
                            value="${sessionScope.loginMember.mbtiNick}" disabled>
                        </td>
                        <td>
                            <button id="mbti-test" type="button" onclick="location.href=''">내 성향 검사</button>
                        </td>
                    </tr>
                    
                    
               
                </table>
            </div>

            <div class="right-profile">
                <div class="profile-title" style="line-height: 30px;">
                    미리보기
                </div>

                <div class="right-profile-content">
                    
                    <div class="right-profile-header">
    
                        <div class="profile-img-box">
                            <img class="profile-img" src="${pageContext.request.contextPath}${sessionScope.loginMember.profileImg}" alt="" />
                        </div>
                        <div id="email">
                            ${sessionScope.loginMember.email}
                        </div>
                        
                    </div>

                    <!-- 회원 정보 변경 시 DB로 부터 수정할 회원을 지정하기 위해 로그인 유저의 EMAIL 정보 담아 둘 input -->
                    <input type="hidden" name="email" value="${sessionScope.loginMember.email}" />
                    <div class="profle-img-title">
                        <div id="name"> ${sessionScope.loginMember.userName}</div>
                        <div id="mbtiNick">${sessionScope.loginMember.mbtiNick} / ${sessionScope.loginMember.mbti}</div>
                        
                        <div class="line"></div>

                        <div style="font-weight: bold; margin-top: 20px;" >소개</div>
                        <div style="border: 1px solid pink; border-radius: 5px; margin-bottom: 20px;" >
                            <textarea placeholder="사용자의 소개 내용을 입력해 주세요." style="background-color: white;" readonly disabled>${sessionScope.loginMember.introduce}</textarea>
                        </div>

                        <div>
                            <button id="change-profile" type="button">프로필 이미지 변경</button>
                            <input type="file" id="upfile" name="reupfile" style="display: none;">
                            <input type="hidden" id="oldfile" name="profileImg" style="display: none;" value="${sessionScope.loginMember.profileImg}">
                        </div>
                    </div>
                    
                </div>

                <div class="final-button">
                    <button id="final-button1" type="button">비밀번호 변경</button>
                    <button id="final-button2" type="submit">적용 </button>
                </div>  
            </div>


            <!-- 프로필 이미지 등록 미리보기용 스크립트 -->
            <script>
                

                $("#change-profile").click(function(){
                        
                        $("#upfile").click();	
                });
            
                $("#upfile").on("change", function(event) {
                    console.log($("#upfile").val());

                    var upfile =$("#upfile")
                   
                    var file = event.target.files[0];

                    var reader = new FileReader(); 
                    reader.onload = function(e) {

                        $(".profile-img").attr("src", e.target.result);
                    }

                    reader.readAsDataURL(file);
                });
            </script>


		</form>
	</div>
	
    
</body>
</html>