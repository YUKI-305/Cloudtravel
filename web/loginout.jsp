<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%> 
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030" />  
<title>September 9th-login</title>
<meta name="MSSmartTagsPreventParsing" content="true" />

</head>
<body>
	<%
		session.removeAttribute("userid");
		session.removeAttribute("username");
		session.removeAttribute("userphone");
		session.removeAttribute("useremail");
	%>   
	<jsp:forward page="login.jsp" />
</body>