<%@ page contentType="text/html; charset=utf-8" %> <%--这里的utf-8是指服务器发送给客服端时的内容编码 --%>

<%@ page pageEncoding="utf-8"%> <%--这里的utf-8是指 .jsp文件本身的内容编码 --%>


<%@ page language="java" import="java.sql.*"%>

<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="login_box">
		<h1 class="title"align="center">欢迎增加类别</h1>
			<form method="post" action="add1">
							<tr>
								<br>
								<td width="100%" valign="middle" align="left" height="19">
								<div align="center">
		     					<p>类别
								<input type="text" name="leibie" size="12">
								<input type="submit" name="submit" value="增加">
								
							</form>
		</div>
	
</body>
</html>