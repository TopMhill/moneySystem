<%@ page contentType="text/html; charset=utf-8" %> <%--这里的utf-8是指服务器发送给客服端时的内容编码 --%>

<%@ page pageEncoding="utf-8"%> <%--这里的utf-8是指 .jsp文件本身的内容编码 --%>


<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>
<html>
	<head>
		<title>添加成功</title>
		
	</head>
	<body >
<%@ page import="java.sql.*,person.person"%>
<%--@ page import="com.mysql.jdbc.Driver"--%>
<%--
	除了insert , update , delete 之外，还可以进行create操作
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
		   String account=request.getParameter("admin_account");
		String pass=request.getParameter("admin_password");
		String email=request.getParameter("admin_email");
		
     String sql="select  * from account_inf where account_number='"+account+"'";
     
     rs=workm.executeQuery(sql);
     System.out.println(sql);
	 boolean isnt_exit_flag=true;
	 
	 if(rs.next())
	 {
		 isnt_exit_flag=false;
	 }
	 rs.close();
	 
	if(isnt_exit_flag)
	{
		sql = "insert into account_inf(account_number, password, type, email_address) values('"+account+"', '"+pass+"', '1', '"+email+"')";
		System.out.println(sql);
	    workm.executeUpdate(sql);
	    out.println("<br/><h1 align='center'>添加成功！</h1>");
	}
	else
	{
		out.println("<br/><h1 align='center'>添加失败，输入的账号已存在，请修改！</h1>");
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