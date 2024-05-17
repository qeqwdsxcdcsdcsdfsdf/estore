<%@ page language="java" import="java.util.*"   pageEncoding="utf-8"%>
    <%@page  import="java.sql.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="cn.estore.dao.ProductDao"%>
<%@page import="cn.estore.entity.ProductEntity"%>
         <%
         ProductEntity e=new ProductEntity();	
     	// 商品展示通用模块
     	ProductDao dao = new ProductDao();
     	List list = null;
     	list=(List)session.getAttribute("list");
	  	if(list==null)
	  	{
	  	  	ProductDao dao1=new ProductDao();
	  		List allGoodslist=new ArrayList();
	  		allGoodslist=dao1.selectAllProducts();
	  	    session.setAttribute("list",allGoodslist);
	  		list=dao.selectAllProducts();
	  		session.setAttribute("list",null);
	  	}
	  	int pageNumber = list.size(); 	// 计算出记录总数
	  	int maxPage = pageNumber; 				// 计算有多少页数
	  	String strNumber = request.getParameter("pageNum");
	  	int number = 0;
	  	if (maxPage % 4 == 0) {
	  		maxPage = maxPage / 4;
	  	} else {
	  		maxPage = maxPage / 4 + 1;
	  	}
	  	if (strNumber == null) {
	  		number = 0;
	  	} else {
	  		number = Integer.parseInt(strNumber);
	  	}
	  	int start = number * 4;//开始条数
	  	int over = (number + 1) * 4;//结束条数
	  	int count = pageNumber - over;//还剩多少条记录
	  	if (count <= 0) {
	  		over = pageNumber;
	  	}   
          %>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>estore</title>
</head>
<body>
<table border="0" width="1024"  align="center" >
   <tr>
   <!--顶部-->
      <td colspan="2">
      <jsp:include page="/pages/common/head.jsp" flush="true"/>
    
	  </td>
  </tr>
  <tr>
	   <td width="300" bgcolor="#F5F5F5" valign="top"  >
        <!--左侧-->
        <jsp:include page="/pages/common/left.jsp" flush="true"/>
  
        </td>
       <td width="724" align="center" valign="top"  bgcolor="#FFFFFF" >
          <!--右侧-->
        <div align="left">
        <img src="/newProject/systemImages/fg_right03.jpg">
        
        </div>      
    			<%
						for (int i = start; i < over; i++) {
							ProductEntity goods = (ProductEntity)list.get(i);
						String curPath = request.getContextPath().trim()+"/productImages/";
					%>
					<table width="95%" height="136" border="1" align="center"
						cellpadding="1" cellspacing="1" bordercolor="#FFFFFF"
						bgcolor="#999999">
						<tr>
							<td width="40%" height="80" rowspan="5" bgcolor="#FFFFFF">
								<div align="center">
									<image src="<%=curPath+goods.getPicture().trim()%>" width="110"	height="100" />
								</div>
							</td>
							<td width="58%" bgcolor="#FFFFFF">
								<div align="left">品名:<%=goods.getName()%></div>
							 									
							<%if(goods.getDiscount()==1) { //若是非特价商品，不显示此项%>
								<div align="left"
									style="text-decoration: line-through; color: #FF0000">
								 	原价：<%=goods.getMarketPrice()%>元
								</div>
								<div align="left">
									现价：<%=goods.getSellPrice()%>元
								</div>
							<%} else
								
							{%>	
						
								<div align="left">
									现价：<%=goods.getMarketPrice()%>元
								</div>
							<%} %>
								<div align="left">简介:<%=goods.getDescription() %></div>
								<div align="left">
									<%
									if (session.getAttribute("user") != null|| session.getAttribute("id") != null) {
									%>
									<a href="#"
										onClick="window.open('showProductById.jsp?id=<%=goods.getId()%>','','width=500,height=200');">查看详细内容</a>
									<%} else {
									%>
									登录后才能购买
									<%
										}
									%>
								</div>
				       </td>
				</tr>
						<%
							}
						%>
					</table>
					<br>
        <div align="center">
						<table width="90%" border="0" align="center" cellpadding="0"
							cellspacing="0">
  
							<tr align="center">
							<td width="13%"> 共为<%=maxPage%>页  </td>
							<td width="18%"> 共有<%=pageNumber%>条记录  </td>
							<td width="26%">  当前为第<%=number + 1%>页  </td>
						    <td width="15%">
							<%
							if ((number + 1) == 1) {
							%>
									上一页
							<%  } else {
							%>
							<a href="<%=request.getContextPath() %>/pages/product/main.jsp?pageNum=<%=number - 1%>">上一页</a>
							</td>
							<% } %>
							<td width="14%">
									<%
										if (maxPage <= (number + 1)) {
									%>
									下一页
									<%
										} else {
									%>
									<a href="<%=request.getContextPath() %>/pages/product/main.jsp?pageNum=<%=number + 1%>">下一页</a>
								</td>
								<%
									}
								%>
			</tr>
		</table>
</div>
			
     <tr>
       <!--底部-->
      <td colspan="2">
     <jsp:include page="/pages/common/statusBarNavigation.jsp" flush="true"/>
      </td>
    </tr>
</table>  

</body>
</html> 