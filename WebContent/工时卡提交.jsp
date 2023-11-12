<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*,person.person,Time.getTime,java.time.LocalDateTime,java.time.format.DateTimeFormatter,java.io.FileWriter,
java.io.FileReader,java.io.BufferedReader,java.io.IOException,java.util.*" %>
<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>提交工时卡</title>
</head>
<body>

	<jsp:include page="getuser.jsp"/>
	<div class="login_box">
	
	<%
		person aperson=(person)session.getAttribute("user");
		//用系统时间创建一个工时卡
		//读取系统时间
		LocalDateTime initialTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
		String outstr = initialTime.format(formatter);
		outstr=getTime.nowtime();
		if(request.getParameter("to_delete")!=null)
		{
			System.out.println("?");
			//project_id = Integer.parseInt(request.getParameter("project_id"));
			//sql
			String sql = "update worktimecard set submit_time='"+outstr+"', state=1 where (id = '"+request.getParameter("to_delete")+"')";
			if(workm.executeUpdate(sql))
				out.println("<center><h>提交成功</h></center>");
			else 
				out.println("<center><h>提交失败</h></center>");
		}
		else 
		{
	%>
	<%
	ResultSet rs = null;
	List<String> projId = new ArrayList<>();
	
	//String sql2 = "select distinct id from project ";
	//rs = workm.executeQuery(sql2);
	//while(rs.next())
	//{
	//	String projof = rs.getString("id");
		//System.out.println(projof);
	//	projId.add(projof);
	//}
	%>
	<% 
		//String 
		String sql="select * from worktimecard where employee_id='"+aperson.getId()+"' and state=0";
		ResultSet frs1=workm.executeQuery(sql);
		if(!frs1.next())
		{
			System.out.println("hello");
	%>
	<h1 class="title">您当前所有工时卡信息已提交，请前往创建新的工时卡</h1>
	<!--  <h2 class="title">不能再次修改信息</h2>-->
	<%  } else 
		{
		System.out.println("hi");%>
		<form method="get">
		<!--  <select class="button_box" type="text" placeholder="project_id" name="project_id">
			<% for (String prof : projId) { %>
	      		<option value="<%= prof %>"><%= prof %></option>
	    	<% } %>
	    	
		</select>
		-->
		<input type="hidden" value="<%= frs1.getInt("id")%>" name="to_delete"></input> 
			<%
		//int employee_id=Integer.parseInt(request.getParameter("employee_id"));
		// person aperson = (person) session.getAttribute("user");
		int employee_id = aperson.getId();
		//ResultSet rs;
		//String 
		sql="select * from worktimecard where employee_id='"+employee_id+"' and state = 0";
		rs = workm.executeQuery(sql);
		int id=0;
		//int employee_id=0;
		int project_id=0;
		String create_time=null;
		String submit_time=null;
		int state=0;
		if(rs.next())
		{
			id = rs.getInt("id");
			employee_id = rs.getInt("employee_id");
			//project_id = rs.getInt("project_id");
			create_time = rs.getString("create_time");
			submit_time = rs.getString("submit_time");
			state = rs.getInt("state");
		

	%>
	<div align="center">
	<h1 class="title">查看工时卡</h1>
	  
	<table>
		<input type="text" class="input_box"style="text-align:center" disabled="disabled" value=id:<%=id%>>
	</table>

	<table>
		<input type="text" class="input_box" style="text-align:center" disabled="disabled" value=employee_id:<%=employee_id%>>
	</table>
	<!-- 
	<table>
	</table>
	-->
	<table>
		<input type="text" class="input_box" style="text-align:center" disabled="disabled" value=create_time:<%=create_time%>>
	</table>
	
	<table>
		<input type="text" class="input_box" style="text-align:center" disabled="disabled" value=submit_time:<%=submit_time%>>
	</table>
	
	<table>
		<input type="text" class="input_box" style="text-align:center" disabled="disabled" value=state:<%=state%>>
	</table>
		<input class="button_box" type="submit" value="提交">
	</form>
	
	<%
		}
		}
		//int employee_id=aperson.getId();//employee_id应该能从当前登录信息中获取
		//int project_id=0;//project_id也应该是输入or当前登录信息中获取？
		//String stri = request.getParameter("project_id");
		}
	%>
	
	<style type="text/css">
	.title {
		text-align: center;
		font-size: 28px;
		color: #000;
		margin-top: 50px;
		margin-bottom: 10px;
		letter-spacing: 3px;
		font-family: sans-serif;
	}
	body{
			background:url("back.jpg") no-repeat;
            background-size: 100% 100%;
            background-position: center center;
            overflow: auto;
			height: 900px;
       }
      .login_box {
		width: 450px;
		height: 550px;
		background-color: #FFFFF0;
		margin: auto;
		margin-top: 50px;
		border-radius: 5px;
		overflow: hidden;
		}
		.button_box {
		width: 300px;
		height: 35px;
		margin-top: 20px;
		margin-left: 70px;
		border-radius: 5px;
		background-color: #12564a;
		cursor: pointer;
		color: #fff;
		}
	</style>
</body>
</html>