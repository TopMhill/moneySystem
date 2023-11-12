<%@ page contentType="text/html; charset=utf-8" %> <%--这里的utf-8是指服务器发送给客服端时的内容编码 --%>

<%@ page pageEncoding="utf-8"%> <%--这里的utf-8是指 .jsp文件本身的内容编码 --%>
<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>
<%@ page import="java.sql.*,person.person"%>

<html>
<head>
<title>更改员工信息</title>
</head>
<script type="text/javascript">
</script>

<body>
<jsp:include page="getuser.jsp"/>
<div class="login_box">

<form method="post" id="e_update" accept-charset="utf-8" action="czy_update_finish.jsp">

   
 <%  
 request.setCharacterEncoding("utf-8");
 ResultSet rs = null;  
 
        try {          
                String u_id=request.getParameter("id");
                %><input type="hidden" name="uu_id" value="<%= u_id %>"><% 
                int max=4;
                // Execute a simple SQL query
                String sql = "SELECT * FROM employee WHERE name='"+u_id+"'";
                System.out.println(sql);
                rs=workm.executeQuery(sql);
                if (rs.next()) {
                	/*
  								 out.println("员工ID: " + rs.getInt("id") + "</br>姓名: " + rs.getString("name")+"</br>类型: " + rs.getString("type")+
                    			"</br>通讯地址: "+rs.getString("mailing_address")+"</br>社会保障号码: "+rs.getString("social_security_number")
                    			+"</br>标准税收减免: "+rs.getString("standard_tax_deductions")+"</br>其它扣除: "+rs.getString("other_deductions")
                    			+"</br>电话号码: "+rs.getString("phone_number")+"</br>时薪: "+rs.getString("hourly_rate")+"</br>薪资: "+rs.getString("salary")
                    			+"</br>佣金率: "+rs.getString("commission_rate")+"</br>工时限制: "+rs.getString("hour_limit")+"</br>假期时间:"+rs.getString("vacation_time")+"</br>"
                    		);
                	*/;
                }
                
        }
 catch(Exception e)
 {e.printStackTrace();}
%>
<h1>请输入更改后的员工信息：</h1>
<table>
   <tr><td>
      员工类型：</br><input type="radio" checked="true" name="u_type" value="salaried">salaried
   <input type="radio"  name="u_type" value="commissioned">commissioned
   <input type="radio"  name="u_type" value="hourly">hourly
   </td></tr>
	
  <tr>
    <td>名字: <input class="input_box" type="text" id="u_name" value=<%=rs.getString("name") %> name="u_name" ></td>
    </tr>
   
  <tr>   
  <td>通讯地址: <input class="input_box" type="u_mailing_address" value=<%=rs.getString("mailing_address") %> name="u_mailing_address"></td>
  </tr>
  
  <tr> 
  <td>社保号: <input class="input_box" type="u_social_security_number" value=<%=rs.getString("social_security_number") %> name="u_social_security_number"></td>
  </tr>
  
  <tr> 
  <td>税收率: <input class="input_box" type="u_standard_tax_deductions" value=<%=rs.getString("standard_tax_deductions") %> name="u_standard_tax_deductions"></td>
  </tr>
  
  <tr> 
  <td>其它扣费: <input class="input_box" type="u_other_deductions" value=<%=rs.getString("other_deductions") %> name="u_other_deductions"></td>
  </tr>
  
  <tr> 
  <td>电话号码: <input class="input_box" type="u_phone_number"  value=<%=rs.getString("phone_number") %> name="u_phone_number"></td>
  </tr>
  
  <tr>  
  <td>时薪: <input class="input_box" type="u_hourly_rate" value=<%=rs.getString("hourly_rate") %> name="u_hourly_rate"></td>
  </tr>
  
  <tr> 
  <td>薪资: <input class="input_box" type="u_salary" value=<%=rs.getString("salary") %> name="u_salary"></td>
  </tr>
  
  <tr> 
  <td>佣金率: <input class="input_box" type="u_commission_rate" value=<%=rs.getString("commission_rate") %> name="u_commission_rate"></td>
  </tr>
  
  <tr> 
  <td>工时限制: <input class="input_box" type="u_hour_limit" value=<%=rs.getString("hour_limit") %> name="u_hour_limit"></td>
  </tr>
  
 <tr> 
  <td>假期时间: <input class="input_box" type="vacation_limit" value=<%=rs.getString("vacation_time") %> name="u_vacation_limit"></td>
  </tr>
  
  
  <tr>
	<td>
  <input class="button_box" type="submit" value="更改">
	</td>
  </tr>
 
  </table>
  </form> 
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
		height: 830px;
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