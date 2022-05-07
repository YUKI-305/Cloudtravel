<%@ page import="login.CheckUser" %>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8" %>

<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8"/>
    <title>September 9th-login</title>
    <meta name="MSSmartTagsPreventParsing" content="true"/>

    <style type="text/css" media="all">
        @import "css/login.css";
    </style>

</head>
<body>
<%
    String pic_url = request.getParameter("pic_url");
    String u_id = (String) session.getAttribute("userid");

    CheckUser check = new CheckUser();
    check.changePic(Integer.parseInt(u_id),pic_url);
    session.setAttribute("userPic", pic_url);
%>
<jsp:forward page="Account.jsp"/>

</body>
