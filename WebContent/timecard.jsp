<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.time.LocalDateTime,java.time.format.DateTimeFormatter,java.io.FileWriter,
java.io.FileReader" %>

<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考勤卡</title>
</head>
<body>
	<%
		//用系统时间创建一个工时卡
		//读取系统时间
		LocalDateTime initialTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
		String outstr = initialTime.format(formatter);
	%>
	当前时间:<%=outstr %>
<% 
	ResultSet rs;
	String sql = "select * from worktimecard where id = 1";
	rs = workm.executeQuery(sql);
	
	int id = 0;
	int employee_id = 0;
	int state = 0;
	if(rs.next())
	{
		id = rs.getInt("id");
		employee_id = rs.getInt("employee_id");
		state = rs.getInt("state");
	}
	sql = "update worktimecard set state=0 where id = 1";
	workm.executeUpdate(sql);
	sql = "select * from worktimecard where id = 1";
	rs = workm.executeQuery(sql);
	if(rs.next())
	{
		state = rs.getInt("state");
	}
	System.out.println(state);

%>
	<br>
	<%=id%>
	<br>
	<%=employee_id%>
</body>
</html>