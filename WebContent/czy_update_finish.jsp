<%@ page contentType="text/html; charset=utf-8" %> <%--这里的utf-8是指服务器发送给客服端时的内容编码 --%>

<%@ page pageEncoding="utf-8"%> <%--这里的utf-8是指 .jsp文件本身的内容编码 --%>
<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>
<%@ page import="java.sql.*,java.time.LocalDateTime,java.time.format.DateTimeFormatter,java.io.FileWriter,
java.io.FileReader,java.io.BufferedReader,java.io.IOException,java.util.*,java.text.*,person.person,Time.DateInfo" %>

<html>
<head>
<title>更改成功</title>
</head>

<div>
<ul class="mytest">
	<%
person u=(person)session.getAttribute("user");
%>

	
<li class="right"><a class="no_line" href="czy_update.jsp">返回更改页面</a></li>

</ul>  
</div>

<body>

 <%  
        try {          
    		request.setCharacterEncoding("UTF-8");
        	String uu_id=request.getParameter("uu_id");
        	String u_type=request.getParameter("u_type");
        	String u_name=request.getParameter("u_name");
        	String u_mailing_address=request.getParameter("u_mailing_address");
        	String u_social_security_number=request.getParameter("u_social_security_number");
        	String u_standard_tax_deductions=request.getParameter("u_standard_tax_deductions");
        	String u_other_deductions=request.getParameter("u_other_deductions");
        	String u_phone_number=request.getParameter("u_phone_number");
        	String u_hourly_rate=request.getParameter("u_hourly_rate");
        	String u_salary=request.getParameter("u_salary");
        	String u_commission_rate=request.getParameter("u_commission_rate");
        	String u_hour_limit=request.getParameter("u_hour_limit");
        	String u_vacation_time=request.getParameter("u_vacation_limit");
        	String sql;
            sql="UPDATE employee SET name = '"+u_name+"' ,type='"+u_type+"',mailing_address='"+u_mailing_address+"',social_security_number='"+u_social_security_number+"',standard_tax_deductions='"+u_standard_tax_deductions+
            		                        "',other_deductions='"+u_other_deductions+"',phone_number='"+u_phone_number+"',hourly_rate='"+u_hourly_rate+
            		                        "',salary='"+u_salary+"',commission_rate='"+u_commission_rate+"',hour_limit='"+u_hour_limit+"',vacation_time="+u_vacation_time+" WHERE name = '"+uu_id+"'";
            System.out.println(sql); 
            
            if(workm.executeUpdate(sql))
                out.println("更改成功！");
            else 
            	out.println("更新失败！");
                // Execute a simple SQL query


        }
 catch(Exception e)
 {e.printStackTrace();}
%>   
</body>
</html>