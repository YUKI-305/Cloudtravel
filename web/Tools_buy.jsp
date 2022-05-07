<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8" %>
<%@ page import="login.CheckUser" %>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8"/>
    <title>云游 · 中国</title>
</head>
<body>
<script type="text/javascript">
<%
    String buy_type = request.getParameter("buy_type");
    String p_id = request.getParameter("p_id");
    String pt_id = request.getParameter("pt_id");
    String u_id = (String) session.getAttribute("userid");
    if(u_id == null) {%>
        alert("您还没有登录,请先登录！");
        <jsp:forward page="login.jsp" />
<%}
    CheckUser check = new CheckUser();
    System.out.println("buy_type: "+buy_type+" p_id: "+p_id+" pt_id: "+pt_id+" u_id: "+u_id);
    if (buy_type.equals("1")) // add to wishlist
        check.addToWishList(Integer.parseInt(u_id), Integer.parseInt(p_id), Integer.parseInt(pt_id));
    else if(buy_type.equals("2"))// add to cart
        check.addToCart(Integer.parseInt(u_id), Integer.parseInt(p_id), Integer.parseInt(pt_id));
    else if(buy_type.equals("3")){// add to cart 并返回心愿单
        check.addToCart(Integer.parseInt(u_id), Integer.parseInt(p_id), Integer.parseInt(pt_id));%>
        <jsp:forward page="Shop_wishlist.jsp" />
    <%} %>
        alert("添加成功！");
        open("../Cloudtravel/Shop_product.jsp?p_id=" + "<%=p_id%>", "_self");
</script>

</body>