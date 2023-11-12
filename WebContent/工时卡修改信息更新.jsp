<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*,java.time.LocalDateTime,java.time.format.DateTimeFormatter,java.io.FileWriter,
java.io.FileReader" %>
<%@ page import="java.sql.*,person.person,Time.getTime,java.util.*,java.io.*,java.text.*"%>
<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改内容更新</title>
</head>
<body>
	<jsp:include page="getuser.jsp"/>
	<div class="login_box">
	<form method="get">
	<%
		if(request.getParameter("pid")!=null)
		{
			int id=Integer.parseInt(request.getParameter("id"));
			int pid=Integer.parseInt(request.getParameter("pid"));
			//int time_long = Integer.parseInt(request.getParameter("time_long"));
		 	//System.out.println(time_long);
		 	String sql2 = "update worktimecard set project_id = '"+pid+"' where id = '"+id+"'";
		 	if(workm.executeUpdate(sql2))
		 	{
		 		out.print("<center><h1 align='center'>修改完成！</h1></center>");
		 	}
		 	else 
		 	{
		 		out.println("<center><h1 align='center'>修改失败!</h1></center>");
		 	}
		 	
		}else 
		{
	%>
			<%
		person aperson = (person) session.getAttribute("user");
		int employee_id = aperson.getId();
		//ResultSet rs;
		//String 
		String sql="select * from worktimecard where employee_id='"+employee_id+"' and state = 0";
		ResultSet rs = workm.executeQuery(sql);
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
			project_id = rs.getInt("project_id");
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
	
	<table>
		<input type="text" class="input_box"style="text-align:center" disabled="disabled" value=project_id:<%=project_id%>>
	</table>
	
	<table>
		<input type="text" class="input_box" style="text-align:center" disabled="disabled" value=create_time:<%=create_time%>>
	</table>
	
	<table>
		<input type="text" class="input_box" style="text-align:center" disabled="disabled" value=submit_time:<%=submit_time%>>
	</table>
	
	<table>
		<input type="text" class="input_box" style="text-align:center" disabled="disabled" value=state:<%=state%>>
	</table>
	<%
	ResultSet rss = null;
	List<String> projId = new ArrayList<>();
	
	String sql2 = "select distinct id from project";
	rss = workm.executeQuery(sql2);
	while(rss.next())
	{
		String projof = rss.getString("id");
		//System.out.println(projof);
		projId.add(projof);
	}
	%>
		<select id ="pid" class="input_box" type="text" placeholder="project_id" name="pid">
			<% for (String prof : projId) { %>
	      		<option value="<%= prof %>"><%= prof %></option>
	    	<% } %>
		</select>
		<br/>
		<label for="pid" align='center'>修改后的项目编号</label>
		<input type='hidden' name='id' value=<%=id %>>
		<input class="button_box" type="submit" value="提交">
	</form>
	<%}}%>
	<!--  
	<h1 class="title">信息修改</h1>
	<%
		//int employee_id=Integer.parseInt(request.getParameter("employee_id"));
		//aperson=(person)session.getAttribute("user");
		//int employee_id = aperson.getId();
		//ResultSet rs;
		/*sql="select * from worktimecard where employee_id='"+employee_id+"'";
		rs = workm.executeQuery(sql);
		int id=0;
		//int employee_id=0;
		int project_id=0;
		Calendar calendar = Calendar.getInstance(); // get current instance of the calendar
	    SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	    String cdate = formatter.format(calendar.getTime());

		String create_time=getTime.nowtime();
		String submit_time=null;
		int state=0;
		if(rs.next())
		{
			id = rs.getInt("id");
			employee_id = rs.getInt("employee_id");
			project_id = rs.getInt("project_id");
			create_time = rs.getString("create_time");
			submit_time = rs.getString("submit_time");
			state = rs.getInt("state");
		}
		String sql1 = "select * from workcard_days where worktimecard_id='"+id+"'";
		rs = workm.executeQuery(sql1);
		int time_long = 0;
		String number_of_day = null;
		if(rs.next())
		{
			number_of_day = rs.getString("number_of_day");
			time_long = rs.getInt("time_long");
		}
		*/
	%>
	
	<form method="get">
		<table>
			<input class="button_box" type="text" placeholder="<%//=time_long %>" name="time_long">
			<input class="button_box" type="submit" value="提交">
		</table>
	</form>
	-->
	
	
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
		height: 600px;
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