<%@ page contentType="text/html; charset=utf-8" %> <%--这里的utf-8是指服务器发送给客服端时的内容编码 --%>

<%@ page pageEncoding="utf-8"%> <%--这里的utf-8是指 .jsp文件本身的内容编码 --%>
<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>
<%@ page import="java.sql.*,person.person"%>

<html>
<head>
<title>通过JSP打开数据表</title>
</head>
<body>

 <%  
        try {          
                Statement stmt = null;  
                ResultSet rs = null;  
                int max=4;
                String name="czy7777";
                // Execute a simple SQL query
                String sql = "SELECT * FROM employee";
                rs=workm.executeQuery(sql);
                out.println("6666</br>");
                while (rs.next()) {
                    out.println("ID: " + rs.getInt("id") + ", Name: " + rs.getString("name")+",type: " + rs.getString("type")+
                    			",mailing_address: "+rs.getString("mailing_address")+",social_security_number: "+rs.getString("social_security_number")
                    			+",standard_tax_deductions: "+rs.getString("standard_tax_deductions")+",other_deductions: "+rs.getString("other_deductions")
                    			+",phone_number: "+rs.getString("phone_number")+",hourly_rate: "+rs.getString("hourly_rate")+",salary: "+rs.getString("salary")
                    			+",commission_rate: "+rs.getString("commission_rate")+",hour_limit: "+rs.getString("hour_limit")
                    			+"payment_method"+rs.getString("payment_method")+",state: "+rs.getString("state")+",vacation_time: "+rs.getString("vacation_time")
                    			+"</br></br>");
                }
                sql="UPDATE employee SET name = '"+name+"' WHERE id = "+max+"";
                System.out.println(sql);                
                workm.executeUpdate(sql);
        }
 catch(Exception e)
 {e.printStackTrace();}
%>   
</body>
</html>