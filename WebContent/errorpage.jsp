
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Failed</title>
</head>
<body>

<jsp:include page="getuser.jsp"/>
<br/>

<h1 align="center">操作失败
<%
String mes=(String)session.getAttribute("error_message");
if(mes!=null)
{
out.print(mes);
%>

<% 
}
%>
<b/></h1>
</body>
</html>