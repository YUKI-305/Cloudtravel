<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>云游 · 中国</title>
	<meta name="MSSmartTagsPreventParsing" content="true"/>

	<style type="text/css" media="all">
		@import "css/shop_home.css";
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
	%>
	<div id="page-container">
		<div id="top_logo">
			<div id="right-top">
				<input type="text" name="t1" id="t1" placeholder="给你的旅行留一个念想..." />
				<ul>
					<li id="search" title="搜索"><a href="#"></a></li>
					<li id="home" title="主页"><a href="main.jsp"></a></li>
					<li id="community" title="社区"><a href="community_home.jsp"></a></li>
					<li id="shop" title="特产文创"><a href="Shop_home.jsp"></a></li>
					<li id="account" title="个人中心"><a href="<%=accountHref %>"></a></li>
				</ul>
			</div>
		</div>

		<div class="banner">
			<div class="img-wrap">
				<ul>
					<li class="item" style="display: block"><a href="#"><img
                            src="./images/banner/banner01.jpg" class="lunbo" /></a></li>
					<li class="item"><a href="#"><img
                            src="./images/banner/banner02.png" class="lunbo" /></a></li>
					<li class="item"><a href="#"><img
                            src="./images/banner/banner03.png" class="lunbo" /></a></li>
					<li class="item"><a href="#"><img
                            src="./images/banner/banner04.png" class="lunbo" /></a></li>
					<li class="item"><a href="#"><img
                            src="./images/banner/banner05.png" class="lunbo" /></a></li>
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
					<li class="btn"></li>
					<li class="btn"></li>
					<li class="btn"></li>
					<li class="btn"></li>
				</ul>
			</div>
		</div>

		<div id="main-nav">
			<ul>
				<li class="dropdown"><a class="dropbtn" href="Shop_home.jsp"
										style="color: #008B00">商城首页</a></li>
				<li class="dropdown"><a class="dropbtn" href="Shop_guide.jsp">新品上市</a></li>
				<li class="dropdown"><a class="dropbtn" href="Shop_guide.jsp">SALE 折扣季</a></li>
				<li class="dropdown"><a class="dropbtn" href="Shop_guide.jsp">定制文创</a>
				<li class="dropdown"><a class="dropbtn" href="Shop_guide.jsp">零食馋嘴</a>
				<li class="dropdown"><a class="dropbtn" href="Shop_guide.jsp">生活家居</a>
				<li class="dropdown"><a class="dropbtn" href="Shop_guide.jsp">衣装零饰</a>
				<li class="dropdown"><a class="dropbtn" href="<%=wishHref %>">心愿单</a></li>
				<li class="dropdown"><a class="dropbtn" href="<%=cartHref %>">购物车</a></li>
			</ul>
		</div>

		<div id="content">
			<div id="c_Souvenir">
				<div class="line"> </div>
				<div class="first-title"><div class="pen-note"> </div>———— 01 / Souvenir</div>
				<div class="second-title">
					凡是梦里到过的地方，我都朝思暮想，念念成双。<br/>
					但愿能收到一封来自远方的信笺，纪念彼时的思念与歌谣。<br/>
					看啊，那大雁南来北往。
				</div>
				<div id="Souvenir_Card">
					<div class="card" style="background-image: url(./images/shop_home/book.jpg)">
						<div class="card-border"> </div>
						<div class="card-mask"> </div>
						<div class="card-content">
							<h2 class="card-title">笔记本</h2>
							<p class="card-text">有约不来过夜半，闲敲棋子落灯花。</p>
						</div>
					</div>
					<div class="card" style="background-image: url(./images/shop_home/postcard.jpg)">
						<div class="card-border"> </div>
						<div class="card-mask"> </div>
						<div class="card-content">
							<h2 class="card-title">明信片</h2>
							<p class="card-text">玲珑骰子安红豆，入骨相思知不知。</p>
						</div>
					</div>
					<div class="card" style="background-image: url(./images/shop_home/letter.jpg)">
						<div class="card-border"> </div>
						<div class="card-mask"> </div>
						<div class="card-content">
							<h2 class="card-title">信笺</h2>
							<p class="card-text">何当共剪西窗烛，却话巴山夜雨时。</p>
						</div>
					</div>
					<div class="card" style="background-image: url(./images/shop_home/stamp.jpg)">
						<div class="card-border"> </div>
						<div class="card-mask"> </div>
						<div class="card-content">
							<h2 class="card-title">邮票</h2>
							<p class="card-text">晓看天色暮看云，行也思君，坐也思君。</p>
						</div>
					</div>
				</div>
			</div>
			<div id="c_painting">
				<div class="line"> </div>
				<div class="first-title"><div class="pen-note"> </div>———— 02 / Painting</div>
				<div class="second-title">
					中国旅游地经典画作展示，可自由定制明信片、冰箱贴、马克杯、日历、折扇。
				</div>
				<div class="painting-card" style="height: 420px">
					<div class="paint-left" style="background-image: url(./images/shop_home/paint-sea.png)"></div>
					<div class="paint-right">
						<div>
							<h1>暮江吟</h1>
							<p>一道残阳铺水中，半江瑟瑟半江红。<br/>
								可怜九月初三夜，露似真珠月似弓。
							</p>
						</div>
					</div>
				</div>
				<div class="painting-card" style="height: 360px">
					<div class="paint-left" style="background-image: url(./images/shop_home/paint2.png)"></div>
					<div class="paint-right" style="background-color: #d4e5dd">
						<div>
							<h1>钱塘湖春行</h1>
							<p>孤山寺北贾亭西，水面初平云脚低。<br/>
								几处早莺争暖树，谁家新燕啄春泥。<br/>
								乱花渐欲迷人眼，浅草才能没马蹄。<br/>
								最爱湖东行不足，绿杨阴里白沙堤。
							</p>
						</div>
					</div>
				</div>
				<div class="painting-card" style="height: 380px">
					<div class="paint-right" style="background-color: #DFD6D7">
						<div>
							<h1>苏幕遮</h1>
							<p>碧云天，黄叶地，秋色连波，波上寒烟翠。<br/>
								山映斜阳天接水，芳草无情，更在斜阳外。<br/>
								黯乡魂，追旅思，夜夜除非，好梦留人睡。<br/>
								明月楼高休独倚，酒入愁肠，化作相思泪。
							</p>
						</div>
					</div>
					<div class="paint-left" style="background-image: url(./images/shop_home/paint1.png)"></div>
				</div>

			</div>

			<div>
				<div class="line"> </div>
				<div class="first-title" ><div class="pen-note"> </div>———— 03 / Seasons</div>
				<div class="second-title">
					四季限定，劲爆来袭！<br/>
					在春意盎然里采撷鲜花，在夏日晚风中纵情歌舞，在秋水瑟瑟间亲吻夕阳，在冬日暖阳下点一炉香。
				</div>
				<div id="Seasons">
					<div class='highlight'></div>
					<div></div>
					<div></div>
					<div></div>
				</div>
			</div>
		</div>

		<div id="footer">
			<div id="altnav">
				<a href="#">About</a> -
				<a href="#">Contact Us</a> -
				<a href="#">User Agreement</a> -
				<a href="#">Privacy Policy</a> -
				<a href="#">Join Us</a>
			</div>
			Designed by &copy; Happy Bald Team <br />
			The Online Shop owned by <a href="">张拂晓</a> and <a href="">Her Daddy</a>
		</div>

	</div>
	<script type="text/javascript">
		var index2 = 0;/*初始化一个变量 指向下标*/
		//点击点
		$(document).ready(function() {
			$(".tab-btn .btn").click(function() {
				index2 = $(this).index();//获取点击该元素下标
				$(this).addClass("active").siblings().removeClass("active");
				$(".item").eq(index2).fadeIn().siblings().fadeOut();
			});
		});
		//点击切换效果
		$(document).ready(function () {
			$(".lr-tab .right").click(function () {
				index2++;
				if (index2 > 4) {
					index2 = 0;
				}
				$(".item").eq(index2).fadeIn().siblings().fadeOut();
				$(".tab-btn .btn").eq(index2)
						.addClass("active").siblings()
						.removeClass("active");
			});
		});
		$(document).ready(function () {
			$(".lr-tab .left").click(function () {
				index2--;
				if (index2 == 0) {
					index2 = 4;
				}
				$(".item").eq(index2).fadeIn().siblings().fadeOut();
				$(".tab-btn .btn").eq(index2).addClass("active").siblings().removeClass("active");
			});
		});
		var time2 = setInterval(function() {
			index2++;
			if (index2 > 4) {
				index2 = 0;
			}
			$(".item").eq(index2).fadeIn().siblings().fadeOut();
			$(".tab-btn .btn").eq(index2).addClass("active").siblings().removeClass("active");
		}, 4000); //定时器 重复
	</script>

	<script type="text/javascript">
		var divs = document.querySelectorAll("#Seasons div");
		divs.forEach(function(elm) {
			elm.addEventListener("mouseenter", function() {
				var panel = document.querySelector(".highlight");
				panel.classList.toggle("highlight");
				elm.classList.toggle("highlight");
			});
		});
		window.focus();
	</script>
</body>
</html>
