<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*,java.time.LocalDateTime,java.time.format.DateTimeFormatter,java.io.FileWriter,
java.io.FileReader,java.io.BufferedReader,java.io.IOException,java.util.*" %>
<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>输入个人信息</title>
</head>
<body>

	<jsp:include page="getuser.jsp"/>
	<div class="login_box">
	<h1 class="title">工时卡信息</h1>
	
	<%
	ResultSet rs = null;
	List<String> projId = new ArrayList<>();
	
	String sql2 = "select distinct id from project";
	rs = workm.executeQuery(sql2);
	while(rs.next())
	{
		String projof = rs.getString("id");
		//System.out.println(projof);
		projId.add(projof);
	}
	%>
	
	<%
	ResultSet rs1 = null;
	List<Integer> Id = new ArrayList<>();
	
	String sql3 = "select distinct id from worktimecard order by id";
	rs1 = workm.executeQuery(sql3);
	while(rs1.next())
	{
		int of = rs1.getInt("id");
		//System.out.println(projof);
		Id.add(of);
	}
	%>
	
	<form method="post" action="工时卡创建.jsp">
		<table>
		<!-- <input class="button_box" type="text" placeholder="id:请不要和右边的编号相同！" name="id">
		<select type="text">
			<% for (Integer of : Id) { %>
	      		<option value="<%= of %>"><%= of %></option>
	    	<% } %>
		</select>
		-->
		<select id ="pid" class="input_box" type="text" placeholder="project_id" name="project_id">
			<% for (String prof : projId) { %>
	      		<option value="<%= prof %>"><%= prof %></option>
	    	<% } %>
		</select>
		<center>
		<label for="pid">请选择项目号</label>
		</center>
		<!--<input class="input_box" type="date" placeholder="number_of_day" name="number_of_day">
		<input class="input_box" type="text" placeholder="time_long" name="time_long">
		-->
		<input class="button_box" type="submit" value="创建">
		</table>
	</form>
	
	
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
		height: 300px;
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
	
	<style type="text/css">
	no_line {text-decoration: none;}
	a{text-decoration: none;}
	*{
		font-family:"楷体";
		
	}
	a.login_out
	{
		color: red;
	}
a:link {
  color: black;
}

a:visited {
  color: black;
}

a:hover {
  color: blue;
}

a:active {
  color: yellow;
}
		body{
			background:url("back.jpg") no-repeat;
            background-size: 100% 100%;
            background-position: center center;
            overflow: auto;
		height: 900px;
       }
	.mytest
	{
		align:left;
	}
	.mytest .left
	{
		list-style:none;
		align:left;
		
	}
	.mytest .right
	{
		list-style:none;
		width :50px;
		float:right;
	}
	.input_box {
		width: 300px;
		height: 30px;
		padding-left: 10px;
		margin-top: 20px;
		margin-left: 50px;
	}
	.title {
		text-align: center;
		font-size: 28px;
		color: #000;
		margin-top: 80px;
		margin-bottom: 10px;
		letter-spacing: 3px;
		font-family: sans-serif;
	}
	.login_box {
		width: 450px;
		height: 300px;
		background-color: #FFFFF0;
		margin: auto;
		margin-top: 50px;
		border-radius: 5px;
		overflow: hidden;
	}
	.success
	{
		color:green;
	}
	.failure
	{
		color:red;
	}
	.button_box {
		width: 300px;
		height: 35px;
		margin-top: 20px;
		margin-left: 50px;
		border-radius: 5px;
		background-color: #12564a;
		cursor: pointer;
		color: #fff;
	.login_box {
		width: 400px;
		height: 400px;
		background-color: #fff;
		margin: auto;
		margin-top: 150px;
		border-radius: 5px;
		overflow: hidden;
	}
	.success
	{
		background:#f5f5f5;
		font-weight:bold;
		color:#000000;
		border:1px #009900 solid;
	}
	.failure
	{
		background:#f5f5f5;
		font-weight:bold;
		color:#000000;
		border:1px #990000 solid;
	}
	</style>
</body>
</html>