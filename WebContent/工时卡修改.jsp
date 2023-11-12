<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*,person.person,java.time.LocalDateTime,java.time.format.DateTimeFormatter,java.io.FileWriter,
java.io.FileReader" %>


<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工时卡信息修改</title>
</head>
<body>
	<div class="login_box">
	<h1 class="title">修改信息</h1>
	
	
	<% 
	person aperson=(person)session.getAttribute("user");
	int emp_id=aperson.getId();
	ResultSet rs;
	String sql = "select * from worktimecard where employee_id = '"+emp_id+"' and state=0";//这个employee_id可以从当前登录的账号查询
	rs = workm.executeQuery(sql);
	if(!rs.next())
	{%>
		<h3 align='center'>您所有工时卡均已经提交，不允许再修改!</h3>
	<%}else{%>
		<jsp:forward page="工时卡修改信息更新.jsp"/>;
	<%}%>
	
	
		<!--  <form method="post" action="工时卡修改信息更新.jsp">
		<table>
		<input class="button_box" type="text" placeholder="employee_id" name="employee_id">
		<input class="button_box" type="text" placeholder="project_id" name="project_id">
		<input class="button_box" type="submit" value="确定修改">
		</table>
		</form>-->
	
	
	
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
			background:url("back1.jpg") no-repeat;
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