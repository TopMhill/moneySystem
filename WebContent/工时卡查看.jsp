<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,person.person,java.time.LocalDateTime,java.time.format.DateTimeFormatter,java.io.FileWriter,
java.io.FileReader,java.net.URLEncoder,Time.DateInfo" %>

<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工时卡查看</title>
</head>
<body>
	<jsp:include page="getuser.jsp"/>

	<script type="text/javascript">
	
	</script>



	<!--<form method="post" id="mkforid"  action="" onsubmit="return login_chkinput();">
		  <table>
		<tr>
			<td>
			<input class="input_box" type="text" id="emp_id" name="emp_id" onblur="emp_id_check()" placeholder="账号">
			</td>
		</tr>
		<tr> 
			<td>
				<p id="sername"align="center" name="Username" >输入账号</p>
			</td>
		</tr>
		
		 <tr>
		 	<td>
  			<input class="button_box" type="submit" value="查询">
			</td>
  		</tr>
  		
		</table>
	</form>-->
		
	<div class="login_box">
	
	
	<%
		
		//int employee_id=Integer.parseInt(request.getParameter("employee_id"));
		person aperson = (person) session.getAttribute("user");
		int number=0;
		int employee_id = aperson.getId();
		ResultSet rs;
		String sql="select * from worktimecard where employee_id='"+employee_id+"' and state = 0";
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
			create_time = new DateInfo(rs.getString("create_time")).getformatstr();
			submit_time = new DateInfo(rs.getString("submit_time")).getformatstr();
			state = rs.getInt("state");
		

	%>
	<div align="center">
	<h1 class="title">查看工时卡</h1>
	  
	<table>
		<input type="text" class="input_box" style="text-align:center" disabled="disabled" value=id:<%=id%>>
	</table>

	<table>
		<input type="text" class="input_box" style="text-align:center" disabled="disabled" value=employee_id:<%=employee_id%>>
	</table>
	<!-- 
		<table>
		<input type="text" class="input_box" style="text-align:center" disabled="disabled" value=project_id:<%=project_id%>>
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
	
	<%
		
	String sql1 = "select * from workcard_days where worktimecard_id='"+id+"'";
	rs = workm.executeQuery(sql1);
	int time_long = 0;
	String number_of_day = null;
	//int number=0;
	while(rs.next())
	{
		out.println("<center><h1>_________________</h1></center>");
		number_of_day =new DateInfo(rs.getString("number_of_day")).getformatstr();
		time_long = rs.getInt("time_long");
		number = number + 1;
	%>
	<table>
		<input type="text" style="text-align:center" disabled="disabled" value=number_of_day:<%=number_of_day%>>
	</table>
	
	<table>
		<input type="text" style="text-align:center" disabled="disabled" value=time_long:<%=time_long%>>
	</table>
	<%}}
		else response.sendRedirect(URLEncoder.encode("工时卡创建信息输入.jsp","UTF-8"));
	%>
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
			background:url("back1.jpg") no-repeat;
            background-size: 100% 100%;
            background-position: center center;
            overflow: auto;
			height: 900px;
       }
     .input_box {
		width: 300px;
		height: 30px;
		padding-left: 10px;
		margin-top: 20px;
		margin-left: 50px;
	}
     .login_box {
		width: 450px;
		height: <%=550+number*95%>px;
		background-color: #FFFFF0;
		margin: auto;
		margin-top: 50px;
		border-radius: 5px;
		overflow: hidden;
		}
	.button_box {
		width: 400px;
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