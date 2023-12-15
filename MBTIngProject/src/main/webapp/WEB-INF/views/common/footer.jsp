<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    .f-content {
        background-color: rgb(54, 55, 71);
        width: 100%;
        height: 250px;
    }

    .f-content-top {
        display: flex;
        align-items: center;
        justify-content: center;
        border-bottom: 0.1px solid rgb(156, 156, 156);
        height: 80px;

    }

    .f-content-bottom {
        height: 100%;
        background-color: rgb(54, 55, 71);
        display: flex;
        align-items: center;
    }

    .info {
        margin-left: 20px;
        font-size: 13px;
        color: rgb(184, 187, 216);
    }

    .terms>a {
        text-decoration: none;
        color: white;
        font-size: 14px;
        font-weight: bold;
    }

    .terms>a:hover {
        cursor: pointer;
        text-decoration: none;
    }

    .copyright {
        color: white; 
        background-color: rgb(54, 55, 71); 
        text-align: center;
        padding-bottom: 40px;
        font-size: 15px;
    }

</style>

</head>
<body>

    <div class="f-content">
        <div class="f-content-top">
            <div class="terms" style="color: white;">
                <a href="">이용약관</a> &nbsp; | &nbsp;
                <a href="">개인정보처리방침</a> &nbsp; | &nbsp;
                <a href="">회사소개</a> &nbsp; | &nbsp;
                <a href="">이용안내</a>
            </div>
        </div>

        <div class="f-content-bottom">
            <div class="info">
                <p>서비스명: 직장인소개팅&nbsp; | &nbsp;회사명: MBTING&nbsp; | &nbsp;대표: 정윤석&nbsp; | &nbsp;사업자번호: 123-45-789</p>
                <p>주소: 서울특별시 영등포구 선유동2로 57 이레빌딩 19층</p>
                <p>개인정보관리책임자: 정윤석&nbsp; | &nbsp;E-MAIL: praymyk@mbting.com</p>
            </div>

            <div class="footer-icon">
                <a href="https://www.youtube.com/@user-jt1ep9tq9l">
                    <img class="logo-size" src="<%=request.getContextPath()%>/resources/images/youtubeLogo.png" >
                </a>
                <a href="https://instagram.com/ming_my.seaweed?igshid=OGQ5ZDc2ODk2ZA%3D%3D&utm_source=qr">
                    <img class="logo-size" src="<%=request.getContextPath()%>/resources/images/instagramLogo.png" >
                </a>
                <a href="https://blog.naver.com/programming_my00">
                    <img class="logo-size" src="<%=request.getContextPath()%>/resources/images/blogLogo.png">
                </a>
            </div>
            
        </div>
        <h5 class="copyright">Ⓒ 2018 MBTING All right reserved.</h5>
        

    </div>

</body>
</html>