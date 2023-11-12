<%@ page contentType="text/html; charset=utf-8" %> <%--这里的utf-8是指服务器发送给客服端时的内容编码 --%>

<%@ page pageEncoding="utf-8"%> <%--这里的utf-8是指 .jsp文件本身的内容编码 --%>


<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>
<html>
	<head>
		<title>网站 </title>
		
	</head>
	<body >
<%@ page import="java.sql.*,person.person"%>
<%--@ page import="com.mysql.jdbc.Driver"--%>
<%--
	除了insert , update , delete 之外，还可以进行create操作
--%>

<%--
--
 <jsp:include page="getuser.jsp"/>
--
--%>
<div>
<ul class="mytest">
	<%
person u=(person)session.getAttribute("user");
%>

	
		<li class="right"><a class="no_line" href="登录界面.jsp">登录</a></li>
		<li class="right"><a class="no_line" href="找回密码.jsp">密保</a></li>
		<li class="right"><a class="no_line" href="注册界面.jsp">注册</a></li>
		<li class="right"><a class="no_line" href="index.jsp">首页</a></li>
</ul>  
	</div>
<% 
try
{
		   ResultSet rs;
		   String name=request.getParameter("username");
		String pass=request.getParameter("password");
		String poi[]=request.getParameterValues("poit");
		boolean poi_flag;
		String id_check;
		int poinum=0;
		if(poi[0].equals("administor"))
		{
			poi_flag=true;
			id_check="administor";
			poinum=1;
		}
		else 
		{
			poi_flag=false;
			id_check="customer";
		}
     String sql="select  * from account_inf where account_number='"+name+"'"
    		 +"and password='"+pass+"'"+"and type='"+poinum+"'";
     
     rs=workm.executeQuery(sql);
     System.out.println(sql);
	 boolean is_exit_flag=false;
	 //String// name;
	String type;
	String mailing_address;
	String social_security_number;
	double standard_tax_deductions;
	double other_deductions;
	String phone_number;
	double hourly_rate,salary,commission_rate;
	int number=0;
	double hour_limit;
	String userType;//=userType;
	String maiadd;
	int id;
	String payment_method,state,vacation_time;
    if(rs.next())//)&&rs.getString("type").equals(id_check))
	{
		id=rs.getInt("id");
        is_exit_flag=true;
    }
	rs.close();

	person aperson=null;
	if(is_exit_flag&&poinum==0)
	{	
		out.print("<br/><h1 align='center'>"+name);
		out.print(" "+"您的身份是");
		
			out.println("员工</h1>");
			sql="select * from employee where name='"+name+"'";
			rs=workm.executeQuery(sql);
			System.out.println(sql);
			rs.next();
			type=rs.getString("type");
			mailing_address=rs.getString("mailing_address");
			social_security_number=rs.getString("social_security_number");
			standard_tax_deductions=rs.getDouble("standard_tax_deductions");
			other_deductions=rs.getDouble("other_deductions");
			phone_number=rs.getString("phone_number");
			hourly_rate=rs.getDouble("hourly_rate");
			id=rs.getInt("id");
			salary=rs.getDouble("salary");
			commission_rate=rs.getDouble("commission_rate");
			payment_method=rs.getString("payment_method");
			hour_limit=rs.getDouble("hour_limit");
			state=rs.getString("state");
			vacation_time=rs.getString("vacation_time");
			rs.close();
			sql="select * from account_inf where account_number ='"+name+"'";
			rs=workm.executeQuery(sql);
			userType="employee";
			rs.next();
			maiadd=rs.getString("email_address");
			rs.close();
			person aper=new person(id,
					name,
					type,
					mailing_address,
					social_security_number,
					standard_tax_deductions,
					other_deductions,
					phone_number,
					hourly_rate,
					salary,
					commission_rate,
					hour_limit,
					payment_method,
					state,
					vacation_time,
					userType,
					maiadd);
			aperson=aper;
			request.getSession().setAttribute("user",aperson);
			out.println("<br/><h1 align='center'>登录成功，欢迎！！！</h1>");
		}
		else if(is_exit_flag&&poinum==1)
		{
				out.print("<br/><h1 align='center'>"+name);
			out.print(" "+"您的身份是");
			out.println("管理员</h1>");
			userType="administor";
			sql="select * from account_inf where account_number='"+name+"'";
			rs=workm.executeQuery(sql);
			rs.next();
			maiadd=rs.getString("email_address");
			id=rs.getInt("id");
			person aper=new person(id,name,userType,maiadd);
			aperson=aper;
			rs.close();
			request.getSession().setAttribute("user",aperson);
			out.println("<br/><h1 align='center'>登录成功，欢迎！！！</h1>");
		}
		else 
		{
			aperson=null;
			request.getSession().setAttribute("user",aperson);
			out.println("<br/><h1 align='center'>登录失败，输入的账号或密码有误，请核实</h1>");
		}
	}

catch(Exception e)
{e.printStackTrace();}
%>
<script type="text/javascript">
function $$(id)
{
	return document.getElementById(id);
}
function login_username_check()
{//alert("?");
	var formm=document.getElementById("mkforid");
	if(formm.username.value.length<6)
	{
		$$('sername').innerHTML="长度过短";
		$$('sername').className="failure";
	}
	else 
	{
		$$('sername').innerHTML="长度合适";
		$$('sername').className="success";
	}
}

function login_password_check()
{
	var formm=document.getElementById("mkforid");
	if(formm.password.value.length<6)
	{
		$$('assword').innerHTML="长度过短";
		$$('assword').className="failure";
	}
	else 
	{
		$$('assword').innerHTML="长度合适";
		$$('assword').className="success";
	}
}

function login_chkinput()
{
	var formm=document.getElementById("mkforid");
	//alert(formm.username.value);
	if(formm.username.value=="")
	{
		alert("请输入用户名!");
		formm.username.focus();
		return false;
	}
	if(formm.password.value=="")
	{
		alert("请输入密码！");
		formm.password.focus();
		return false;
	}
	
	return true;
}
function hello()
{
	alert("good good study, day day happy!");
}

</script>
	
	<style type="text/css">
	no_line {text-decoration: none;}
	a{text-decoration: none;}
	*{
		font-family:"楷体";
		
		
	}	
	
	.mytest .right
	{
		list-style:none;
		width :50px;
		float:right;
	}
a:link {
  color: black;
}

a:visited {
  color: black;
}

a:hover {
  color: blue;
}

a:active {
  color: yellow;
}
		body{
		body{
			background:url("backpic1.jpg") no-repeat;
            background-size: 100% 100%;
            background-position: center center;
            overflow: auto;
		height: 700px;
       }
	.mytest
	{
		align:left;
	}
	.mytest .left
	{
		list-style:none;
		align:left;
		
	}
	.mytest .right
	{
		list-style:none;
		width :50px;
		float:right;
	}
	.input_box {
		width: 300px;
		height: 30px;
		padding-left: 10px;
		margin-top: 20px;
		margin-left: 50px;
	}
	.title {
		text-align: center;
		font-size: 28px;
		color: #000;
		margin-top: 80px;
		margin-bottom: 10px;
		letter-spacing: 3px;
		font-family: sans-serif;
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
	.success
	{
		color:green;
	}
	.failure
	{
		color:red;
	}
	.button_box {
		width: 300px;
		height: 35px;
		margin-top: 20px;
		margin-left: 50px;
		border-radius: 5px;
		background-color: #12564a;
		cursor: pointer;
		color: #fff;
	.login_box {
		width: 400px;
		height: 400px;
		background-color: #fff;
		margin: auto;
		margin-top: 150px;
		border-radius: 5px;
		overflow: hidden;
	}
	.success
	{
		background:#f5f5f5;
		font-weight:bold;
		color:#000000;
		border:1px #009900 solid;
	}
	.failure
	{
		background:#f5f5f5;
		font-weight:bold;
		color:#000000;
		border:1px #990000 solid;
	}
	</style>
	</body>
</html>