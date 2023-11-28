<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
<style>
	.my-outer{
		width: 100%;
        margin: auto;
        
    }
    .my-header{
        border-bottom: 1px solid lightgrey;
    }

    /*프로필 헤더 스타일*/
    #profile-header{
        margin: auto;
        margin-top: 50px;
        width: 800px;
       
        display: flex;
    }
    
    .my-bottom{
    	padding: 50px;
    }

    .empty-space-w{
        width: 50px;
    }
    .empty-space-h{
        height: 35px;
    }

    /* 비밀번호 초기화 버튼 */
    #reset-pass{
        margin-left: auto;
        margin-top: 20px;
        width: 100px;
        height: 25px;
        font-size: 10px;
    }

    #profile-table{
        width: 550px;
    }


    /*프로필 이미지 박스 스타일*/
    #profile {
        width : 80px;
        height: 100px;
    }

    #profile-img{
        width: 100px;
        height: 100px;
        border-radius: 50%;
        background-image: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJzWQKAwc2PQhvbHzBljfn1XeZ6RoVkHwVtpN7qziz3410qthreP08tKt0dVG1itRo8Yc&usqp=CAU");
        background-size: cover;
        background-position: center;
    }

    /*마이페이지 메뉴바 스타일*/
    #menuLine{
        margin: auto;
        margin-top: 20px;
        border: 1px solid pink;
        width: 800px;
    }
    #mymenu{
        margin: auto;
    }

    .emptymenu{
        width: 80px;
    }
    #mymenu tr td {
        border-top: 5px solid white; 
    }

    #myInfo:hover, #myMbting:hover, #myReview:hover{
        cursor: pointer;
        border-top: 5px solid pink;
        
    }
    
    

    /*마이페이지 폰트 스타일*/
    #profileName{
        font-weight: bold;
        font-size: 15px;
    }

    #profile-stat-value{
        font-size: 12px;
        text-align: center;
        color: gray;
    }

    #profile-stat{
        font-size: 15px;
        text-align: center;
        font-weight: bold;
    }
</style>
</head>
<body>

	<div class="my-outer">
	
		<div class="my-header">
			<!-- 메뉴바 import 부분 -->
			<jsp:include page="../common/header.jsp"></jsp:include>
		
        </div>
	
	    <div>
	        <div id="profile-header">
	            <table id="profile-table">
	                <tr>
	                    <td colspan="6" style="font-weight: bold; font-size: 18px; width: 100px; height: 50px;">mokoko@gmail.com</td>
	                </tr>
	                <tr class="empty-space-h">
	                    <td rowspan="4" id="profile">
	                        <div id="profile-img"></div>
	                    </td>
	                    <td class="empty-space-w"></td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                    <td class="empty-space-w"></td>
	                </tr>
	                <tr id="profile-stat-value">
	                    <td></td>
	                    <td>수락대기</td>
	                    <td>0</td>
	                    <td>10</td>
	                    <td></td>
	                   
	                </tr>
	                <tr id="profile-stat">
	                    <td></td>
	                    <td>매칭상태</td>
	                    <td>매칭신청자</td>
	                    <td>매칭코인</td>
	                    <td></td>
	                </tr>
	                <tr class="empty-space-h">
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <td id="profileName">모코코</td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                </tr>
	    
	            </table>
	            <button id="reset-pass" style="float: right;">비밀번호 초기화</button>
	        </div>
	
	        
	        <div id="menuLine">
	        </div>
	        <table id="mymenu">
	            <tr>
	                <td class="emptymenu"></td>
	                <td class="myMenus" id="myInfo">
	                	내 정보
	                </td>
	                <td class="emptymenu"></td>
	                <td class="myMenus" id="myMbting">
	                	내 상태
	                </td>
	                <td class="emptymenu"></td>
	                <td class="myMenus" id="myReview">
	                    내 후기
	                </td>
	                <td class="emptymenu"></td>
	            </tr>
	        </table>
	        
	        <!-- 하단 페이지 전환용 Script -->
		    <script>
		    
		    	$(function(){
		    		
		    		$("#myInfo").click(function(){
		    			
		    			$(location).attr("href", "myProfile.me")
		    		})
		    		$("#myMbting").click(function(){
		    			
		    			$(location).attr("href", "myPage.me")
		    		})
		    		$("#myReview").click(function(){

		    			$(location).attr("href", "myReview.me")
		    		})
		    		
		    	});
		    
		    </script>

	    </div>
    
    </div>
    
    
    
</body>
</html> 