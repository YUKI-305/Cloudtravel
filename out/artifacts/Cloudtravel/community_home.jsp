<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="entity.Note"%>
<%@ page import="dao.NoteDao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>community_home</title>
		<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" type="text/css" href="./css/community_home.css" />
		<style type="text/css" media="all">
			#top_logo {
				position:fixed;
				top: 0;
				height: 68px;
				width: 100%;
				background: white url(./image/logo.png) 3% 50% no-repeat;
				background-size: auto 44px;
				z-index: 9;
				font-size: 12px;
			}

			#right-top {
				width: 100%;
				height: 100%;
				float: right;
				text-align: right;
			}
			#right-top a {
				text-decoration:none;
				display:block;
				height:100%;
				weight:100%;
			}

			#t1 {
				width: 450px;
				height: 44px;
				vertical-align: top;
				line-height: 40px;
				margin: 12px 0;
				padding: 4px 16px;
				border: 0 ;
				border-radius: 4px;
				color: black;
				background-color: #F2F2F2;
			}

			#right-top ul {
				top: 50%;
				height: 100%;
				padding: 0;
				list-style-type: none;
				display:inline-block;
			}
			#right-top li,#right-top li:hover {
				float:left;
				width: 30px;
				height: 44px;
				background-repeat: no-repeat;
				background-size:auto 25px;
				background-position:50% 50%;
				margin:0 12px;
				cursor:pointer;
				transition: 0.15s all ease;
			}
			#search {
				background-image:url(./image/nav/search1.svg);
			}
			#search:hover {
				background-image:url(./image/nav/search2.svg);
			}
			#home {
				background-image:url(./image/nav/home1.svg);
			}
			#home:hover {
				background-image:url(./image/nav/home2.svg);
			}
			#community {
				background-image:url(./image/nav/community1.svg) ;
			}
			#community:hover {
				background-image:url(./image/nav/community2.svg);
			}
			#shop {
				background-image:url(./image/nav/cart1.svg);
			}
			#shop:hover {
				background-image:url(./image/nav/cart2.svg);
			}
			#account {
				background-image:url(./image/nav/account1.svg);
			}
			#account:hover {
				background-image:url(./image/nav/account2.svg);
			}
		</style>
	</head>

	<body>
	<%
		String accountHref = "Account.jsp";
		if(session.getAttribute("username") == null)
			accountHref ="login.jsp";
	%>
	<div id="top_logo">
		<div id="right-top">
			<ul>
				<li id="home" title="主页"><a href="main.jsp"></a></li>
				<li id="community" title="社区"><a href="#"></a></li>
				<li id="shop" title="特产文创"><a href="Shop_home.jsp"></a></li>
				<li id="account" title="个人中心"><a href="<%=accountHref %>"></a></li>
			</ul>
		</div>
	</div>

		<%
	    ArrayList<Note> list=NoteDao.showAll();
	    int i=0;
	    Note bean=list.get(i);
	    %>
	    <div class="head-button"> 	
	    	<input type="button" onclick='window.open("write_note.jsp")' value="写 笔 记"/>    	
	    </div>
	    
	    <form action="selectNoteByWord" class="form-wrapper cf" method="post">
		    <input type="text" placeholder="搜索笔记" name="word" required>
		    <button type="submit">搜 索</button>
		</form>		
		<!-- <div class="support-grid"></div> -->
		<div class="band">
		    <div class="item-1">
		          <a href=note_content.jsp?Number=<%=bean.getNumber()%> target="_blank" class="card">
		            <div class="thumb" style="background-image: url(<%=bean.getSrc()%>);"></div>
		            <article>
		              <h1><%=bean.getTitle()%></h1>
		              <span><%=bean.getName()%></span>
		            </article>
		          </a>
		    </div>
			
			<%i++;
			  while(i<list.size()){
				bean=list.get(i++); %>
		        <div class="item-2">
		          <a href=note_content.jsp?Number=<%=bean.getNumber()%> target="_blank" class="card">
		            <div class="thumb" style="background-image: url(<%=bean.getSrc()%>);"></div>
		            <article>
		               <div>
			              <h1><%=bean.getTitle()%></h1>
			              <br>
			              &nbsp;&nbsp;&nbsp;
			              <%if((bean.getTexts()).length()<115){%>
			              <%=bean.getTexts()%>
			              <%}
			              else{%>
			              	<%=(bean.getTexts()).substring(0,115)%>...
			              <%}%>
		            	</div>
		                <span><%=bean.getName()%></span>
		            </article>
		          </a>
		        </div>
		    <%
		    } %>		     
		</div>
	</body>
</html>

