<%@ page import="Detail.Product" %>
<%@ page import="Detail.ProductDao" %>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8" %>
<%
    int colornum = 0;
    Vector<String> colorname = new Vector<>();
    Vector<String> colorpic = new Vector<>();
    int sizenum = 0;
    Vector<String> sizename = new Vector<>();

    ProductDao check = new ProductDao();
%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8"/>
    <title>September 9th</title>
    <meta name="MSSmartTagsPreventParsing" content="true"/>

    <style type="text/css" media="all">
        @import "css/shop_product.css";
    </style>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
<body>
<script type="text/javascript">

</script>
<%
    String id = request.getParameter("p_id");
    Product product = check.getProduct(Integer.parseInt(id));
    if (product == null) {
%>
<script type="text/javascript">
    alert("404");
    open("../Cloudtravel/index.html", "_self");
</script>
<%
    }
    for (int i = 0; i < product.typeSize(); i++) {
        if (colorname.lastIndexOf(product.getTypeColor(i)) == -1) {//没找到
            colornum++;
            colorname.addElement(product.getTypeColor(i));//名字
            colorpic.addElement(product.getTypePic(i));//路径
        }
        if (sizename.lastIndexOf(product.getTypeSize(i)) == -1) {//没找到
            sizenum++;
            sizename.addElement(product.getTypeSize(i));
        }
    }
    String accountHref = "Account.jsp";
    String wishHref = "Shop_wishlist.jsp";
    String cartHref = "Shop_cart.jsp";
    if (session.getAttribute("username") == null)
        accountHref = wishHref = cartHref = "login.jsp";
%>
<script type="text/javascript">
    var list_type = new Array();

    <%   for(int i=0;i <product.typeSize();i++){   %>
    list_type[<%=i%>] = ({
        id: "<%=product.getTypeId(i)%>",
        color: "<%=product.getTypeColor(i)%>",
        size: "<%=product.getTypeSize(i)%>",
        stock: "<%=product.getTypeSstock(i)%>"
    })
    <%   }   %>
    var selectedcolor = null, selectedsize = null;
</script>


<div id="page-container">
    <div id="top_logo">
        <div id="right-top">
            <input type="text" name="t1" id="t1" placeholder="给你的旅行留一个念想"/>
            <ul>
                <li id="search" title="搜索"><a href="#"></a></li>
                <li id="home" title="主页"><a href="main.jsp"></a></li>
                <li id="community" title="社区"><a href="#"></a></li>
                <li id="shop" title="特产文创"><a href="Shop_home.jsp"></a></li>
                <li id="account" title="个人中心"><a href="<%=accountHref %>">&nbsp</a></li>
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


    <div id="product-right-content">
        <div class="tag"><span>假日献礼</span></div>
        <div class="product-title"><%=product.getBrandname() %>
        </div>
        <div class="product-name"><%=product.getName() %>
        </div>
        <div class="product-price">￥<%=product.getPrice() %>
        </div>

        <div class="product-color">
				<span>款式：<%
                    for (int i = 0; i < colornum; i++) {
                        out.print(colorname.get(i));
                        if (i < colornum - 1) out.print("/");
                    }
                %></span>
            <div class="product-color-box">
                <ul id="color-nav">
                    <%
                        for (int i = 0; i < colornum; i++) {
                            out.println("<li id=" + colorname.get(i) + "><img src=\"" + colorpic.get(i) + "\"></li>");
                        }
                    %>
                </ul>
            </div>
        </div>
        <div class="product-size">
            <span>尺码：</span><span id="stock">库存：? 件</span>
            <div class="product-size-box">
                <ul id="size-nav">
                    <%
                        for (int i = 0; i < sizenum; i++) {
                            out.println("<li id=" + sizename.get(i) + ">" + sizename.get(i) + "</li>");
                        }
                    %>
                </ul>
            </div>
        </div>
        <div class="product-buttons">
            <button type="button" class="add-to-cart">加入购物车</button>
            <button type="button" class="add-to-wishlist"></button>
        </div>
        <div class="others"><br/>
            <a href="#describe">+产品描述</a>
            <a href="#chenfen">+产品材质</a>
            <a href="#aboutus" style="margin-right:0;">+品牌故事</a><br/><br/>
            <a href="#productsize">+产品规格</a>
            <a href="#deliver">+配送及退货</a>
        </div>
    </div>

    <div id="pictures-banner">
        <div class="img-wrap">
            <ul>
                <%for (int i = 0; i < colornum; i++) {%>
                <li class="item" style="display: block"><a href="#"><img
                        src=<%=colorpic.get(i) %> class="lunbo"/></a></li>
                <% }%>
            </ul>
        </div>
        <!-- 按钮 -->
        <div class="lr-tab">
            <div class="left btn"></div>
            <div class="right btn"></div>
        </div>
        <!-- 圆点 -->
        <div class="tab-btn">
            <ul>
                <li class="btn active"></li>
                <%for (int i = 1; i < colornum; i++) {%>
                <li class="btn"></li>
                <% }%>
            </ul>
        </div>
    </div>

    <hr>

    <div id="story-info">
        <h2 id="describe">产品描述</h2>
        <p><%=product.getdescribePro() %>
        </p>
        <h2 id="chenfen">产品材质</h2>
        <p><%=product.getdescribeMake() %>
        </p>
        <h2 id="productsize">产品规格</h2>
        <p><%=product.getdescribeSize() %>
        </p>
        <h2 id="deliver">配送及退货</h2>
        <p>所有商品免配送费，并受我们的退货政策所保护。由顺丰提供配送服务，即发货日起 3 至 5 个工作日内送达，法定节假日除外。
            除口罩、美妆、典藏品等用品外，顾客可在商品及包装保持原状且配件齐全（吊牌未剪、未使用、未洗涤、退货标签完整）
            的情况下，自签收起的7天内享受无理由退货服务（仅限中国大陆地区）。</p>

        <h2 id="aboutus">品牌故事</h2><%=product.getdescribeBrand() %>
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
    var time2 = setInterval(function () {
        index2++;
        if (index2 + 1 > <%=colornum%>) {
            index2 = 0;
        }
        $(".item").eq(index2).fadeIn(800).siblings().fadeOut(0);
        $(".tab-btn .btn").eq(index2).addClass("active").siblings().removeClass("active");
    }, 3000); //定时器 重复

    var index2 = 0;/*初始化一个变量 指向下标*/
    //点击点
    $(document).ready(function () {
        $(".tab-btn .btn").click(function () {
            index2 = $(this).index();//获取点击该元素下彪
            $(this).addClass("active").siblings().removeClass("active");
            $(".item").eq(index2).fadeIn().siblings().fadeOut();
        });
    });
    //点击切换效果
    $(document).ready(
        function () {
            $(".lr-tab .right").click(
                function () {
                    index2++;
                    time2 = 0;
                    if (index2 + 1 > <%=colornum%>) {
                        index2 = 0;
                    }
                    $(".item").eq(index2).fadeIn(800).siblings().fadeOut(0);
                    $(".tab-btn .btn").eq(index2)
                        .addClass("active").siblings()
                        .removeClass("active");
                });
        });
    $(document).ready(
        function () {
            $(".lr-tab .left").click(
                function () {
                    index2--;
                    time2 = 0;
                    if (index2 < 0) {
                        index2 = <%=colornum%>-1;
                    }
                    $(".item").eq(index2).fadeIn(800).siblings().fadeOut(0);
                    $(".tab-btn .btn").eq(index2).addClass("active").siblings().removeClass("active");
                });
        });
</script>

<script type="text/javascript">
    function getStock(list) {
        for (var i = 0; i < list.length; i++) {
            if (list[i].color == selectedcolor && list[i].size == selectedsize)
                return list[i].stock;
        }
        return 0;
    }
</script>
<script type="text/javascript">
    $(function () {
        var liobj = $("#size-nav li");
        liobj.each(function () {
            $(this).click(function () {
                liobj.removeClass("active")
                $(this).addClass("active");
                selectedsize = $(this).attr("id");
                document.getElementById("stock").innerHTML = "库存：" + getStock(list_type) + " 件";
            });
        });
    });

    $(function () {
        var liobj = $("#color-nav li");
        liobj.each(function () {
            $(this).click(function () {
                liobj.removeClass("active")
                $(this).addClass("active");
                selectedcolor = $(this).attr("id");
                document.getElementById("stock").innerHTML = "库存：" + getStock(list_type) + " 件";
            });
        });
    });

</script>
<script>
    $("#search").click(function () {
        $("#t1").toggle("100");
    })
</script>
<script type="text/javascript">
    $(".add-to-wishlist").click(function () {
        if (selectedcolor == null || selectedsize == null)
            alert("请选择商品颜色和尺码！");
        else {
            var username = "<%=session.getAttribute("username") %>";
            if (username == null) {
                alert("您还没有登录,请先登录！");
                open("../Cloudtravel/login.jsp", "_self");
            } else {
                for (var i = 0; i < list_type.length; i++) {
                    if (list_type[i].color == selectedcolor && list_type[i].size == selectedsize)
                        open("../Cloudtravel/Tools_buy.jsp?buy_type=1&pt_id=" + list_type[i].id + "&p_id=" + "<%=id%>", "_self");
                }
            }
        }
    })
    $(".add-to-cart").click(function () {
        if (selectedcolor == null || selectedsize == null)
            alert("请选择商品颜色和尺码！");
        else {
            var username = "<%=session.getAttribute("username") %>";
            if (username == null) {
                alert("您还没有登录,请先登录！");
                open("../Cloudtravel/login.jsp", "_self");
            } else {
                for (var i = 0; i < list_type.length; i++) {
                    if (list_type[i].color == selectedcolor && list_type[i].size == selectedsize)
                        open("../Cloudtravel/Tools_buy.jsp?buy_type=2&pt_id=" + list_type[i].id + "&p_id=" + "<%=id%>", "_self");
                }
            }
        }
    })
</script>
</body>
</html>
