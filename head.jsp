<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="cn.estore.entity.CustomerEntity"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<%
			String curPath = request.getContextPath().trim();
			String userlink = "/newProject/pages/customer/userLoginPlease.jsp";
			String orderlink = "/newProject/pages/customer/userLoginPlease.jsp";
			String shoppinglink = "/newProject/pages/customer/userLoginPlease.jsp";
			String orderlink2 = "/newProject/pages/customer/userLoginPlease.jsp";
			 CustomerEntity  user = null;
			if (session.getAttribute("user") != null) {
				user = (CustomerEntity)session.getAttribute("user");
				userlink = "/newProject/pages/customer/userUpdate.jsp?name="
						+ user.getUserName();
				shoppinglink = "/newProject/pages/cart/cartShow.jsp";
				//String realPath=request.getRequestURI();
				String realPath = application.getRealPath("/");
				orderlink = "/newProject/OrderServlet?orderAction=orderAbstract";//发起查看当前用户所有订单请求 (用完成servlet/javabean/jsp)  
			}

			//String backOrder = "/estore/OrderServlet?orderAction=selectAllOrder";
		%>
<table width="1024" height="80" bordercolor="#FFFFFF" bgcolor="#ffff"
border="0" align="center"  cellpadding="0" cellspacing="0"
background="/newProject/systemImages/top.jpg" >
</table>  
<table  width="1024" border="0"  align="center"  cellpadding="0"  cellspacing="0" height="30" 
          bordercolor="#FFFFFF" bordercolorright="#FFFFFF"  bordercolordark="#819BBC" 
         background="/newProject/systemImages/fg_top03.jpg" > 
	  
	 <tr align="center" height="30">
		<td width="100"
				onMouseOver="this.style.backgroundImage='url(<%=request.getContextPath()%>/newProject/systemImages/topMenu.jpg)'"
				onMouseOut="this.style.backgroundImage=''"><a
				href="<%=request.getContextPath()%>/pages/product/main.jsp">首页</a></td>
			<td width="100"
				onMouseOver="this.style.backgroundImage='url(<%=request.getContextPath()%>/newProject/systemImages/topMenu.jpg)'"
				onMouseOut="this.style.backgroundImage=''"><a
				href="<%=request.getContextPath()%>/pages/product/showProductOriginal.jsp"
				class="a4">商城新品</a></td>
			<td width="100"
				onMouseOver="this.style.backgroundImage='url(<%=request.getContextPath()%>/newProject/systemImages/topMenu.jpg)'"
				onMouseOut="this.style.backgroundImage=''"><a
				href="<%=request.getContextPath()%>/pages/product/showProductDiscount.jsp"
				class="a4">特价商品</a></td> 
				<td width="100"
				onMouseOver="this.style.backgroundImage='url(<%=request.getContextPath()%>/newProject/systemImages/topMenu.jpg)'"
				onMouseOut="this.style.backgroundImage=''"><a
				href="<%=shoppinglink%>" class="a4">购物车</a></td>
				<td width="100"
				onMouseOver="this.style.backgroundImage='url(<%=request.getContextPath()%>/newProject/systemImages/topMenu.jpg)'"
				onMouseOut="this.style.backgroundImage=''"><a
				href="<%=orderlink%>" class="a4">订单查看</a></td>
	 </tr> 
</table>  	
</body>
</html> 