
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page session="true" import="java.util.*,java.sql.*,online_bookshop.Book"%>

<%
	Vector<Book> buylist=(Vector<Book>) session.getAttribute("shoppingcart");//使用向量类作为购物车的变量类型
	if (buylist!=null && (buylist.size()<1))
	{
%>
	<jsp:forward page="index.jsp"/>
<%
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
<title> 网上书店 </title>
</head>
<body>

		<jsp:include page="getuser.jsp"/><br/>
<div align="center">
	<center>
<table border="0" cellpadding="0" cellspacing="0" width="760" align="center">
<tr>
	<td width="100">
	<div align="center">
	<h3>请填写您的详细信息</h3>
	<form name=you action="checkout1.jsp" method="post">
	<table width="75%" border="1">
		<tr>
			<td width="38%">
			<div align="right">收货名:<div>
			</td>

			<td width="62%">
			<input type="text" name="getname">
			</td>
		</tr>

		<tr>
			<td width="38%">
			<div align="right">送货地址:<div>
			</td>

			<td width="62%">
			<input type="text" name="address" size="40">
			</td>
		</tr>

		<tr>
			<td width="38%">
			<div align="right">
			<input type="submit" name="submit2" value="提交">
			<div>
			</td>

			<td width="62%">
			<input type="reset" name="reset" value="清除">
			</td>
		</tr>
	</table>
	</center>
	</div>
	</td>
	</tr>
</table>
</body>
