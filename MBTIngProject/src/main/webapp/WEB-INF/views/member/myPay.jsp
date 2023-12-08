<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">

<title>결제 페이지 | Mbting</title>

<!-- 폰트(notosans)-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<style>
    * {font-family: 'Noto Sans KR', sans-serif;}
    
    #bo_list{
        margin: auto;
        width: 1200px;
    }

    .pay_intro{
        width: 1200px;
        height: 300px;
        margin-bottom: 50px;
        display: flex;
    }

    /*결제상품*/
    .pay_info{
        width: 1200px;
        margin: auto;
        margin-bottom: 100px;
    }

    .pay_item_wrap{
        margin: auto;
        display: flex;
        flex-direction: row;
    }

    .pay_item{
        width: 590px;
        height: 300px;
        background-color:  skyblue;
        border-radius: 10px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .pay_item>div{
        width: 100%;
        height: 215px;
    }
    
    .item_title{
        margin: 20px;
        width: 550px;
        font-size: 30px;
        font-weight: bold;
        color: white;
    }

    .item_intro{
        margin-left: 20px;
        margin-right: 20px;
        width: 550px;
        font-weight: bold;
        color: white;
    }

    #pay2{
        margin-left: 20px;
    }

    .pay_item button{
        margin-top: 20px;
        width: 95%;
        height: 45px;
        border-radius: 20px;
        border: 0px;
        color: black;
        font-size: 20px;
        font-weight: bold;
    }   

    .pay_item button:hover{
        cursor: pointer;
        color: steelblue;
    }


    /*게시판*/
    .board_list {
        border-top: 2px solid #fd8f9f;
        border-bottom: 1px solid #cccccc;
        font-size: 16px;
        color: #555555;
        margin-bottom: 100px;
    }

    .board_list table {
        table-layout: fixed;
        width: 100%;
    }

    .board_list table caption{
        padding: 0;
        font-size: 0;
        line-height: 0;
        overflow: hidden;
    }
    
    .board_list td,
    .board_list th {
        padding: 20px 3px;
        text-align: center;
    }

    .board_list td {
        border-top: 1px solid #dedede;
        padding: 20px 3px;
        color: #555;
        font-size: 15px;
    }

    .profile-menu-title{
        margin: auto;
        margin-top: 50px;
        margin-bottom: 50px;
        height: 100px;
        width: 1200px;
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

</style>

</head>
<body>

<div>
    <jsp:include page="../common/header.jsp"/>
</div>
    

<div class="profile-menu-title">
    결제 상품
</div>




<div class="pay_info">

    <div class="pay_intro"> 
        <div class="pay_intro_content" style="width:500px;">
            <div style="font-size: 50px; font-weight: bolder;">MBTING과 함께 더 좋은</div>
            <div style="font-size: 50px; font-weight: bolder; line-height: 25px;">상대를 찾아보세요.</div>
            <div style="margin-top: 30px; font-size: 20px;">
                MBTIng 코인을 구매하고 내 성향과 맞는 <br>
                매칭 대상을 찾아보세요.
            </div>
        </div>
        <div style="height: 100%; margin-left: 400px;"><img style="width: 100%;
            height: 100%;" src="https://blog.kakaocdn.net/dn/ceL2nr/btrUum9KhuJ/URqGrY525qkSfRfGkM5L7k/img.gif" alt="">
        </div>

    </div>
    <div class="pay_item_wrap">

        <div class="pay_item" id="pay1">
            <div>
                <div class="item_title">MBTICoin x5</div>
                <div class="item_intro">
                    횟수 제한 없는 매칭 신청 <br>
                    대화 기회 5회! <br>
                    부담 있는 가격 <br>
                    무제한 MBTI 테스트 가능
                </div>
            </div>  
          
            <button type="button">결제하기</button>
        </div>
    
        <div class="pay_item" id="pay2">
            <div>
                <div class="item_title">MBTICoin x10</div>
                <div class="item_intro">
                    횟수 제한 없는 매칭 신청 <br>
                    대화 기회 10회! <br>
                    부담 있는 가격 <br>
                    무제한 MBTI 테스트 가능
                </div>
            </div>

			    <button id="mbtiCoin10" type="button">결제하기</button>
        </div>

    </div>

</div>

<!-- 카카오페이 결제용 스클비트 -->
<script>
	$(function(){
		$("#pay1").click(function(){
			$.ajax({
				url:'pay.me',
				dataType:'json',
				data:{'email': '${sessionScope.loginMember.email}'},
				success:function(result){
					console.log(result);
					console.log(result.tid);
					var box = result.next_redirect_pc_url
					window.open(box);
						
				},
				error:function(result){
					alert("카카오페이 결제용 ajax 통신 오류")
					console.log(result);
					console.log(result.tid)
				}
				
				
			});	//ajax 끝
			
		});// 버튼 클릭 이벤트	
		
		
		
		IMP.request_pay({
		    pg : 'kakaopay',
		    pay_method : 'card', //생략 가능
		    merchant_uid: "order_no_0001", // 상점에서 관리하는 주문 번호
		    name : '주문명:결제테스트',
		    amount : 14000,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456'
		}, function(rsp) { // callback 로직
			//* ...중략 (README 파일에서 상세 샘플코드를 확인하세요)... *//
		});
		
	});	// 펑션 끝
	

</script>



<div class="profile-menu-title">
    결제 내역
</div>


<div id="bo_list">

    <div class="board_list">
        
        <table>
            <colgroup>
                <col width="100">
                <col width="100">
                <col>
                <col width="200">
                <col width="100">
                <col width="100">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">환불여부</th>
                    <th scope="col">상품명</th>
                    <th scope="col">구매자</th>
                    <th scope="col">날짜</th>
                    <th scope="col">문의</th>
                </tr>
            </thead>
            <tbody>
                <tr class=" ">
                    <td> 6188 </td>
                    <td> 가능 </td>
                    <td> 매칭 코인 5회 </td>
                    <td> mokoko1@naver.com </td>
                    <td> 23-12-04 </td>
                    <td>3</td>            
                </tr>
                <tr class=" ">
                    <td> 6188 </td>
                    <td> 가능 </td>
                    <td> 매칭 코인 5회 </td>
                    <td> mokoko1@naver.com </td>
                    <td> 23-12-04 </td>
                    <td>3</td>            
                </tr>
                <tr class=" ">
                    <td> 6188 </td>
                    <td> 가능 </td>
                    <td> 매칭 코인 5회 </td>
                    <td> mokoko1@naver.com </td>
                    <td> 23-12-04 </td>
                    <td>3</td>            
                </tr>
                <tr class=" ">
                    <td> 6188 </td>
                    <td> 가능 </td>
                    <td> 매칭 코인 5회 </td>
                    <td> mokoko1@naver.com </td>
                    <td> 23-12-04 </td>
                    <td>3</td>            
                </tr>
            </tbody>
        </table>

    </div>

    <!-- 페이지 -->
    <div class="bd_footer">
        <div class="paging">
        </div>	
    </div>

</div>






</body>
</html>
