<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>

<%@ page import="java.sql.*,person.person,Time.DateInfo"%>

<%@ page import="java.util.*,javax.mail.*"%>

<%@ page import="javax.mail.internet.*,javax.activation.*"%>

<%@ page import="java.text.DecimalFormat" %>

<%//使用opendb Bean%>

<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="getuser.jsp"/>

<div class="login_box">
	<table align='center' width ='100%'>
	<tr><th>起始日期</th><th>截至日期</th><th>金额</th><th>查看</th></tr>
<%
	person u=(person)session.getAttribute("user");
	if(u!=null)
	{
	String sql="select * from payroll where employee_id='"+u.getId()+"' and state = 1";
	ResultSet rs=workm.executeQuery(sql);
	while(rs.next())
	{
		
	
%>
		<tr>
		<%
		String startdate=rs.getString("start_date");
		String enddate=rs.getString("end_date");
		DateInfo start=new DateInfo(startdate);
		DateInfo end=new DateInfo(enddate);
        DecimalFormat decimalFormat = new DecimalFormat("0.00");
		Double value =rs.getDouble("salary");
        // 使用 DecimalFormat 格式化 double 值为字符串
        String fixvalue = decimalFormat.format(value);

			out.print("<td align='center'>"+start.getformatstr()+"</td>");
			out.print("<td align='center'>"+end.getformatstr()+"</td>");
			out.print("<td align='center'>"+fixvalue+"</td>");
		%>
		<td align='center'>
		<form action="getPDF" method="post">
                <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                <input type="hidden" name="name" value="<%=u.getname() %>">
                <input type="submit" value="打印">
            </form>
		</td></tr>
<% }}%>
	</table>
	</div>
</body>
</html>