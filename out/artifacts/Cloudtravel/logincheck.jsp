<%@ page import="login.finduser" %>
<%@ page import="login.user" %>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
<title>CampusChain-login</title>

<style type="text/css" media="all">
@import "login.css";
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>

</head>
<body>
	<%
		System.out.println("111");
		String Loginname = request.getParameter("SignInEmail");
		String Loginpaw = request.getParameter("SignInPassword");
		finduser check = new finduser();

		user user1 = check.usercheck(Loginname, Loginpaw);

		if (user1 == null) {
	%>	
	<script type="text/javascript">
		alert("用户名密码错误！请重新输入");
		open("../Cloudtravel/login.jsp", "_self");
	</script>

	<%
		} else {	
			session.setAttribute("user1", user1);
			session.setAttribute("userid", ""+user1.getUserID());
			session.setAttribute("username", user1.getUserName());
			session.setAttribute("useremail", user1.getUserEmail());
			session.setAttribute("userPic", user1.getUserHead());
	%>
    
	<jsp:forward page="main.jsp" />
	<%
		}
	%>
	
</body>