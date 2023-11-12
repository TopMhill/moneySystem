

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>

<%@ page import="java.sql.*,person.person"%>

<%@ page import="java.util.*,javax.mail.*"%>

<%@ page import="javax.mail.internet.*,javax.activation.*,Time.DateInfo,Time.getTime"%>
<%//使用opendb Bean%>

<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
	.tabletitle{color:black;font-size:10pt;line-height:18pt}
	body{
			background:url("back.jpg") no-repeat;
            background-size: 100% 100%;
            background-position: center center;
            overflow: auto;
		height: 900px;
       }
</style>
<title>工资系统</title>
<meta name="generator" content="microsoft frontpage 3.0">
</head>
<body>

<script language=javascript>
	function addtoshoppingcart(spid)	
	{
		var url;
		var newwin;
		url="add.jsp?BookID="+spid;
		newwin=window.open(url,'gouwuche','refresh=1 resizable=1,scrollbars=1,status=no,toolbar=no,location=no,menu=no,width=600,height=400');
	}
</script>

<script ID="ClientEventHandlersJS" language=javascript>


	function Search_onclick() 
	{
		if (document.all("txtKeyword").values=="")
		{
			alert("请输入查询关键字");
			return false;
		}
		return true;
	}
</script>
	<jsp:include page="getuser.jsp"/>
<div align="center"><center>
<table border="0" cellspacing="0" cellpadding="0" width=90% align="center">
	<tr>
	 	<td width="100%">
			<div align="center">
			<center>
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td width="15%" height="300px" align="left" valign="top" bgcolor="#ffffff" ">
					<div align="center">
					<center>
					<table border="0" cellpadding="0" cellspacing="0" width="100%" height="292px">
						<tr>
							<td width="100%" BGCOLOR="#ffffff" align="center" height="67">
						<!--  	<form method="post" action="search.jsp">
							-->  <p>
								
								<font color="#000000"><strong><big>
								个人信息
								</big></strong></font>
						<!-- 在这里写个人信息的代码   -->
						<!--  		<br>
								<input type="text" name="txtKeyword" size="12">
								<br>
								<input type="submit" value="开始" name="B1" language="javascript" onclick="return Search_onclick()">
							  </p>
							 </form>-->
							 </td>
						</tr>
						<% 
									person aperson=(person)session.getAttribute("user");
									
									if(aperson!=null && aperson.getuserType().equals("employee"))
									{
										
									
									aperson.renew();
									%>
						<tr>
							<td>
								名字：
								<% 
									String name = aperson.getname();
									out.print(name);
								%>
							</td>
						</tr>
						
						<tr>
							<td>
								联系方式：
								<% 
									String phone = aperson.getphone();
									out.print(phone);
								%>
							</td>
						</tr>
						<tr>
							<td>
								收支方式：
								<% 
									String payment_method = aperson.getpayment_method();
									out.print(payment_method);
								%>
							</td>
						</tr>
						<tr>
							<td>
								员工类型：
								<% 
									String type = aperson.gettype();
									out.print(type);
								%>
							</td>
						</tr>
						
						<tr>
							<td>
								假期时间：
								<% 
									String vacation_time = aperson.getvacation_time();
									DateInfo nowtime=new DateInfo(getTime.nowtime());
									String thisyear=nowtime.getstr(4);
									thisyear+="0101";
									for(int i=0;i<6;i++)
									{
										thisyear+="0";
									}
									String sqll="select start_date,end_date from leave_record where employee_id='"+aperson.getId()+"' and end_date >= '"+thisyear+"'";
									ResultSet rss=workm.executeQuery(sqll);
									int days=0;
									while(rss.next())
									{
										String start_date=rss.getString("start_date");
										String end_date=rss.getString("end_date");
										if(start_date.compareTo(thisyear)<0)
										{
											start_date=thisyear;
										}
										DateInfo start=new DateInfo(start_date);
										DateInfo end=new DateInfo(end_date);
										days+=start.caldays(end)+1;
									}
									double vacation=Double.parseDouble(vacation_time);
									out.print(vacation-days);
								%>
							</td>
						</tr>
						
						<%}else if(aperson!=null){  %>
						<%
							%>
						<tr>
						<td>
							<% 
							out.println("<center>管理员用户</center>");
							%>
						</td>
						</tr>
						<%} %>
					</table>
					</center>
					</div>
					</td>






					<td width="80%" VALIGN="TOP" ALIGN="LEFT">
					<div align="center">
					 
					<center>
					
					
					
					
					
					
					<table border="0" cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td width="80%" valign="top" align="left">
							<div align="center">
							 
							<center>
							
							<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
								  <br>
								  <td width="100%" valign="middle" align="left" height="19">
								  <div align="center">
								  <!-- <h2>公司简介<h2>-->
								  </div>
								  </td>
								</tr>
<header>
        <h1>吉林大学--4组信息技术公司</h1>
        <p>领先的技术解决方案和信息服务提供商</p>
    </header>

    <section>
        <h2>未来展望</h2>
        <p>吉林大学--4组计算机公司将继续投资于技术创新，扩大国际业务，并与客户合作，以解决未来数字化时代的挑战。公司坚信通过提供高品质的计算机科学与技术信息服务，可以为客户和社会创造更大的价值，促进技术的可持续发展。</p>
    </section>
								<tr>
								<!-- 
								  <td width="100%">
								  <div align="center">
								  <table width="100%" border="1" cellspacing="0" cellpadding="0" align="center" height="15">
								    <tr>
									  <td>
									  <div align="center">
									    编号
									  </div>
									  </td>
								    
									  <td>
									  <div align="center">
									   书名
									  </div>
									  </td>

									
									  <td>
									  <div align="center">
									    价格
									  </div>
									  </td>

									  <td>
									  <div align="center">
									    作者
									  </div>
									  </td>

									  <td>
									  <div align="center">
									    购买选择
									  </div>
									  </td>
<%
	String fatherid=request.getParameter("fatherid");
	String mysql;
	if (fatherid==null)
		mysql="select *  from book ";
	else
		mysql="select * from book where fatherid="+fatherid;
		ResultSet rs1=workm.executeQuery(mysql);
		if(rs1!=null){
		while (rs1.next()){
%>
                                      <tr>
									    <td>
										<div align="center">
<%

	String myid=String.valueOf(rs1.getInt("BookID"));
	String myid1=myid.trim();
	out.print(myid1);
%>
										</div>
										</td>

										<td>
										<div align="center">
										<%out.print(rs1.getString("BookName"));%>
										</div>
										</td>

										

										<td>
										<div align="center">
										<%out.print(rs1.getString("price"));%>
										</div>
										</td>

										<td>
										<div align="center">
										<%out.print(rs1.getString("Author"));%>
										</div>
										</td>

										<td>
										<div align="center">
										<a href="#"onclick=addtoshoppingcart('<%out.print(myid1);%>')>
										<img src="gouwu.jpg" width="34" height="33" border="0">
										</a>
										</div>
										</td>

									</tr>
<%
}
		
	rs1.close();
		}
%>
								  </table>
								  </center>
								  </div>
								  <--</td>-->
								</tr>
								
							</table>
							 
							</center>
							
							</div>
							</td>

							<td width="40%" valign="top" align="left">
							<div align="center">
							<center>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-family:宋体;font-size:9pt">
								<tr>
									<td colspan="2" style="border-bottom:2px solid RGB(0,128,0)">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<div align="center">
									<big>
									<font color="#FFFFFF">
									<strong>
									<font color="#FF0033">
									功能列表
									</font>
									</strong>
									</font>
									</big>
									</div>
									</td>
								</tr>
								<!-- 

								<tr>
									<td width="53%">
<%
	String cata="select * from catalog ";
	//ResultSet rs=workm.executeQuery(cata);
//	if(rs!=null)
//	{
	//while (rs.next()){
%>
									</a>
									<br>
<%
//	}
//	rs.close();
	//}
%>
									</td>
								</tr>
								-->
								<!-- 在此处输入功能列表 -->
								<tr><td>
	<table>
<%
person u=(person)session.getAttribute("user");
if(u!=null&&u.getuserType().equals("administor")){%>
	<tr><td><a href='czy_main.jsp'>员工管理</a></td></tr>
	<tr><td><a href='makevacation.jsp'>假期管理</a></td></tr>
	<tr><td><a href='行政报告.jsp'>行政报告</td></tr>
	<tr><td><a href="添加管理员.jsp">增加管理人员</a></td></tr>
	<tr><td><a href="exit.jsp">注销</a></td></tr>
	
	<%
	}
	else if(u!=null) {
	%>		
	
	<tr><td><a href='changemoneytype.jsp'>管理支付方式</a></td></tr>
	
	<tr><td><a href="员工报告.jsp">员工报告</a></td></tr>
	<%

	if(u.gettype().equals("commissioned"))
		{
		%>
		<tr><td> <a href="order_operate.jsp">订单管理</a></td></tr>
		<%} 
		else
		{
		//	System.out.println(u.gettype());
		%>
		<tr><td> <a href="工时卡.jsp">工时卡管理</a></td></tr>
		<%
			
		}
		%>
	<%if(u.getpayment_method().equals("bank")){}else { %>
	<tr><td><a href="getpreorder.jsp">工资单管理</a></td></tr>	
	<%} %>
	<tr><td><a href="exit.jsp">注销</a></td></tr>	
	<%} %>
	</table>
	</td></tr>
							</td>
							</tr>
							</table>
							</center>
							</div>
							</td>
						</tr>
					</table>
					</center>
					</div>
					</td>
				</tr>
			</table>
			</center>
			</div>
			</td>
		</tr>
	</table>
	</center>
	</div>
</body>
</html>

