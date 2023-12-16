<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 폰트(notosans)-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
  	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
   
</head>
<style>
    * {font-family: 'Noto Sans KR', sans-serif;}

    img{
        width: 50px;
        height: 50px;
    }

    .find-pwd-wrap{
        min-width: 1200px;
        min-height: 800px;
        display: flex;
    }

    .find-pwd-group{
        margin: auto;
        width: 800px;
        height: 800px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .find-pwd-title{
        font-size: 40px;
        font-weight: bolder;
        margin: 30px;
    }
    .find-pwd-content{
        border: 1px solid pink;
        border-radius: 10px;
        width: 500px;
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
    }

    .find-pwd-content-name{
        font-size: 30px;
        font-weight: bolder;
        margin: 30px;
    }

    .find-pwd-content-content{
        font-size: 18px;
    }

    .find-pwd-input{
        display: flex;
        flex-direction: row;
    }

    .find-pwd-input button{
        margin-top: 30px;
        margin-bottom: 30px;
        height: 40px;
        width: 50px;
        border-radius: 10px;
        border: 0px;
        background-color: pink;
    }

    .find-pwd-input button:hover{
        cursor: pointer;
        background-color: plum;
    }    

    input{
        margin-top: 30px;
        margin-bottom: 30px;
        height: 40px;
        width: 250px;
        padding-left: 10px;
        border-radius: 10px;
        border: 0px;
        background-color: aliceblue;
    }
    input:focus{
        outline-color: plum;
    }

    a {
        text-decoration: none;
    }

    .find-pwd-check button{
        height: 40px;
        width: 50px;
        border-radius: 10px;
        border: 0px;
        margin-top: 30px;
        margin-bottom: 30px;
        background-color: pink;
    }

    .find-pwd-check button:hover{
        cursor: pointer;
        background-color: plum;
    }
    

</style>
<body>
    <div class="find-pwd-wrap">

        <div class="find-pwd-group">

            <div class="find-pwd-title">
                <img id="loggo" src="${pageContext.request.contextPath}/resources/images/mbtingLoggo2.png" alt="">Mbting
            </div>


            <div class="find-pwd-content">
                <div class="find-pwd-content-name">비밀번호 찾기</div>
                <div class="find-pwd-content-content">
                    가입하신 이메일 주소를 입력하시면 <br>
                    <b>'비밀번호 재설정'</b> 안내 메일이 전송됩니다.
                </div>
            

                <div class="find-pwd-input">
                    <input type="email" id="email" name="email" placeholder="이메일">
                    
                    <button type="button" onclick="getCertNo()">발송</button>
                </div>
           
                <div id="hidden" style="display: none;">
                
                    <div class="find-pwd-check">
                        <div class="find-pwd-content-content"><b>인증번호 입력</b></div>
                        <input type="password" id="emailCode" name="emailCode" placeholder="인증번호">
                        
                        <button type="button" onclick="checkCertNo()">확인</button>
                    </div>
                
                </div>
                
                <div class="find-pwd-content-content" style="margin-bottom: 30px;">
                    이메일도 잊어버리셨다면 <br>
                    <b>'관리자에게'</b> 문의해주세요.
                </div>
            </div>
            
	        <div style="margin-top: 40px;">
	            <a href="http://localhost:8081/mbting/">홈으로 돌아가기</a>
	        </div>
        </div>  
            

    </div>

    <script>
        $(function(){
        
            console.log($("#email").val())


        });

        // 인증번호 발급용 ajax
        function getCertNo(){

            $.ajax({
                url:"getCertNo.me",
                type:"post",
                data:{email : $("#email").val()},
                success:function(result){

                    alert(result);
                    $("#hidden").show();

                },
                error:function(result){
                    console.log("인증번호 발급용 ajax 통신 실패")
                }
    
    
            })//ajax 끝
        }
        
        // 인증번호 확인용 ajax
        function checkCertNo(){
        	
        	$.ajax({
        		url:"checkCertNo.me",
        		type:"post",
        		data:{
        			email:$("#email").val(),
        			emailCode:$("#emailCode").val()},
        		success:function(result){
        			
        			alert(result);
        			console.log("통신성공")
        		},
        		error:function(result){
        			console.log("인증번호 확인용 ajax 통신 실패")
        		}
        		
        	})
        }

    </script>
    
</body>
</html>