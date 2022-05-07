<%@ page import="Detail.Wishlist" %>
<%@ page import="Detail.ProductDao" %>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8" %>
<%!
    ProductDao check = new ProductDao();
    Vector<Wishlist> WishList = new Vector<>();
%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8"/>
    <title>云游中国 - 我的喜欢</title>
    <meta name="MSSmartTagsPreventParsing" content="true"/>

    <style type="text/css" media="all">
        @import "css/shop_wishlist.css";
    </style>
    <script src="http://code.jquery.com/jquery-latest.js"></script>

</head>
<body>
<%
    String accountHref = "Account.jsp";
    String wishHref = "Shop_wishlist.jsp";
    String cartHref = "Shop_cart.jsp";
    if(session.getAttribute("username") == null)
        accountHref = wishHref = cartHref ="login.jsp";

    String userid = (String) session.getAttribute("userid");
    WishList = check.getWishList(Integer.parseInt(userid));
%>
<script type="text/javascript">
    var wishlist = new Array();

    <%   for(int i=0;i <WishList.size();i++){   %>
    wishlist[<%=i%>] = ({
        p_id: "<%=WishList.get(i).getP_id()%>",
        pt_id: "<%=WishList.get(i).getPt_id()%>",
    })
    <%   }   %>
</script>
<div id="page-container">
    <div id="top_logo">
        <div id="right-top">
            <input type="text" name="t1" id="t1" placeholder="给你的旅行留一个念想"/>
            <ul>
                <li id="search" title="搜索"><a href="#"></a></li>
                <li id="home" title="主页"><a href="main.jsp">&nbsp</a></li>
                <li id="community" title="社区"><a href="#">&nbsp</a></li>
                <li id="shop" title="特产文创"><a href="Shop_home.jsp"></a></li>
                <li id="account" title="个人中心"><a href="<%=accountHref %>"></a></li>
            </ul>
        </div>
    </div>
    <div id="main-nav">
        <ul>
            <li class="dropdown"><a class="dropbtn" href="Shop_home.jsp">商城首页</a></li>
            <li class="dropdown"><a class="dropbtn" href="Shop_guide.jsp">新品上市</a></li>
            <li class="dropdown"><a class="dropbtn" href="Shop_guide.jsp">SALE 折扣季</a></li>
            <li class="dropdown"><a class="dropbtn" href="Shop_guide.jsp">定制文创</a></li>
            <li class="dropdown"><a class="dropbtn" href="Shop_guide.jsp">零食馋嘴</a></li>
            <li class="dropdown"><a class="dropbtn" href="Shop_guide.jsp">生活家居</a></li>
            <li class="dropdown"><a class="dropbtn" href="Shop_guide.jsp">衣装零饰</a></li>
            <li class="dropdown"><a class="dropbtn" href="<%=wishHref %>" style="color:#008B00;">我的心愿单</a></li>
            <li class="dropdown"><a class="dropbtn" href="<%=cartHref %>" style="color:#008B00;">购物车</a></li>
        </ul>
    </div>

    <div class="login-container">
        <p id="hello"><%=session.getAttribute("username")%>'s Wish List </p>
        <%for (int i = 0; i < WishList.size(); i++) {%>
        <hr>
        <div class="item">
            <div class="item-num"><%=i + 1 %>
            </div>
            <div class="item-pic"><img src="<%=WishList.get(i).getPic() %>"></div>
            <div class="item-info">
                <div class="info-p-brand"><%=WishList.get(i).getBrandname() %>
                </div>
                <div class="info-p-name"><%=WishList.get(i).getName() %>
                </div>
                <div class="info-p-color">
                    <span><%=WishList.get(i).getColor() %> </span>
                    <span> <%=WishList.get(i).getSize() %></span></div>
            </div>
            <div class="item-buy">
                <div class="info-p-price">￥<%=WishList.get(i).getPrice() %>
                </div>
                <input type="submit" class="button info-p-buy" value="加入购物车" onclick="AddToCart(<%=i %>)"/>
            </div>
        </div>
        <% } %>
        <hr>
    </div>

    <div id="footer">
        <div id="altnav">
            <a href="">About</a> - <a href="">Contact Us</a> -
            <a href="">User Agreement</a> - <a href="">Privacy Policy</a> -
            <a href="">Join Us</a>
        </div>
        Designed by &copy; Happy Bald Team <br/>
        The Online Shop owned by <a href="">张拂晓</a> and <a href="">Her Daddy</a>
    </div>
</div>
<script type="text/javascript">
    function AddToCart(i) {
        if (window.confirm("确定要加入购物车吗？")) {
            open("../Cloudtravel/Tools_buy.jsp?buy_type=3&pt_id=" + wishlist[i].pt_id + "&p_id=" + wishlist[i].p_id, "_self");
        }
    }
</script>
</body>