<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8" %>
<%@ page import="login.CheckUser" %>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8"/>
    <title>September 9th-Account</title>
    <meta name="MSSmartTagsPreventParsing" content="true"/>

    <style type="text/css" media="all">
        @import "css/account.css";
    </style>
    <script src="http://code.jquery.com/jquery-latest.js"></script>

</head>
<body>
<div id="page-container">
    <div id="top_logo">
        <div id="right-top">
            <input type="text" name="t1" id="t1" placeholder="给你的旅行留一个念想..."/>
            <ul>
                <li id="search" title="搜索"><a href="#"></a></li>
                <li id="home" title="主页"><a href="main.jsp"></a></li>
                <li id="community" title="社区"><a href="community_home.jsp"></a></li>
                <li id="shop" title="特产文创"><a href="Shop_home.jsp"></a></li>
                <li id="account" title="个人中心"><a href="#"></a></li>
            </ul>
        </div>
    </div>

    <div class="login-container">
        <div id="profile">
            <img id="profile-pic" src="<%=session.getAttribute("userPic")%>">
            <input id="uploadImage" name="file" accept=".png,.jpg,.jpeg" type="file" style="display: none">
            <input id="ImageVal" style="display:none"/>
            <p id="profile-name"><%=session.getAttribute("username")%>
            </p>
        </div>
        <hr>
        <div class="item phone">
            <div class="item-left">手机账号</div>
            <div class="item-right">
                <div class="tips">可用该手机号登录云游中国</div>
                <div class="number">123456789
                </div>
                <a href="#">修改手机号 ></a>
            </div>
        </div>
        <hr>
        <div class="item email">
            <div class="item-left">邮箱账号</div>
            <div class="item-right">
                <div class="tips">可用该邮箱号登录云游中国</div>
                <div class="number"><%=session.getAttribute("useremail")%>
                </div>
                <a href="#">修改邮箱 ></a>
            </div>
        </div>
        <hr>
        <div class="item social">
            <div class="item-left">社交账号</div>
            <div class="item-right">
                <div class="tips">绑定社交账号，绑定后可以使用账号直接登录</div>
                <a id="weibo">新浪微博(已绑定)：孩子今天不早起Yeah </a><a id="qq"> 腾讯QQ(已绑定)：1559342051</a>
            </div>
        </div>
        <input class="button" type="submit" value="退出登录" onclick="Loginout()">
    </div>

    <div id="footer">
        <div id="altnav">
            <a href="">About</a> -
            <a href="">Contact Us</a> -
            <a href="">User Agreement</a> -
            <a href="">Privacy Policy</a> -
            <a href="">Join Us</a>
        </div>
        Designed by &copy; Happy Bald Team <br/>
        The Online Shop owned by <a href="">张拂晓</a> and <a href="">Her Daddy</a>
    </div>
</div>
<script type="text/javascript">
    function Loginout() {
        if (window.confirm("确定要退出登录吗？")) {
            window.location.href = "loginout.jsp";
        }
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        //图片上传控件初始化
        uploadImg.initUploadImg();
    })
    //头像上传相关
    var uploadImg = {
        initUploadImg: function () {
            $("#profile-pic").click(function () {
                setTimeout(function () {
                    $("#uploadImage").click(); //隐藏了input:file样式后，点击头像就可以本地上传
                }, 200);//这个地方做了延时点击，也可以去掉，直接 $("#uploadImage").click();
                $("#uploadImage").on("change", function () {
                    var objType = uploadImg.getObjectType(this.files[0]);
                    if (objType == "jpg" || objType == "png" || objType == "jpeg") {
                        var objUrl = uploadImg.getObjectURL(this.files[0]); //获取图片的路径，该路径不是图片在本地的路径
                        if (objUrl) {
                            $("#profile-pic").attr("src", objUrl); //将图片路径存入src中，显示出图片
                            uploadImg.upimg();
                            open("../Cloudtravel/Profile_edit.jsp?pic_url=" + objUrl, "_self");
                        }
                    } else {
                        alert("请上传jpg|png|jpeg类型的图片");
                    }
                });
            });
        },
        upimg: function () {
            var Image = $('#uploadImage')[0].files[0];
            var file = new FormData();
            file.append('file', Image);
            $.ajax({
                url: "images/login",
                type: "post",
                data: file,
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    if (data) {
                        if (data.Success) {
                            $("#profile-pic").attr("src", data.Data);
                            $("#ImageVal").val(data.Data);
                        } else {
                            alert(data.Message);
                        }
                    }
                }
            });
        },
        getObjectType: function (file) {
            var type = "";
            if (file != null) {
                var typeSplit = file.type.split("/");
                if (typeSplit.length == 2) {
                    type = typeSplit[1].toLowerCase();
                }
            }
            return type;
        },
        getObjectURL: function (file) {
            var url = null;
            if (window.createObjectURL != undefined) { // basic
                url = window.createObjectURL(file);
            } else if (window.URL != undefined) { // mozilla(firefox)
                url = window.URL.createObjectURL(file);
            } else if (window.webkitURL != undefined) { // webkit or chrome
                url = window.webkitURL.createObjectURL(file);
            }
            return url;
        },
    }

</script>
</body>