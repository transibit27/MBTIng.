<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인페이지</title>
    <!-- Chart.js CDN 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- Font Awesome CDN 추가 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">

<style>
    @font-face {
    font-family: 'TheJamsil5Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
    }

    html, body {
        margin: 0;
        padding: 0;
        font-family: 'TheJamsil5Bold';
    }

    #admin-menubar {
        width: 1580px;
        height: 1600px;
        margin: auto;
        display: flex;
    }

    .left-area {
        width: 200px;
        height: 2300px;
        border-right: 2px solid #FCD19E;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding-top: 20px;
    }

    #logo, #logo a {
        font-size: 24px;
        color: #e64a19; /* 주황색 */
        text-decoration : none;
    }

    #content-menubar table {
        width: 100%;
        border-collapse: collapse;
    }

    #content-menubar th {
        padding: 15px;
        text-align: center;
        font-size: 16px;
        cursor: pointer;
        position: relative;
    }

    #content-menubar th:hover {
        background-color: #ff9800;
    }

    .menu-icon {
        position: absolute;
        left: 20px;
        font-size: 18px;
    }

    /* 메뉴바 색상 */
    #content-menubar th:nth-child(1), #content-menubar a {
        color: #d32f2f;
        text-decoration : none;
    }

        
    .right-area {
        width: 1580px;
        align-content: right;
        background-color: #FCD19E;
        height: 100px;
        margin: auto;
    }
    #icon1 {
     width: 70px;
     height: 60px;
     padding-right: 30px;
     margin-top: 20px;
    }
    #icon2 {
        width: 80px;
        height: 80px;
        padding-right: 10px;
        margin-top: 10px;
    }
    #content-menubar {
        width: 200px;
        height: 700px;
        margin-top: 30px;
    }
    
</style>
</head>
<body>
    <div class="right-area"> <!-- 오른쪽-->
        <img id="icon2" align="right" src="https://visualpharm.com/assets/225/Male%20User-595b40b85ba036ed117dc5a0.svg" alt="관리자">
        <img id="icon1" align="right" src="https://cdn-icons-png.flaticon.com/512/386/386605.png" alt="우편">
    </div>

        
    <div id="admin-menubar">

        <div class="left-area">
            <h1 id="logo"><a href="">MBTing.</a></h1>

            <div id="content-menubar">
                <table>
                    <tr>
                        <th><i class="fas fa-user menu-icon"></i>
                            <a href="">회원관리</a>
                        </th>
                    </tr>
                    <tr>
                        <th><i class="fas fa-bullhorn menu-icon"></i>
                            <a href="list.no">공지사항관리</a>
                        </th>
                    </tr>
                    <tr>
                        <th><i class="fas fa-comments menu-icon"></i>
                            <a href="">매칭후기관리</a>
                        </th>
                    </tr>
                    <tr>
                        <th><i class="fas fa-credit-card menu-icon"></i>
                            <a href="">결제 관리</a>
                        </th>
                    </tr>
                    <tr>
                        <th><i class="fas fa-question-circle menu-icon"></i>
                            <a href="">1:1문의</a>
                        </th>
                    </tr>
                </table>
            </div>
        </div>
    </div>

</body>
</html>