<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
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

<!-- 아이콘-->
<script src="https://kit.fontawesome.com/22698b3d17.js" crossorigin="anonymous"></script>

<style>
    * {font-family: 'Noto Sans KR', sans-serif;
    caret-color: transparent;
    }

	.my-content{
		width:100%;
		margin: auto;
		margin-top : 80px;
		margin-bottom : 50px;
	}

    /*
    ////////////////////
    slider 관련 스타일
    ////////////////////
    */

    /*슬라이더*/
    .profile-menu-title{
        margin: auto;
        margin-bottom: 50px;
        height: 100px;
        width: 1200px;
        border: 1px solid;
        border-radius: 10px;
        background-image:url(https://dudeplace.co/wp-content/uploads/2021/04/1.%E0%B8%8B%E0%B8%B5%E0%B8%A3%E0%B8%B5%E0%B8%AA%E0%B9%8C%E0%B9%80%E0%B8%81%E0%B8%B2%E0%B8%AB%E0%B8%A5%E0%B8%B5-Please-Dont-Meet-the-Man-%E0%B8%9B%E0%B9%88%E0%B8%A7%E0%B8%99%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%83%E0%B8%88-%E0%B9%80%E0%B8%AD%E0%B9%84%E0%B8%AD%E0%B8%A7%E0%B8%B8%E0%B9%88%E0%B8%99%E0%B8%A3%E0%B8%B1%E0%B8%81.jpg);
        background-size: cover;
        background-position:10% 50%;
        
        font-size: 26px;
        font-weight: bold;
        color: white;
        text-align: center;
        line-height: 100px;
    }
    
    /*
    ///////////////
    하단 메뉴 스타일
    ///////////////
    */
    .shortMenu-wrap{
    margin: auto;
    width: 1200px;
    box-sizing: border-box;
    /*
    부모 요소에 display: flex를 추가해주면 자식 요소들의 정렬을 제어 가능해짐
    */
    display: flex;
    flex-direction: row;
    /* coulumn 은 하위 요소를 위에 부터 정렬 */
    align-items: center;
    /*하위 요소들 정렬 위치*/
    
    }
    .margin{
        width: 30px;
        box-sizing: border-box;
    }
    
    .shortMenu{
        margin: auto;
        border: 1px solid lightgray;
        box-sizing: border-box;
        height: 500px;
        width: 400px;
        /*
        부모 요소에 display: flex를 추가해주면 자식 요소들의 정렬을 제어 가능해짐
        */
        display: flex;
        flex-direction: column;
        /* coulumn 은 하위 요소를 위에 부터 정렬 */
        align-items: center;
        /*하위 요소들 정렬 위치*/
        float: left;
    }

    .icon-box{
        margin-top: 10px;
        width: 100%;
        height: 35%;
        box-sizing: border-box;
        display: flex;
        align-items: center;
    }

    i {
        margin: auto;
    }

    
    .shortMenu-info{
        width: 100%;
        height: 65%;
        box-sizing: border-box;
        display: flex;
        flex-direction: column;
        /* coulumn 은 하위 요소를 위에 부터 정렬 */
        align-items: center;
        /*하위 요소들 정렬 위치*/
    }

    .shortMenu-title{
        margin-top: 20px;
        width: 100%;
        height: 25px;
        text-align: center;
        line-height: 25px;
        font-weight: bold;
        font-size: 20px;
    }

    .shortMenu-content{
        width: 90%;
        margin: auto;
        font-size: 15px;
        height: 150px;
        display: flex;
        text-align: center;
        align-items: center;
        justify-content: center;
    }

    .shortMenu-button{
        margin: 5px;
        width: 90%;
        margin-bottom: 15px;
        padding: 5px;
    }

    .shortMenu-button button{
        height: 40px;
        width: 100%;
        border: 1px;
        border-radius: 10px;
        background-color: pink;
        color: white;
        font-weight: bold;
    }

    .shortMenu-button button:hover{
        background-color: hotpink;
        cursor: pointer;
    }

    
    /*
    ////////////////
    슬라이드 스타일
    //////////////// 
    */

    ul,ol,li {list-style: none;}

    .slider-wrap{
        width: 1200px;
        margin: auto;
        margin-bottom: 80px; 
    }
    
	.slider {
        max-width: 1200px;
        margin: 50px auto 0;
        font-size: 0;
        text-align: center;
    }

	.slider .inner {
        overflow: hidden;
        width: 100%;
        margin: 0 auto;
        padding: 100px 0;}

	.slide_list > li {
        position: relative;
        width: 150px; 
        height: 210px;
        margin-left: 30px;
        margin-right: 30px;
        font-size: 10px;
        z-index: 0;
        transform: scale(1); 
        transition: all 0.3s;}
	
	/* 영역별 크기 설정 */
	.slide_list > li.swiper-slide-next,
	.slide_list > li.swiper-slide-prev,
	.slide_list > li.swiper-slide-duplicate-next,
	.slide_list > li.swiper-slide-duplicate-prev {z-index: 50;transform: scale(1.3);}
	.slide_list > li.swiper-slide-active,
	.slide_list > li.swiper-slide-duplicate-active {z-index: 100;transform: scale(1.8);}
	
	/* 영역별 밝기 설정 */
	.slide_list > li:after {
		content:'';
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background:rgba(0,0,0,0.5);
		transition: all 0.3s;
		opacity: 1;}

	.slide_list > li.swiper-slide-next:after,
	.slide_list > li.swiper-slide-prev:after,
	.slide_list > li.swiper-slide-duplicate-next:after,
	.slide_list > li.swiper-slide-duplicate-prev:after {background:rgba(0,0,0,0.05);} 
	.slide_list > li.swiper-slide-active:after,
	.slide_list > li.swiper-slide-duplicate-active:after{display: none;}
	
	/* 화살표 */
	.slider .btn {
		display: inline-block;
		width: 35px;
		height: 35px;
		margin:30px 15px 0;
		background:url('${contextPath}/resources/icon/icon-right-arrow.png') center center no-repeat;
		background-size: cover;
		text-indent: -999em;
		cursor: pointer;}
					
	.slider .btn_prev {transform: rotateY(180deg);}
	
	@media (max-width: 768px) {
	    .slider .inner {padding: 38px 0;}
	    .slide_list > li { width: 33.333%; }
	    .slide_list > li.swiper-slide-next,
	    .slide_list > li.swiper-slide-prev,
	    .slide_list > li.swiper-slide-duplicate-next,
	    .slide_list > li.swiper-slide-duplicate-prev {transform: scale(1);}
	    .slide_list > li.swiper-slide-active,
	    .slide_list > li.swiper-slide-duplicate-active {transform: scale(1.5);}
	}
	
	.swiper-slide > div{
	width: 100%;
	height: 100%;
    box-sizing: border-box;
    border: 5px solid hotpink;
    border-radius: 5px;
	}


    /*
    ////////////////
    프로필 카드 스타일
    //////////////// 
    */

    .profile-wrap{
        height: 200px;
        width: 100%;
        /*
        부모 요소에 display: flex를 추가해주면 자식 요소들의 정렬을 제어 가능해짐
        */
        display: flex;
        flex-direction: column;
        /* coulumn 은 하위 요소를 위에 부터 정렬 */
        align-items: center;
        /*하위 요소들 정렬 위치*/
    }

    .profile-info{
        width: 100%;
        height: 90px;
        text-align: center;
        box-sizing: border-box;
        background-color: white;
    }

    .profile-info div{
        margin: 5px;
        height: 20px;
        line-height: 20px;
    }

    .profile-name{
        font-weight: bold;
    }

    .profile-img-box {
    background-color: white;
    width: 100%;
    height: 110px;

    /* 아이템을 수평, 수직 가운데 정렬하는 코드 */
    display: flex;
    flex-direction: column;
    /* 방향을 row로 바꾸면 한 줄로 나온다! */
    justify-content: center;
    align-items: center;
    box-sizing: border-box;
    }

    .profile-img {
        width: 100px;
        height: 100px;
        border-radius: 50%;
    }

    /* 프로필 카드 백 스타일 */
    .profile-img-box-b{
        background-color: white;
        width: 50px;
        height: 50px;
        /* 아이템을 수평, 수직 가운데 정렬하는 코드 */
        display: flex;
        flex-direction: column;
        /* 방향을 row로 바꾸면 한 줄로 나온다! */
        justify-content: center;
        align-items: center;
        box-sizing: border-box;
    }
    
    .profile-name-b{
        font-weight: bold;
        text-align: left;
    }
    .profile-img-b {
        width: 50px;
        height: 50px;
        border-radius: 50%;
    }

    .profile-info-b{
        width: 100%;
        height: 100px;
        box-sizing: border-box;
        background-color: white;
        padding-bottom: 10px;
    }

    .profile-introduce{
        width: 120px;
        height: 90px;
        margin-bottom: 10px;
        font-size: 8px;
        text-align: left    ;
    }

    .swiper-no-swiping {
        pointer-events: none;
    }

    #submitB{
        border-radius: 5px;
        border: 1px solid hotpink;
        background-color: pink;
        color: white;
        width: 100px;
        height: 25px;
        font-weight: bold;
    }

    #submitB:hover{
        background-color: hotpink;
    }

    /*프로필 플립*/
    .card {
    width: 100%;
    height: 100%;
    transition: all .5s;
    transform-style: preserve-3d;
    }

    .swiper-slide:hover .card {
    transform: rotateY(180deg);
    }

    .swiper-slide .card > div {
    position: absolute;
    top: 0;
    left: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100%;
    backface-visibility: hidden;
    }

    .swiper-slide .card .card-front {
    z-index: 10;
    }

    .swiper-slide .card .card-back {
        z-index: 5;
        transform: rotateY(180deg);
    }
    




</style>
</head>
<body>

	<div>
		<jsp:include page="./myPage.jsp"></jsp:include>
	</div>

    <script>

    
	    let i = document.getElementById("myMbting");

        i.style.cssText = "border-top : 5px solid pink"
	    
    </script>

	<div class="my-content">
	    <div class="profile-menu-title">
	    Mbting 신청자
	    </div>

        <div class="slider-wrap">
    
            <div class="slider">
                <div class="inner">
                    <ul class="swiper-wrapper slide_list">
     
                </div>
                <span class="btn btn_prev">이전</span>
                
                <span class="btn btn_next">다음</span>
            </div>
    
        </div>

        <!-- 신청자 리스트 출력용 스크립트 -->
        <script>
            $(document).ready(function(){
                myStatProfile();    // 내 상태 갱신용 펑션
                proposerList();     // 대화 신청자 리스트 갱신용 펑션
                slider();           // 대화 신청자 리스트 슬라드 표시요 ㅇ펑션
                setInterval(myStatProfile,50000);
                setInterval(proposerList, 50000);
        
                // 매칭 신청자 리스트 확인용 ajax
                function proposerList(){
                    
                    $.ajax({
                        
                        url : "proposerList.me",
                        type : "post",
                        data : {"userNo":${sessionScope.loginMember.userNo}}, 
                        success : function(result){
                            
                            let resultStr="";
                            
                            for(let i = 0; i < result.length; i++){
                                
                            let profileImg= "/mbting"+result[i].profileImg;
                            
                                resultStr += "<li class='swiper-slide'>"
                                            + "<div class='card'>"
                                                + "<div class='card-front'>"
                                        
                                                    + "<form action='accept.me' method='post'>"
                                                        + "<div class='profile-wrap'>"
                                                        +	"<div class='profile-img-box'>"
                                                            +	"<img class='profile-img' src=" +profileImg+ ">"
                                                        +	"</div>"
                                                        +	"<div class='profile-info'>"
                                                            + "<div class='profile-name'>"
                                                                + result[i].userName
                                                            + "</div>"
                                                        + 	"<div class='profile-mbti'>"
                                                                + result[i].mbti
                                                            + "</div>"
                                                            + "<button id='submitB' type='submit'>수락</button>"
                                                            + "<input type='hidden' name='proposerNo' value="+ result[i].userNo + ">"
                                                            + "<input type='hidden' name='receiverNo' value="+ ${sessionScope.loginMember.userNo} + ">"
                                                        +	"</div>"
                                                        + "</div>"
                                                        + "</form>"
                                                    + "</form>"
                                                
                                                + "</div>"

                                                + "<div class='card-back'>"
                                        
                                                    + "<form action='accept.me' method='post'>"
                                                        +"<div class='profile-wrap'>"
                                                        +	"<div class='profile-img-box-b'>"
                                                            +	"<img class='profile-img-b' src=" +profileImg+ ">"
                                                        +	"</div>"
                                                        +   "<div class='profile-info-b'>"
                                                             +   "<div class='profile-name-b'>"
                                                                    + "소개"
                                                                + "</div>"
                                                                + "<div class='profile-introduce'>"
                                                                    + result[i].introduce
                                                                + "</div>"
                                                            + "<button id='submitB' type='submit'>수락</button>"
                                                            + "<input type='hidden' name='proposerNo' value="+ result[i].userNo + ">"
                                                            + "<input type='hidden' name='receiverNo' value="+ ${sessionScope.loginMember.userNo} + ">"
                                                        +	"</div>"
                                                        + "</div>"
                                                        + "</form>"
                                                    + "</form>"
                                                
                                                + "</div>"

                                            + "</div>"
                            }
                            
                            // 매칭 신청자 리스트 출력 위치
                            $(".slide_list").html(resultStr);
                                
                        },
                        error : function(){
                            
                            console.log("매칭 신청자 리스트 조회용 ajax 통신 실패")
                        }
                        
                    }) // ajax 끝
                }

                $("#test").click(function(){
                    
                })

                $(".swiper-slide").click(function(){
                    alert("잘되나?3")
                })
              


                
                // 하단 메뉴바(내 상태) ajax 펑션 => 미완성 myRoomNo 정보는 불러오는 상태
                function myStatProfile(){
                    
                    $.ajax({
                        url : "myStat.me",
                        type : "post",
                        data : {"userNo":${sessionScope.loginMember.userNo}},
                        success : function(result){
                            
                            console.log(result);
                        
                        },
                        error : function(){
                            console.log("내 상태 표시용 ajax 통신 실패")
                        }
                        
                    }); // ajax 끝
                }
                
                // 하단 메뉴바(내 대화 상대 표시용) ajax 펑션 => 미완성
                function myStatProfile(){
                    
                    $.ajax({
                        url : "myChat.me",
                        type : "post",
                        data : {"userNo":${sessionScope.loginMember.userNo}},
                        success : function(result){
                            
                            console.log(result);
                        
                        },
                        error : function(){
                            console.log("내 대화 상대 표시용 ajax 통신 실패")
                        }
                        
                    }); // ajax 끝
                }

                
                // 대화 신청자 리스트 표시용 펑션
                function slider() {
                    let swiper = undefined;
                    let slideNum = $('.slider .swiper-slide').length //슬라이드 총 개수
                    let slideInx = 0; //현재 슬라이드 index
            
                    //디바이스 체크
                    let oldWChk = window.innerWidth > 767 ? 'pc' : 'mo';
                    sliderAct();
            
                    let resizeTimer;
                    $(window).on('resize', function() {
                        clearTimeout(resizeTimer);
                        resizeTimer = setTimeout(function() {
                            let newWChk = window.innerWidth > 767 ? 'pc' : 'mo';
                            if (newWChk != oldWChk) {
                                oldWChk = newWChk;
                                sliderAct();
                            }
                        }, 300);
                    })
            
                    //슬라이드 실행
                    function sliderAct() {
                        //슬라이드 초기화 
                        if (swiper != undefined) {
                            swiper.destroy();
                            swiper = undefined;
                        }
            
                        //slidesPerView 옵션 설정
                        let viewNum = oldWChk == 'pc' ? 4 : 2;
                        //loop 옵션 체크
                        let loopChk = slideNum > viewNum;
            
                        swiper = new Swiper(".slider .inner", {
                            slidesPerView: "auto",
                            initialSlide: slideInx,
                            loop: loopChk,
                            centeredSlides: true,
                            observer : true,
                            observeParents : true,

                            navigation: {
                                nextEl: '.slider .btn_next',
                                prevEl: '.slider .btn_prev',
                            },
                            on: {
                                activeIndexChange: function() {
                                    slideInx = this.realIndex; //현재 슬라이드 index 갱신
                                }
                            },
                        });
                    }

                }
                   
            })
            
        </script>


<!-- 하단 메뉴 카드 목록-->
        <div class="profile-menu-title">
        내 현황
        </div>

	    <div class="shortMenu-wrap">
            
	        <div class="shortMenu">
	            
	            <div class="icon-box">
	                <i class="fa-regular fa-circle-user fa-8x" style="color: #ffd1dc;"></i>
	            </div> 
	    
	            <div class="shortMenu-info">
	                <div class="shortMenu-title">
	                    프로필 편집
	                </div> 
	                <div class="shortMenu-content">
	                    사진을 등록하세요 <br>
	                    내용
	                    <br>
	                </div>
	                <div class="shortMenu-button">
	                    <button type="button" onclick="location.href='myProfile.me'">정보 수정</button>
	                </div> 
	            </div>
	        </div>
	
	        <div class="margin"></div>
	
	        <div class="shortMenu">
	            
	            <div class="icon-box">
	                <i class="fa-regular fa-comments fa-8x" style="color: #ffd1dc;"></i>
	            </div> 
	    
	            <div class="shortMenu-info">
	                <div class="shortMenu-title">
	                    대화하기
	                </div> 
	
	                <div class="shortMenu-content">
	                    xx 님이 <br>
	                    대화를 기다리고 있어요!
	                </div>
	            
	                <div class="shortMenu-button">
	                    <button button type="button" onclick="location.href=''">내용 확인</button>
	                </div> 
	            </div>
	        </div>
	        
	        <div class="margin"></div>
	
	        <div class="shortMenu">
	            
	            <div class="icon-box">
	                <i class="fa-regular fa-credit-card fa-8x" style="color: #ffd1dc;"></i>
	            </div> 
	    
	            <div class="shortMenu-info">
	                <div class="shortMenu-title">
	                    결제 정보
	                </div> 
	                <div class="shortMenu-content">
	                    내용
	                </div>
	                <div class="shortMenu-button">
	                    <button id="test" button type="button">확인하기</button>
	                </div> 
	            </div>
	        </div>
	    </div>
    
    </div>

</body>

</html>