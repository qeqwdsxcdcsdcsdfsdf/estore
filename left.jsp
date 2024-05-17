<%@ page  contentType="text/html;charset=utf-8" %>
<html>
<script language="javascript">
	 function checkEmpty(form) {
	   for (i = 0; i < form.length; i++) {
		 if (form.elements[i].value == "") {
		    alert("表单信息不能为空");
		    return false;
		 }
	   }
	 }	  	
</script>
<body>
<table width="100%"  border="2" align="center"  
cell padding="0" cellspacing="0">
<tr>
<td width="30%" valign="top">
<tr >
<td>
				<%@ include file="leftParts/findProductsByName.jsp" %>
				
				<%@ include file="leftParts/login.jsp" %>
		</td>
		
		</tr>
</tr>
</table>
</body>
</html>