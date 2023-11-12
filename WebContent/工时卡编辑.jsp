<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*,java.time.LocalDateTime,java.time.format.DateTimeFormatter,java.io.FileWriter,
java.io.FileReader,java.io.BufferedReader,java.io.IOException,java.util.*,person.person,Time.DateInfo" %>
<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工时卡编辑</title>
</head>
<body>
	<jsp:include page="getuser.jsp"/>
	<%
	person aperson=(person)session.getAttribute("user");
	int emp_id=aperson.getId(); 
	int card_id=0;
	String sql = "select id from worktimecard where state=0 and employee_id = '"+emp_id+"'";
	ResultSet rs;
	rs = workm.executeQuery(sql);
	if(rs.next())
	{
		card_id = rs.getInt("id");
	}
		int time_long = 0 ;
		String number_of_day = request.getParameter("number_of_day");
		String str2 = request.getParameter("time_long");
		String pid=request.getParameter("pid");
		System.out.println("zaima");
		if(number_of_day!=null && str2!=null)
		{
			System.out.println("hi");	
			time_long = Integer.parseInt(str2);
			if(time_long>aperson.gettime_limit()||time_long>24||time_long<=0)
			{
				out.println("<center><h1>工作时长输入过长或不合规，操作失败</h1></center>");
			}
			else
			{
				DateInfo nowdate=new DateInfo(number_of_day);
				sql="select * from workcard_days natural join worktimecard  where employee_id='"+aperson.getId()+"' and project_id='"+pid+"' and number_of_day like '"+nowdate.getlikeday()+"'";
				System.out.println(sql);
				ResultSet rss=workm.executeQuery(sql);
				if(!rss.next())
				{
					out.println("<center><h>未查询到当天为该项目的工作记录</h></center>");
				}
				else 
				{
				sql="select create_time from worktimecard where id='"+card_id+"'";
				System.out.println(sql);
				rss=workm.executeQuery(sql);
				rss.next();
				//int pid=rss.getInt("project_id");
				String starttime=rss.getString("create_time");
				DateInfo nowadate=new DateInfo(starttime);
				starttime=nowadate.getlikeaday();
				rss.close();
				sql="select start_date,end_date from project where id='"+pid+"'";
				rss=workm.executeQuery(sql);
				rss.next();
				String pstarttime=rss.getString("start_date");
				String pendtime=rss.getString("end_date");
				
				sql="select sum(time_long) alltime from workcard_days where worktimecard_id='"+card_id+"' and number_of_day like '"+nowdate.getlikeday()+"'";
				System.out.println(sql);
				rss=workm.executeQuery(sql);
				int reshour=0;
				if(rss.next())
				{
					reshour+=Double.parseDouble(rss.getString("alltime"));
				}
				sql="select time_long from workcard_days where worktimecard_id='"+card_id+"' and number_of_day='"+number_of_day+"'";
				rss=workm.executeQuery(sql);
				if(rss.next())
				{
					reshour-=Double.parseDouble(rss.getString("time_long"));
				}
				//double res
				workm.close();
				if(reshour+time_long>aperson.gettime_limit())
				{
					out.println("<center><h1>超出工作时间限制，您当天已经工作"+reshour+"小时"+"</h1></center>");
				}
				else if(number_of_day.compareTo(starttime)<0)
				{
					out.println("<center><h3>工作时间不得早于工时卡创建时间，操作失败</h3></center>");
				}
				else if(number_of_day.compareTo(pstarttime)<0||number_of_day.compareTo(pendtime)>0)
				{
					out.println("<center><h3>工作时间须在项目的时间范围内，操作失败</h3></center>");
				}
				else 
				{
			String sql1 = "update workcard_days set time_long = '"+time_long+"'"+" where worktimecard_id='"+card_id+"' and number_of_day='"+number_of_day+"' and project_id='"+pid+"'";
			System.out.println(sql1);
			if(workm.executeUpdate(sql1))
				out.println("<h1 align='center'>修改完成</h1>");
			else 
				out.println("<h1 align='center'>修改失败</h1>");
				}}}
		}
		else {
		
		//System.out.println(number_of_day);
		//System.out.println(str2);
	%>
	
	<%
		//已经存在工时卡的时候，则直接进行工时卡内容的编辑
		
		//int emp_id = (Integer)session.getAttribute("id");
		
		//System.out.println(card_id);
		
	%>
	
	<%
		ResultSet rs1 = null;
		List<String> numofday = new ArrayList<>();
		
		String sql2 = "select distinct number_of_day from workcard_days where worktimecard_id='"+card_id+"'";
		rs1 = workm.executeQuery(sql2);
		while(rs1.next())
		{
			String numof = rs1.getString("number_of_day");
			System.out.println(numof);
			DateInfo nowdate=new DateInfo(numof);
			String datestr=nowdate.getformatstr();
			//System.out.println(numof);
			numofday.add(numof);
		}
	%>
	
	<%
	ResultSet rs2 = null;
	List<String> pids = new ArrayList<>();
	
	String sql3 = "select distinct number_of_day from workcard_days where worktimecard_id='"+card_id+"'";
	sql3="select id from project ";
	rs2 = workm.executeQuery(sql3);
	while(rs2.next())
	{
		String numof = rs2.getString("id");
		System.out.println(numof);
		//DateInfo nowdate=new DateInfo(numof);
		//String datestr=nowdate.getformatstr();
		//System.out.println(numof);
		pids.add(numof);
	}
	%>
	<script type="text/javascript">
		
	</script>
	
	<div class="login_box">
	<h1 class="title">修改工作信息</h1>
	
	
	
	<form method="get">
		<table>
		<select id="numid" class="input_box" type="text" placeholder="number_of_day" name="number_of_day">
			<% for (String numof : numofday) { %>
	      		<option value="<%= numof %>"><%= new DateInfo(numof).getformatstr() %></option>
	    	<% } %>
		</select>
		<br/><center><lable for="numid">日期</lable></center>
		<select id="proid" class="input_box" type="text" placeholder="number_of_day" name="pid">
			<% for (String apid : pids) { %>
	      		<option value="<%= apid %>"><%= apid %></option>
	    	<% } %>
		</select>
		<br/><center><label for="proid">项目编号</label></center>
		<input class="input_box" type="text" placeholder="time_long" name="time_long">
		<input class="button_box" type="submit" value="提交">
		</table>
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