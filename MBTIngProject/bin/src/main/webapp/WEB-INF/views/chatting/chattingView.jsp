<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=\, initial-scale=1.0">
    <title>Document</title>

<style>
.wrap {
    width : 1200px;
    height : 900px;
    border: 1px solid black;
}

#chatTable {
    width: 100%;
    height: 100%;
}

#chatTable td {
    width : 100px
}

#chatTable div{
 display: inline-block;
 border: 1px solid red;
 width :250px;
 height : 250px;
}

#chatTable img {  
    height : 100%;
    width: 100%;
    border-radius: 110px;
    border: 1px double black;
}

#profile {
    text-align: center;
    border: 1px solid blue;
    width: 50%;
    height: 100%;
}

#myProfile {
    position: absolute;
    
}

#YourProfile {
    position: relative;
    margin-left: 190px;
}


</style>
</head>
<body>
    <div class="wrap">
        <table id="chatTable" border="1px;">
            <tr>
                <td id="profile" rowspan="6">
                    <div id="myProfile">
                    <img src="https://search.pstatic.net/common?type=f&size=130x130&quality=95&direct=true&src=https%3A%2F%2Fs.pstatic.net%2Fshop.phinf%2Fshop%2F20230523_177%2F1684768823565YYWui_JPEG%2FIMG_0569.jpeg">
                    </div>
                    <div id="YourProfile">
                        <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20140122_75%2Fredduck44_13903934461985QeQ4_JPEG%2F1390393449120_CAM11543.jpg&type=a340">
                    </div>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td><td>
            </tr>
            <tr>
                <td></td>
            </tr>           
        </table>
    </div>
</body>
</html>