<%@ page import="login.finduser" %>
<%@ page import="login.user" %>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
<title>CampusChain</title>

<style type="text/css" media="all">
@import "login.css";
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>

</head>
<body>
	<%
		response.setContentType("text/html;charset=UTF-8");
		//String Name = request.getParameter("SignUpName");
		String paw = request.getParameter("SignUpPassword");
		String Email = request.getParameter("SignUpEmail");
		//String username = new String(Name.getBytes("ISO-8859-1"), "UTF-8");
		String username=new String(request.getParameter("SignUpName").getBytes("ISO-8859-1"),"UTF-8");
		finduser check = new finduser();
		out.print(username);
		int flag = check.signInCheck(username, paw, Email);
		
		if (flag == 0) {
	%>
	<jsp:forward page="login.jsp" />
	<%
		} 
	%>
</body>