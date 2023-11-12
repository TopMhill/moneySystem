<%@ page contentType="text/html; charset=utf-8" %> <%--这里的utf-8是指服务器发送给客服端时的内容编码 --%>

<%@ page pageEncoding="utf-8"%> <%--这里的utf-8是指 .jsp文件本身的内容编码 --%>
<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>
<%@ page import="java.sql.*,person.person"%>

<html>
<head>
<title>添加成功</title>
</head>

<div>
<ul class="mytest">
	<%
person u=(person)session.getAttribute("user");
%>

	
<li class="right"><a class="no_line" href="czy_add.jsp">返回添加页面</a></li>

</ul>  
</div>

<body>

 <%  

		request.setCharacterEncoding("UTF-8");
        try {          
        	String e_type=request.getParameter("e_type");
        	String e_name=request.getParameter("e_name");
        	String e_mailing_address=request.getParameter("e_mailing_address");
        	String e_social_security_number=request.getParameter("e_social_security_number");
        	String e_standard_tax_deductions=request.getParameter("e_standard_tax_deductions");
        	String e_other_deductions=request.getParameter("e_other_deductions");
        	String e_phone_number=request.getParameter("e_phone_number");
        	String e_hourly_rate=request.getParameter("e_hourly_rate");
        	String e_salary=request.getParameter("e_salary");
        	String e_commission_rate=request.getParameter("e_commission_rate");
        	String e_hour_limit=request.getParameter("e_hour_limit");
        	String e_mail=request.getParameter("email");
        	String pick_up="pick_up";
        	String normal="normal";
        	String sql="select * from employee where name='"+e_name+"'";
        	ResultSet findrs=workm.executeQuery(sql);
        	if(findrs.next())
        	{
        		out.println("添加失败，已经存在该用户名字!");
        	}
        	else {
        	sql = "insert into employee(name,type,mailing_address,social_security_number,"+
        			"standard_tax_deductions,other_deductions,phone_number,hourly_rate,salary,"+
        			"commission_rate,hour_limit,payment_method,state,vacation_time,bank_id,bank_name,mail,email) "
        			+"values('" + e_name +
        			"','" + e_type + "','" + e_mailing_address + "','" + e_social_security_number
        			+ "','" + e_standard_tax_deductions + "','" + e_other_deductions + "','"
        			+ e_phone_number + "','" + e_hourly_rate + "','" + e_salary + "','"
					+ e_commission_rate + "','" + e_hour_limit + "','" + pick_up + "','" + normal + 
					"',0,null,null,null,'"+e_mail+"')";
            System.out.println(sql);
            if(workm.executeUpdate(sql))
	           	out.println("添加成功！");
            else 
            	out.println("添加失败！请注意输入信息完整性!");
        	}

        }
 catch(Exception e)
 {e.printStackTrace();}
%>   
</body>
</html>