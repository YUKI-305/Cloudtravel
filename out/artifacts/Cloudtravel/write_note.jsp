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
		<link rel="stylesheet" type="text/css" href="./css/write_note.css" />
		<style type="text/css" media="all">			
		</style>
	</head>

	<body>
		
	    	
		
		<div class="comments-app" ng-app="commentsApp" ng-controller="CommentsController as cmntCtrl">	
		
		<div class="comment-form">
	    
	
	    <form class="form" action="writeNote" method="post" name="form" ng-submit="form.$valid && cmntCtrl.addComment()" novalidate>
	      <p style="font-weight:600;">标题<font color="red">*</font>：</p>
	      <div class="form-title">
	        <textarea name="title"
	                  class="input"
	                  ng-model="cmntCtrl.comment.text"
	                  placeholder="填写标题..."
	                  required></textarea>
	      </div>
	      <p style="font-weight:600;">正文<font color="red">*</font>：</p>
	      <div class="form-row">
	        <textarea name="texts"
	                  class="input"
	                  ng-model="cmntCtrl.comment.text"
	                  placeholder="填写笔记..."
	                  required></textarea>
	      </div>
	      <p style="font-weight:600;">封面：</p>
	      <div class="form-img">
	        <textarea name="img"
	                  class="input"
	                  ng-model="cmntCtrl.comment.text"
	                  placeholder="可填一个图片网址"
	                  required></textarea>
	      </div>
	<!--
	      <div class="form-row text-right">
	        <input
	               id="comment-anonymous"
	               ng-change="cmntCtrl.anonymousChanged()"
	               ng-model="cmntCtrl.comment.anonymous"
	               type="checkbox">
	        <label for="comment-anonymous">匿名</label>
	      </div>
	  -->
	      <div class="form-row">
	        <input type="submit" value=" 发  布 ">
	      </div>
	    </form>
	    
	    
	  </div>
	  
	  </div>
	</body>
</html>
