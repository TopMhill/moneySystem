<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ page import="java.sql.*,java.time.LocalDateTime,java.time.format.DateTimeFormatter,java.io.FileWriter,
java.io.FileReader,java.io.BufferedReader,java.io.IOException,java.util.*,java.text.*,person.person,Time.DateInfo" %>
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
		//int time_long = 0 ;
		//String number_of_day = request.getParameter("number_of_day");
		double time_long=-1;
		if(request.getParameter("time_long")!=null&& !request.getParameter("date").equals(""))
		{
			time_long = Double.parseDouble(request.getParameter("time_long"));
		String date=request.getParameter("date");
		String ppid=request.getParameter("projectid");
        //SimpleDateFormat longFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        SimpleDateFormat shortFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date dateinput = shortFormat.parse(date);
        //String date01=longFormat.format(date);
        DateInfo anowdate=new DateInfo(dateinput);
		if(date!=null)
		{
			if(time_long>aperson.gettime_limit()||time_long>24||time_long<=0)
			{
				out.println("<center><h1>工作时长输入过长或不合规，操作失败</h1></center>");
			}
			else
			{
				sql="select create_time from worktimecard where id='"+card_id+"'";
				System.out.println(sql);
				ResultSet rss=workm.executeQuery(sql);
				rss.next();
				//int pid=rss.getInt("project_id");
				String starttime=rss.getString("create_time");
				rss.close();
				sql="select start_date,end_date from project where id='"+ppid+"'";
				rss=workm.executeQuery(sql);
				rss.next();
				String pstarttime=rss.getString("start_date");
				String pendtime=rss.getString("end_date");
				rss.close();
				workm.close();
				sql="select sum(time_long) alltime from workcard_days where worktimecard_id='"+card_id+"' and number_of_day like '"+anowdate.getlikeday()+"'";
				System.out.println(sql);
				rss=workm.executeQuery(sql);
				starttime=new DateInfo(starttime).getlikeaday();
				double reshour=0;
				if(rss.next())
				{
					System.out.println("hello");
					String doublestr=rss.getString("alltime");
					if(doublestr!=null)
					reshour+=Double.parseDouble(doublestr);//Double.parseDouble(rss.getString("alltime"));
				}
				workm.close();
				if(reshour+time_long>aperson.gettime_limit())
				{
					out.println("<center><h1>超出工作时间限制，您当天已经工作"+reshour+"小时"+"</h1></center>");
				}
				else if(anowdate.getString().compareTo(starttime)<0)
				{
					//System.out.println(starttime+"%%%%%%% "+anowdate.getString());
				
					out.println("<center><h3>工作时间不得早于工时卡创建时间，操作失败</h3></center>");
				}
				else if(anowdate.getString().compareTo(pstarttime)<0||anowdate.getlikeaday().compareTo(pendtime)>0)
				{
					System.out.println(pendtime+":"+anowdate.getlikeaday());
					out.println("<center><h3>工作时间须在项目的时间范围内，操作失败</h3></center>");
				}
				else 
				{
					sql="insert into workcard_days values('"+card_id+"','"+anowdate.getString()+"','"+time_long+"','"+ppid+"')";
					if(workm.executeUpdate(sql))
					{
						out.println("<center><h1>插入成功</h1></center>");
					}
					else
					{
						out.println("<center><h1>插入失败</h1></center>");
					}
					
				}
			}
		}}
		else
		{
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
		List<String> pids = new ArrayList<>();
		
		String sql2 = "select distinct number_of_day from workcard_days where worktimecard_id='"+card_id+"'";
		sql2="select distinct id from project";
		rs1 = workm.executeQuery(sql2);
		while(rs1.next())
		{
			String numof = rs1.getString("id");
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
	<h1 class="title">编辑工作信息</h1>
	
	
	
	<form method="get">
		  
		<table>
		<select id="proid" class="input_box" type="text" placeholder="项目编号" name="projectid">
			<% for (String pid : pids) { %>
	      		<option value="<%= pid %>"><%= pid %></option>
	    	<% } %>
		</select>
		<br/>
		<center><label for="proid">项目编号</label></center>
		<input  id="dateof" class="input_box" type="date" placeholder="工作日期" name="date">
		<br/>
		<center><label for="dateof"  align='center'>请选择工作日期</label></center>
		<input class="input_box" type="text" placeholder="工作时长" name="time_long">
		<input class="button_box" type="submit" value="提交">
		</table>
	</form>
	<% } %>
	
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