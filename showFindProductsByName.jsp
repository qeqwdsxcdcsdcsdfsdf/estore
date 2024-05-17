<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.*"%>
<%@ page import="cn.estore.dao.ProductDao "%>
<%@page import="cn.estore.entity.ProductEntity "%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	ProductDao dao = new ProductDao();
	List findList = null;
	request.setCharacterEncoding("utf-8");
	String search=request.getParameter("search").trim();	
	findList = (List)dao.selectProductsSearch(search);
	session.setAttribute("list",findList);	
%>
<jsp:forward page="main.jsp"></jsp:forward>
</body>
</html>