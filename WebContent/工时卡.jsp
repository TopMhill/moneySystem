<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*,person.person,java.time.LocalDateTime,java.time.format.DateTimeFormatter,java.io.FileWriter,
java.io.FileReader" %>

<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工时卡</title>
</head>
<body>
	<jsp:include page="getuser.jsp"/>
	<% 
	
		person aperson=(person)session.getAttribute("user");
		int uid = aperson.getId();
		//System.out.println(id);
		String sql="select * from worktimecard where employee_id='"+uid+"'"+" and state=0";
		ResultSet rs=workm.executeQuery(sql);
		
	%>

	
	<script type="text/javascript">
		
	</script>
	
	<div class="login_box">
	<h1 class="title">工时卡</h1>
	<%if(!rs.next()){ %>
	<!-- 
	<form method="post" action="工时卡创建信息输入.jsp">
		<table>
		<input class="button_box" type="submit" value="创建">
		</table>
	</form>
	-->
	<jsp:forward page="工时卡创建.jsp"/>
	<%} else {%>
	<form method="post" action="工时卡查看.jsp">
		<table>
		<input class="button_box" type="submit" value="查看">
		</table>
	</form>
	
	<form method="post" action="工时卡提交.jsp">
		<table>
		<input class="button_box" type="submit" value="提交">
		</table>
	</form>
	
	<form method="post" action="输入工作信息.jsp">
		<table>
		<input class="button_box" type="submit" value="工作情况输入">
		</table>
	</form>
	
	<form method="post" action="工时卡编辑.jsp">
		<table>
		<input class="button_box" type="submit" value="工作情况修改">
		</table>
	</form>
	<!-- 
	<form method="post" action="工时卡修改.jsp">
		<table>
		<input class="button_box" type="submit" value="修改">
		</table>
		-->
	</form>
	<%} %>
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