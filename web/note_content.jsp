<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="entity.Note"%>
<%@ page import="dao.NoteDao"%>
<%@ page import="entity.Comment"%>
<%@ page import="dao.CommentDao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>note_content</title>
	<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="./css/note_content.css" />
	<style type="text/css" media="all">			
	</style>
  </head>
  
  <body>
    <div id="parallax-world-of-ugg">
    <%  
        String num =request.getParameter("Number");
        ArrayList<Note> li=NoteDao.selectByNumber(num);
	    Note be=li.get(0);
	    ArrayList<Comment> cli=CommentDao.selectByNumber(num);
	    int i=0;
	    
     %>
     
		<section>
		  <div class="title">
		    <h1><%=be.getName() %></h1>
		    <h3><%=be.getTime() %></h3>
		  </div>
		</section>
		
		<section>
		    <div class="parallax-one" style="background-image: url(<%=be.getSrc()%>);">
		      
		    </div>
		</section>
		
		<section>
		  <div class="block">
		    <h2><%=be.getTitle() %></h2>
		    <p><span class="first-character sc"><%=be.getTexts().substring(0,1) %></span><%=(be.getTexts().substring(1,be.getTexts().length())).replaceAll("  ","<br><br>") %></p>
		    <br>
		    <p class="line-break margin-top-10"></p>
		    <!-- <p class="margin-top-10"></p> -->
		  </div>
		</section>
		  
	</div>
	<div class="comment-title">
	  <p>评论(<%=cli.size() %>)</p>
	  </div>
	<div class="comments-app" ng-app="commentsApp" ng-controller="CommentsController as cmntCtrl">	
	  
	  <!-- From -->
	  <div class="comment-form">
	    <!-- Comment Avatar -->
	    <div class="comment-avatar" style="background-image: url(https://gimg2.baidu.com/image_search/src=http%3A%2F%2Finews.gtimg.com%2Fnewsapp_bt%2F0%2F13470940351%2F1000.jpg&refer=http%3A%2F%2Finews.gtimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1654154955&t=d9ccb82c1eb2e5e09e0ff3049d163dd2);
	    z-index:99;
	    background-size: cover;
  background-position: center center;">
	      <!-- <img src="https://img2.woyaogexing.com/2018/09/05/57186893e6fa49a6a70260ac12f344f7!400x400.jpeg" alt=""/> -->
	    </div>
	
	    <form class="form" name="form">
	      <div class="form-row">
	        <textarea
	                  class="input"
	                  ng-model="cmntCtrl.comment.text"
	                  placeholder="填写评论..."
	                  required></textarea>
	      </div>
	
	      <div class="form-row text-right">
	        <input
	               id="comment-anonymous"
	               ng-change="cmntCtrl.anonymousChanged()"
	               ng-model="cmntCtrl.comment.anonymous"
	               type="checkbox">
	        <label for="comment-anonymous">匿名</label>
	      </div>
	
	      <div class="form-row">
	        <input type="submit" value="发布评论">
	      </div>
	    </form>
	  </div>
	  <%if(cli.size()!=0){
	  	Comment cbean=cli.get(i);
	   %>
	  <!-- Comments List -->
	  <div class="comments">
		<%
			  while(i<cli.size()){
				cbean=cli.get(i++); %>
	    <!-- Comment - Dummy -->
	    <div class="comment">
	      <!-- Comment Avatar -->
	      <div class="comment-avatar">
	        <img src="https://gimg2.baidu.com/image_search/src=http%3A%2F%2Finews.gtimg.com%2Fnewsapp_bt%2F0%2F13470940351%2F1000.jpg&refer=http%3A%2F%2Finews.gtimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1654154955&t=d9ccb82c1eb2e5e09e0ff3049d163dd2"/>
	      </div>
	
	      <!-- Comment Box -->
	      <div class="comment-box">
	        <div class="comment-text"><%=cbean.getContent() %></div>
	        <div class="comment-footer">
	          <div class="comment-info">
	            <span class="comment-author">
	              <a href="#">
	              <%if(cbean.getA()==1){ %>
	                                        匿名
	              <%} else{ %>
	              <%=cbean.getName() %>
	              <%} %></a>
	            </span>
	            <span class="comment-date"><%=cbean.getTime() %></span>
	          </div>
	
	          <div class="comment-actions">
	            <a href="#">回复</a>
	          </div>
	        </div>
	      </div>
	    </div>
	    <%
		} %>
	  </div>
	  <%} %>
	  
	  
	</div>
  </body>
</html>
