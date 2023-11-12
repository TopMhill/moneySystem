<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,person.person,Time.getTime,java.time.LocalDateTime,java.time.format.DateTimeFormatter,java.io.FileWriter,
java.io.FileReader" %>

<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>
<%@ page import="java.sql.*,person.person,Time.DateInfo,java.util.*,java.io.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工时卡创建</title>
</head>
<body>

	<script type="text/javascript">
		
	</script>
	<jsp:include page="getuser.jsp"/>
	<div class="login_box">
	<!-- <h1 class="title">创建工时卡</h1>
	-->
	<%
		//用系统时间创建一个工时卡
		//读取系统时间
		int time_long = 0;
		int id=0;
		String sqll="select max(id)as mid from worktimecard";
		ResultSet rs=workm.executeQuery(sqll);
		rs.next();
		id=rs.getInt("mid");
		workm.close();
		id=id+1;

		person aperson=(person)session.getAttribute("user");
		int employee_id = aperson.getId();
		//int employee_id = Integer.parseInt(request.getParameter("employee_id"));
		//int project_id = Integer.parseInt(request.getParameter("project_id"));
		//String number_of_day = request.getParameter("number_of_day");
		//time_long = Integer.parseInt(request.getParameter("time_long"));
		LocalDateTime initialTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
		String cur_time = initialTime.format(formatter);
		String cdate=getTime.nowtime();
		System.out.println(cdate);
		sqll="select * from worktimecard where submit_time>='"+new DateInfo(cdate).getlikeaday()+"' and employee_id ='"+aperson.getId()+"'";
		System.out.println(sqll);
		rs=workm.executeQuery(sqll);
		if(rs.next())
		{
			session.setAttribute("error_message","你当前已经提交公示表，请明天再管理！");
			//response.sendRedirect("errorpage.jsp");
			%>
			<div align="center">
	<h1 class="title">当日的工时卡已经提交，请次日再管理</h1>
	<table>
		<!-- <input type="text" style="text-align:center" disabled="disabled" value=id:<%=id%>>
		-->
	</table>
			<%
			
		}
		else 
		{
		cur_time=cdate;
		//ResultSet rs;
		//DateInfo noaday=new DateInfo(cur_time);
		//cur_time=noaday.getlikeday();
		String sql = "insert into worktimecard values('"+id+"','"+employee_id+"','" + cur_time + "',null,0)";
		workm.executeUpdate(sql);
		//String sql1 = "insert into workcard_days values('"+id+"','"+number_of_day+"','"+time_long+"')";
		//workm.executeUpdate(sql1);
		
		//int employee_id=Integer.parseInt(request.getParameter("employee_id"));
		//ResultSet rs;
		//sql="select * from worktimecard where employee_id='"+employee_id+"' and state=0";
		//rs = workm.executeQuery(sql);
		//int id=0;
		//int employee_id=0;
		//int project_id=0;
		String create_time=getTime.nowtime();
		String submit_time=null;
		//int state=0;
		//if(rs.next())
		//{
		//	id = rs.getInt("id");
		//	employee_id = rs.getInt("employee_id");
		//	project_id = rs.getInt("project_id");
		//	create_time = rs.getString("create_time");
		//	submit_time = rs.getString("submit_time");
		//	state = rs.getInt("state");
		//}
	%>
	
	<div align="center">
	<h1 class="title">工时卡创建完成，请核对</h1>
	<table>
		<input type="text" style="text-align:center" disabled="disabled" value=id:<%=id%>>
	</table>

	<table>
		<input type="text" style="text-align:center" disabled="disabled" value=employee_id:<%=employee_id%>>
	</table>
	<!-- 
	<table>
		<input type="text" style="text-align:center" disabled="disabled" value=project_id:<%//=project_id%>>
	</table>
	-->
	
	<table>
		<input type="text" style="text-align:center" disabled="disabled" value=create_time:<%=create_time%>>
	</table>
	
	<table>
		<input type="text" style="text-align:center" disabled="disabled" value=submit_time:<%=submit_time%>>
	</table>
	
	<table>
		<input type="text" style="text-align:center" disabled="disabled" value=state:0>
	</table>
	
	<table>
		<input type="text" style="text-align:center" disabled="disabled" value=time_long:<%=time_long%>>
	</table>
	<%} %>
	</div>
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
		input[type="text"]{
		width:400px;
		height:35px;
		background-color: #FFFFF0;
		margin: 2px;
		}
	</style>
</body>
</html>