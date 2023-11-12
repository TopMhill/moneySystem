
    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ page import="java.sql.*,java.time.LocalDateTime,java.time.format.DateTimeFormatter,java.io.FileWriter,
java.io.FileReader,java.io.BufferedReader,java.io.IOException,java.util.*,java.text.*,person.person,Time.DateInfo" %>
<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>编写请假记录</title>

</head>
<body>

<jsp:include page="getuser.jsp"/>
	<%
		String startdate=request.getParameter("startdate");
		String enddate=request.getParameter("enddate");
		String id=request.getParameter("id");
		if(startdate==null||enddate==null||id==null||startdate.equals("")||enddate.equals("")||id.equals(""))
		{
			String sql="select * from employee where state='normal'";
			ResultSet rs=workm.executeQuery(sql);
			//Vector<integer> ids;

			List<Integer> ids=new ArrayList();
			while(rs.next())
			{
				ids.add(rs.getInt("id"));
			}
	%>
	<form method="get">
		<div class="login_box">
		<table>
		<h1 class="title">编写放假信息</h1>
		<input  id="dateof" class="input_box" type="date" placeholder="起始日期" name="startdate">
		<br/>
		<center><label for="dateof">起始日期</label></center>
		<input id="dateend" class="input_box" type="date" placeholder="截止日期 " name="enddate">
		<br/>
		<center><label for="dateend">截止日期</label></center>
		<br/>
		<select id ="eid" class="input_box" type="text" placeholder="员工编号" name="id">
			<% for (int prof : ids) { %>
	      		<option value="<%= prof %>"><%= prof %></option>
	    	<% } %>
		</select>
		</br>
		<center><label for="eid">员工编号</label></center>
		<!-- <input class="input_box" type="text" placeholder="员工编号" name="id">-->
		<input class="button_box" type="submit" value="提交">
		</table>
		</div>
	</form>
	<% 
		}
		else 
		{
			
			SimpleDateFormat shortFormat = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date date1 = shortFormat.parse(startdate),date2 = shortFormat.parse(enddate);
	        DateInfo anowdate1=new DateInfo(date1),anowdate2=new DateInfo(date2);
			int eid=Integer.parseInt(id);	
			String sql="select * from worktimecard natrual join workcard_days where employee_id='"+id+"' and "+"number_of_day between '"+anowdate1.getString()+"' and '"+anowdate2.getString()+"'";
			ResultSet rs=workm.executeQuery(sql);
			System.out.println(sql);
			if(rs.next())
			{
				
				out.println("<center><h1>该员工在此期间在职,操作失败！</h1></center>");
			
			}
			else 
			{
				sql="select * from leave_record where employee_id='"+eid+"' and (start_date between '"+anowdate1.getString()+"' and '"+anowdate2.getString()+"' or end_date between '"+anowdate1.getString()+"' and '"+anowdate2.getString()+"')";
				System.out.println(sql);
				workm.close();
				rs=workm.executeQuery(sql);
				if(rs.next())
				{
					out.println("<center><h1>该时间段存在休假</h1></center>");
				}
				else 
				{
				sql="insert into leave_record(employee_id,start_date,end_date,type) values('"+eid+"','"+anowdate1.getString()+"','"+anowdate2.getString()+"',0)";
				System.out.println(sql);
				workm.close();
				if(workm.executeUpdate(sql))
				{
					out.println("<center><h1>填写成功！</center></h1>");
				}
				else 
				{
					out.println("<center><h1>填写失败</center></h1>");
				}
				}
			}
		}
	%>
</body>
</html>