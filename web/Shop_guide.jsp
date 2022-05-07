<%@ page import="Detail.Product" %>
<%@ page import="Detail.ProductDao" %>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8" %>
<%!
    ProductDao check = new ProductDao();
    Vector<Product> ProList = new Vector<>();
    int id1 = 1;
    int id2 = 9;
%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8"/>
    <title>云游中国·特产文创</title>
    <meta name="MSSmartTagsPreventParsing" content="true"/>

    <style type="text/css" media="all">
        @import "css/shop_guide.css";
    </style>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<%
    String accountHref = "Account.jsp";
    String wishHref = "Shop_wishlist.jsp";
    String cartHref = "Shop_cart.jsp";
    if (session.getAttribute("username") == null)
        accountHref = wishHref = cartHref = "login.jsp";

    String Page_type = request.getParameter("page");
    System.out.println(Page_type);
    if (Page_type == null) ;
    else if (Page_type.equals("prev")) {
        id1 = 1;
        id2 = 9;
    } else if (Page_type.equals("next")) {
        id1 = 10;
        id2 = 17;
    }
    ProList = check.getProductList(id1, id2);
%>
<script type="text/javascript">
$(document).ready(function () {
    let id1 = <%=id1 %>
    if(id1 == 1)
        $("#page-1").addClass("p-active");
    else
        $("#page-2").addClass("p-active");
});
</script>


<div id="page-container">
    <div id="top_logo">
        <div id="right-top">
            <input type="text" name="t1" id="t1" placeholder="给你的旅行留一个念想"/>
            <ul>
                <li id="search" title="搜索"><a href="#"></a></li>
                <li id="home" title="主页"><a href="main.jsp">&nbsp</a></li>
                <li id="community" title="社区"><a href="community_home.jsp">&nbsp</a></li>
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
            <li class="dropdown"><a class="dropbtn" href="#">定制文创</a>
                <div class="drop-down-content">
                    <div class="drop-down-image">
                        <img src="images/nav/cards.png" height="300px"/>
                    </div>
                    <div class="drop-down-word">
                        <div class="1stlist">
                            <ul>
                                <li><a href="#">中国结 Chinese Knot</a></li>
                                <li><a href="#">书签 Bookmark</a></li>
                                <li><a href="#">明信片 Postcard</a></li>
                                <li><a href="#">信封信纸 Envelope</a></li>
                            </ul>
                        </div>
                        <div class="2ndlist">
                            <ul>
                                <li><a href="#"><br/>印章邮票 Stamp</a></li>
                                <li><a href="#">胶带 Tape</a></li>
                                <li><a href="#">手账本 Book</a></li>
                                <li><a href="#">日历 Calendar</a></li>
                                <li><a href="#">钥匙扣 Keychains</a></li>
                            </ul>
                        </div>
                        <div class="3rdlist">
                            <ul>
                                <li><a href="#"><br/> <br/>胸针 Brooch</a></li>
                                <li><a href="#">礼品袋 Bag</a></li>
                                <li><a href="#">手机壳 Iphone Case</a></li>
                                <li><a href="#">便利贴 Note</a></li>
                                <li><a href="#">其他 Others</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </li>
            <li class="dropdown"><a class="dropbtn" href="#">零食馋嘴</a>
                <div class="drop-down-content">
                    <div class="drop-down-image">
                        <img src="images/nav/snack.png" height="300px"/>
                    </div>
                    <div class="drop-down-word">
                        <div class="1stlist">
                            <ul>
                                <li><a href="#">零食大礼包 Snack</a></li>
                                <li><a href="#">特产专供 Specialty</a></li>
                                <li><a href="#">新品尝鲜 New</a></li>
                            </ul>
                        </div>
                        <div class="2ndlist">
                            <ul>
                                <li><a href="#"><br/>茶饮冲饮 Tea</a></li>
                                <li><a href="#">果干蜜饯 Dried Fruit</a></li>
                                <li><a href="#">肉类卤味 Meat</a></li>
                                <li><a href="#">饼干膨化 Biscuit</a></li>
                            </ul>
                        </div>
                        <div class="3rdlist">
                            <ul>
                                <li><a href="#"><br/> <br/>珍馐海味 Seafood</a></li>
                                <li><a href="#">糖巧果冻 Candy</a></li>
                                <li><a href="#">糕点点心 Cake</a></li>
                                <li><a href="#">其他 Others</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </li>
            <li class="dropdown"><a class="dropbtn" href="#">生活家居</a>
                <div class="drop-down-content">
                    <div class="drop-down-image">
                        <img src="images/nav/furniture.png" height="300px"/>
                    </div>
                    <div class="drop-down-word">
                        <div class="1stlist">
                            <ul>
                                <li><a href="#">餐具 Tableware</a></li>
                                <li><a href="#">床品 Bed Stuff</a></li>
                                <li><a href="#">地毯桌布 Carpet</a></li>
                            </ul>
                        </div>
                        <div class="2ndlist">
                            <ul>
                                <li><a href="#"><br/>抱枕玩偶 Doll</a></li>
                                <li><a href="#">饮茶先 Tea Set</a></li>
                                <li><a href="#">厨房用品 Kitchen</a></li>
                            </ul>
                        </div>
                        <div class="3rdlist">
                            <ul>
                                <li><a href="#"><br/> <br/>家居装饰 Decoration</a></li>
                                <li><a href="#">收纳整理 Storage</a></li>
                                <li><a href="#">其他 Others</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </li>
            <li class="dropdown"><a class="dropbtn" href="#">衣装零饰</a>
                <div class="drop-down-content">
                    <div class="drop-down-image">
                        <img src="images/nav/clothes.png" height="300px"/>
                    </div>
                    <div class="drop-down-word">
                        <div class="1stlist">
                            <ul>
                                <li><a href="#">上装 Tops</a></li>
                                <li><a href="#">下装 Bottoms</a></li>
                                <li><a href="#">外套 Coat</a></li>
                            </ul>
                        </div>
                        <div class="2ndlist">
                            <ul>
                                <li><a href="#"><br/>裙装 Dress</a></li>
                                <li><a href="#">鞋子 Shoes</a></li>
                                <li><a href="#">袜子 Socks</a></li>
                            </ul>
                        </div>
                        <div class="3rdlist">
                            <ul>
                                <li><a href="#"><br/> <br/>饰品 Accessories</a></li>
                                <li><a href="#">帽子 Hats</a></li>
                                <li><a href="#">其他 Others</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </li>
            <li class="dropdown"><a class="dropbtn" href="<%=wishHref %>" style="color:#008B00;">我的心愿单</a></li>
            <li class="dropdown"><a class="dropbtn" href="<%=cartHref %>" style="color:#008B00;">购物车</a></li>
        </ul>
    </div>

    <div id="side-left">
        <ul class=side-nav>
            <li><span class="list-num">01</span>&nbsp&nbsp New Arrivals</li>
            <hr>
            <li><span class="list-num">02</span>&nbsp&nbsp Sale 折扣季</li>
            <hr>
            <li><span class="list-num" id="num03">03</span>&nbsp&nbsp 定制文创
                <button type="button" class="show show1" onclick="showlist1()"></button>
                <div id="d-list1" class="d-list">
                    <ul>
                        <li><a href="#">中国结</a></li>
                        <li><a href="#">书签卡片</a></li>
                        <li><a href="#">明信片</a></li>
                        <li><a href="#">信封信纸</a></li>
                        <li><a href="#">印章邮戳</a></li>
                        <li><a href="#">胶带</a></li>
                        <li><a href="#">手账本</a></li>
                        <li><a href="#">日历</a></li>
                        <li><a href="#">钥匙扣</a></li>
                        <li><a href="#">礼品袋</a></li>
                        <li><a href="#">手机壳</a></li>
                    </ul>
                </div>
            </li>
            <hr/>
            <li><span class="list-num" id="num04">04</span>&nbsp&nbsp 零食馋嘴
                <button type="button" class="show show2" onclick="showlist2()"></button>
                <div id="d-list2" class="d-list">
                    <ul>
                        <li><a href="#">零食大礼包</a></li>
                        <li><a href="#">特产专供</a></li>
                        <li><a href="#">新品尝鲜</a></li>
                        <li><a href="#">茶饮冲饮</a></li>
                        <li><a href="#">果干蜜饯</a></li>
                        <li><a href="#">肉类卤味</a></li>
                        <li><a href="#">饼干膨化</a></li>
                        <li><a href="#">珍馐海味</a></li>
                        <li><a href="#">糖巧果冻</a></li>
                        <li><a href="#">糕点点心</a></li>
                    </ul>
                </div>
            </li>
            <hr/>
            <li><span class="list-num" id="num05">05</span>&nbsp&nbsp 生活家居
                <button type="button" class="show show3" onclick="showlist3()"></button>
                <div id="d-list3" class="d-list">
                    <ul>
                        <li><a href="#">餐具</a></li>
                        <li><a href="#">床品</a></li>
                        <li><a href="#">地毯桌布</a></li>
                        <li><a href="#">抱枕玩偶</a></li>
                        <li><a href="#">饮茶先</a></li>
                        <li><a href="#">厨房用品</a></li>
                        <li><a href="#">家居装饰</a></li>
                        <li><a href="#">收纳整理</a></li>
                    </ul>
                </div>
            </li>
            <hr/>
            <li><span class="list-num" id="num06">06</span>&nbsp&nbsp 衣装零饰
                <button type="button" class="show show4" onclick="showlist4()"></button>
                <div id="d-list4" class="d-list">
                    <ul>
                        <li><a href="#">上装</a></li>
                        <li><a href="#">下装</a></li>
                        <li><a href="#">裙装</a></li>
                        <li><a href="#">外套</a></li>
                        <li><a href="#">鞋靴</a></li>
                        <li><a href="#">袜子</a></li>
                        <li><a href="#">饰品</a></li>
                        <li><a href="#">其他</a></li>
                    </ul>
                </div>
            </li>
            <hr/>
            <li><span class="list-num" id="num07">07</span>&nbsp&nbsp Areas 地域
                <button type="button" class="show show5" onclick="showlist5()"></button>
                <div id="d-list5" class="d-list">
                    <ul>
                        <li><a href="#">东北</a></li>
                        <li><a href="#">华北</a></li>
                        <li><a href="#">华中</a></li>
                        <li><a href="#">华东</a></li>
                        <li><a href="#">华南</a></li>
                        <li><a href="#">西北</a></li>
                        <li><a href="#">西南</a></li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>

    <div id="content">
        <div class="product">
            <table border="0">
                <%
                    for (int i = 0; i < ProList.size(); i++) {
                        if (i % 3 == 0) out.println("<tr>");
                %>
                <td>
                    <div class="card">
                        <div class="icon-list">
                            <div class="like-icon">
                                <a href=<%="Shop_product.jsp?p_id=" + ProList.get(i).getId() %>><img
                                        src="images/detailed/like.svg"/></a>
                            </div>
                            <a class="like-w" href=<%="Shop_product.jsp?p_id=" + ProList.get(i).getId() %>>Like</a>
                            <div class="buy-icon">
                                <a href=<%="Shop_product.jsp?p_id=" + ProList.get(i).getId() %>><img
                                        src="images/detailed/buy.svg"/></a>
                            </div>
                            <a class="buy-w" href=<%="Shop_product.jsp?p_id=" + ProList.get(i).getId() %>>Buy</a>
                        </div>
                        <div class="card__img"></div>
                        <div class="card__img-hover"
                             style="background-image: url(<%=ProList.get(i).getTypePic(0)%>)"></div>
                        <div class="card_info">
                            <img class="money-icon" src="images/detailed/money.svg"/><span
                                class="price"><%=ProList.get(i).getPrice()%></span>
                            <div class="card_payed"><%=ProList.get(i).getBoughtNum()%>人付款</div>
                            <h4 class="card_title"><%=ProList.get(i).getName()%>
                            </h4>
                            <span class="card_discount"><%=ProList.get(i).getActivity()%></span><span
                                class="card_kinds"> <%=ProList.get(i).getTag()%></span>
                        </div>
                    </div>
                </td>
                <%
                        if ((i + 1) % 3 == 0)
                            out.println("</tr>");
                    }
                %>
            </table>
        </div>
        <div class="pagefor">
            <ul>
                <li><a href="Shop_guide.jsp?page=prev">prev</a></li>
                <li id="page-1"><a href="Shop_guide.jsp?page=prev">1</a></li>
                <li id="page-2"><a href="Shop_guide.jsp?page=next">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">6</a></li>
                <li><a href="#">7</a></li>
                <li><a href="#">8</a></li>
                <li><a href="#">9</a></li>
                <li><a href="#">10</a></li>
                <li><a href="#">...</a></li>
                <li><a href="#">25</a></li>
                <li><a href="Shop_guide.jsp?page=next">next</a></li>
            </ul>
        </div>
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
        The Online Shop owned by <a href="">张拂晓</a> and <a href="">Her sons</a>
    </div>
</div>
<script>
    function disp(id1, id2, id3) {
        var v1 = document.getElementById(id1);
        var v2 = document.getElementById(id2);
        if (v1.style.display == "block") {
            v1.style.display = "none";
            v2.style.color = "#34a86e";
            v2.style.animation = "none";
            $(id3).css('transform', 'rotate(180deg)');
        } else {
            v1.style.display = "block";
            v2.style.color = "#fd0000";
            v2.style.animation = "wave 3s ease infinite";
            $(id3).css('transform', 'rotate(0deg)');
        }
    }

    function showlist1() {
        disp("d-list1", "num03", ".show1");
    }

    function showlist2() {
        disp("d-list2", "num04", ".show2");
    }

    function showlist3() {
        disp("d-list3", "num05", ".show3");
    }

    function showlist4() {
        disp("d-list4", "num06", ".show4");
    }

    function showlist5() {
        disp("d-list5", "num07", ".show5");
    }

</script>
<script>
    $("#search").click(function () {
        $("#t1").toggle("100");
    })

    function PageAction(page) {
        open("../Cloudtravel/Shop_guide.jsp?page=" + page, "_self");
    }
</script>
</body>