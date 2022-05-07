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
		<title>community_search</title>
		<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" type="text/css" href="./css/community_home.css" />
		<style type="text/css" media="all">			
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
	    <form action="selectNoteByWord" class="form-wrapper cf" method="post">
		    <input type="text" placeholder="搜索笔记" name="word" required>
		    <button type="submit">搜 索</button>
		</form>
		
		<div class="band">
			<c:if test="${clist.size()==0 }">
			<p style="font-size:20px;text-align:center;">暂无相关笔记</p>
			</c:if>
			
			<c:if test="${clist.size()>0 }">
			  <div class="item-1">
			     <a href=note_content.jsp?Number=${clist[0].number} target="_blank" class="card">
				     <div class="thumb" style="background-image: url(${clist[0].src});"></div>
				     <article>
				         <h1>${clist[0].title}</h1>
				         <span>${clist[0].name}</span>
				     </article>
			     </a>
			  </div>
			</c:if>
			
			
		    <c:if test="${clist.size()>1 }">
			  <c:forEach var="u" items="${clist}" begin="1">
		    	<div class="item-2">
		          <a href=note_content.jsp?Number="${u.number}" target="_blank" class="card">
		            <div class="thumb" style="background-image: url(${u.src});"></div>
		            <article>
			            <div>
			              <h1>${u.title}</h1>
			              <br>
	   					  &nbsp;&nbsp;&nbsp;
			              <c:if test="${u.texts.length()<115 }">
			              	${u.texts}
			              </c:if>
			              <c:if test="${u.texts.length()>=115 }">
			              	${u.texts.substring(0,115)}...
			              </c:if>
			            </div>
		                <span>${u.name}</span>
		            </article>
		          </a>
		    	</div>
		      </c:forEach>
		    </c:if>
		    
		</div>
		
	</body>
</html>

