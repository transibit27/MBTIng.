<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MBTIng - 만남후기 수정</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Single+Day&display=swap" rel="stylesheet">
    <style>
        body * {
            font-family: 'Noto Sans KR', sans-serif;
        }
        .outer {
            width: 100%;
            margin: auto;
        }
        .reviewbanner {
            width: 100%;
            height: 150px;
            margin: auto;
            background-image:url(https://images.unsplash.com/photo-1480623826718-27e89ac63a4f?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D);
            background-position: center center;
            background-size: cover;
        }
        .reviewbanner-text {
            width: 1200px;
            height: 150px;
            text-align: center;
            line-height: 150px;
            color: white;
            font-size: xx-large;
        }
        form {
            width: 1200px;
            margin: auto;
        }
        .writereview-title {
            width: 300px;
            font-size: large;
            font-weight: bold;
        }
        .writereview-title input {
            width: 250px;
            border: none;
            border-bottom: 2px solid pink;
        }
        .writereview-content {
            font-size: large;
            font-weight: bold;
        }
        .writereview-content textarea {
            width: 100%;
            height: 500px;
            border-radius: 5px;
            border: 2px solid pink;
            resize: none;
        }
        .writereview-photo {
            width: 1200px;
            text-align: center;
        }
        .writereview-photo img {
            width: 150px;
            height: 150px;
            border-radius: 10px;
        }
        .writereview-photo input {
            font-size: smaller;
        }
        .reviewphoto-table-thumbnail td {
            border: 2px solid pink;
            width: 250px;
            height: 250px;
        }
        .reviewphoto-table-photos td {
            border: 2px dotted pink;
            width: 250px;
            height: 250px;                    
        }
        .reviewupdate-button button {
            width: 90px;
            height: 30px;
            border: none;
            border-radius: 5px;
            background-color: pink;
        }
        .reviewupdate-button button:hover {
            border: 1px solid pink;
            background-color: white;
        }
    </style>
</head>
<body>

    <jsp:include page="../common/header.jsp" />

    <div class="outer">
        <div class="reviewbanner" align="center">
            <div class="reviewbanner-text">
                <p>만남후기</p>
            </div>
        </div>
        
        <br>

        <form id="updateForm" method="post" action="update.bo" enctype="multipart/form-data">

            <br>

            <input type="hidden" name="boardNo" value="${ requestScope.b.boardNo }">
            <div class="writereview-title">
                제목&nbsp;&nbsp;<input type="text" id="title" name="boardTitle" value="${ requestScope.b.boardTitle }" required>
            </div>

            <br>

            <div class="writereview-content">
                내용
                <br>

                <textarea id="content" name="boardContent" required>${ requestScope.b.boardContent }</textarea>
            </div>

            <br>

            <div class="writereview-photo" align="left">                
                <table>
                    <tr>
                        <td>
                            <table class="reviewphoto-table-thumbnail">
                                <tr>
                                    <td>
                                        <img id="thumbImg">

                                        <br><br>
                                        
                                        <input type="file" id="file1" multiple name="upfile" onchange="loadImg(this, 1);">
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>    
                            <table class="reviewphoto-table-photos">
                                <tr>
                                    <td>
                                        <img id="contentImg1">

                                        <br><br>

                                        <input type="file" id="file2" multiple name="upfile" onchange="loadImg(this, 2);">
                                    </td>                                   
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table class="reviewphoto-table-photos">
                                <tr>
                                    <td>
                                        <img id="contentImg2">

                                        <br><br>

                                        <input type="file" id="file3" multiple name="upfile" onchange="loadImg(this, 3);">
                                    </td>                                   
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table class="reviewphoto-table-photos">
                                <tr>
                                    <td>
                                        <img id="contentImg3">
    
                                        <br><br>

                                        <input type="file" id="file4" multiple name="upfile" onchange="loadImg(this, 4);">
                                    </td>                                   
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>

            <script>
                $(function() {
                    $("#thumbImg").click(function() {
                        $("#file1").click();
                    });

                    $("#contentImg1").click(function() {
                        $("#file2").click();
                    });

                    $("#contentImg2").click(function() {
                        $("#file3").click();
                    });

                    $("#contentImg3").click(function() {
                        $("#file4").click();
                    });
                });

                function loadImg(inputFile, num) {
                    if(inputFile.files.length == 1) {
                        let reader = new FileReader();
                        reader.readAsDataURL(inputFile.files[0]);
                        reader.onload = function(e) {
                            switch(num) {
                                case 1 : $("#thumbImg").attr("src", e.target.result); break;
                                case 2 : $("#contentImg1").attr("src", e.target.result); break;
                                case 3 : $("#contentImg2").attr("src", e.target.result); break;
                                case 4 : $("#contentImg3").attr("src", e.target.result); break;
                            }
                        };
                    } else {
                        switch(num) {
                            case 1 : $("#thumbImg").attr("src", null); break;
                            case 2 : $("#contentImg1").attr("src", null); break;
                            case 3 : $("#contentImg2").attr("src", null); break;
                            case 4 : $("#contentImg3").attr("src", null); break;
                        }
                    }
                }
            </script>

            <br>

            <div class="reviewupdate-button" align="right">
                <button type="submit">수정하기</button>
                <button onclick="javascript:history.go(-1);">수정취소</button>
            </div>
        </form>

        <br>

    </div>

    <jsp:include page="../common/footer.jsp" />    

</body>
</html>