
<%@ page import="java.sql.*,person.person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,javax.mail.*"%>

<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<html>

<head>
	<link href="sumstyle.css" rel="stylesheet" type="text/css">
		
<script type="text/javascript">
function $$(id)
{
	return document.getElementById(id);
}
window.onload = function()
{
	//$$(username).addEventListener("blur",username_check);
}
function username_check()
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

function password_check()
{
	var formm=document.getElementById("lookforpwd");
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

function repassword_check()
{
	var formm=document.getElementById("lookforpwd");
	if(formm.password.value!=formm.password2.value)
	{
		$$('reassword').innerHTML="输入不一致";
		$$('reassword').className="failure";
	}
	else 
	{
		$$('reassword').innerHTML="输入一致";
		$$('reassword').className="success";
	}
}
function lookfor_chkinput()
{
	var formm=document.getElementById("lookforpwd");
	//alert(formm.username.value);
	
	if(formm.password.value=="")
	{
		alert("请输入密码！");
		formm.password.focus();
		return false;
	}
	
	if(formm.password2.value=="")
	{
		alert("请输入两次密码");
		formm.password2.focus();
		return false;
	}
	if(formm.password2.value!=formm.password.value)
	{
		alert("请输入两次相同的密码");
		formm.password2.focus();
		return false;
	}
	return true;
}

function lookfor_chkinput2()
{
	var formm=document.getElementById("lookforpwd2");
	//alert(formm.username.value);
	
	if(formm.username.value=="")
	{
		alert("请输入账号！");
		formm.username.focus();
		return false;
	}
	return true;
}
function hello()
{
	alert("good good study, day day happy!");
}

</script>
</head>
<body>
<%
// 以下变量为用户根据自己的情况设置
String smtphost = "smtp.163.com"; // 发送邮件服务器
//String user = "1930774123@qq.com"; // 邮件服务器登录用户名
//String password = "uhyxdqkxnlbjecga"; // 邮件服务器登录密码
//String from = "1930774123@qq.com"; // 发送人邮件地址
String to =null; // 接受人邮件地址"1942864809@qq.com";//
String subject = "找回账号邮箱验证"; // 邮件标题
String body = "欢迎使用本网站，您的验证码是："; // 邮件内容
 String from = "dxfhill@163.com";
        String password = "CNDNYVGNOEHRBRBA";
		String code="";
        //设置用户名
        String user = "dxfhill@163.com";
%>
<%!
	// 定义数据库驱动程序
	String DBDRIVER="com.mysql.cj.jdbc.Driver";
	//= "com.mysql.jdbc.Driver" ;

	// 定义数据库连接地址
	String DBURL = "jdbc:mysql://hillweb:3306/pubdb" ;
	//定义用户名和口令
	String userr="user";
	String pwdd="123456";

	// 定义数据库连接对象，属于java.sql包中的接口
	Connection conn = null ;

	// 定义Statement对象，用于操作数据库
	Statement stmt = null ;

	// 定义ResultSet对象，用于存储查询结果
	ResultSet rs = null ;

	// 定义一字符串变量，用于保存SQL语句
	String sql = null ;
%>
<%
			   String code1=request.getParameter("code");
		   
		   
	 if(code1==null)
	 {}
	else 
	{
		String code2=(String)session.getAttribute("coding");
		String newpwd=(String)request.getParameter("password");
		String newname=(String)session.getAttribute("username1");
		//out.print(newname+newpwd);
		if(code1.equals(code2))
		{
			String sql = "update account_inf set password = '"+newpwd+"' where account_number = '"+newname+"'";
			workm.executeUpdate(sql);
			out.print("密码修改完成");
			response.sendRedirect("success_pwd.jsp");
		}
		else 
		{
			response.sendRedirect("wrong_code.jsp");
		}
	}
	
	
	
		   String name=request.getParameter("username");
	if(name!=null)
	{
		Random rand = new Random();
		int wei=6;
		while((wei--)!=0)
		{code+=rand.nextInt(10);}
	body+=code;
	session.setAttribute("coding",code);
     String sql="select  email_address from account_inf where account_number='"+name+"'";
	 
     rs=workm.executeQuery(sql);
	 boolean is_exit_flag=false;
	 String get_id,get_name=null,get_pass=null;
	 //out.print("{");
     if(rs!=null&&rs.next())
	 {
         is_exit_flag=true;
     }
	 if(is_exit_flag)
	 {
		 to=rs.getString(1);
	 }
	 if(rs!=null)
	 rs.close();
	 session.setAttribute("username1",name);
	 }
	

%>

 
			<jsp:include page="getuser.jsp"/>

		<div class="login_box">
		<h1 class="title">欢迎修改密码</h1>
		
<form method="post" id="lookforpwd2"  action="找回密码.jsp" >
   <table>
  <%
 String ans=request.getParameter("username");
 
  if(ans==null)
{
	;
}
else
{

// 以下为发送程序，用户无需改动
try {
//初始化Properties类对象
Properties props = new Properties();
//设置mail.smtp.host属性
props.put("mail.smtp.host", smtphost);
//设置使用验证
props.put("mail.smtp.auth","true");
 props.setProperty( "mail.smtp.port", "25" );
 props.setProperty( "mail.transport.protocol", "smtp" );
// 获取非共享的session对象
Session ssn= Session.getInstance(props,null);
//创建一个默认的MimeMessage对象。
MimeMessage message = new MimeMessage(ssn);
//创建InternetAddress对象
InternetAddress fromAddress = new InternetAddress(from);
//设置From: 头部的header字段
message.setFrom(fromAddress);
//创建InternetAddress对象
InternetAddress toAddress = new InternetAddress(to);
//设置 To: 头部的header字段
message.addRecipient(Message.RecipientType.TO, toAddress);
//设置 Subject: header字段
message.setSubject(subject);
// 现在设置的实际消息
message.setText(body);
//定义发送协议
Transport transport = ssn.getTransport("smtp");
//建立与服务器的链接
transport.connect(smtphost, user, password);
//发送邮件
transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
//transport.send(message);
request.setAttribute("mail_tell","yes");
//关闭邮件传输
transport.close();
} 
catch(Exception m) //捕获异常
{
	out.print("<tr><td><p align='center'>"+"未查询到此用户"+"</tr></td>");
//out.println(m.toString());
m.printStackTrace();
}
}
%>
<%
	String anss=(String)request.getAttribute("mail_tell");
 
  if(anss==null||!anss.equals("yes"))
{
	out.print( " <tr> <td><input class='input_box' type='text'id='username' name='username' onblur='login_username_check()'placeholder='查询账号'></td></tr> ");
}
else 
{
	String usernam=(String)request.getParameter("username");
 out.print( " <tr> <td><input value="+usernam+" class='input_box' type='text'id='username' name='username' onblur='login_username_check()'placeholder='查询账号'></td></tr> ");

}

  out.print("<tr><td><input class='button_box' type='submit' value='发送邮件'></td></tr>");
  %>

  
  <%
		String ansss=(String)request.getAttribute("mail_tell");
 
  if(ansss==null||!ansss.equals("yes"))
{
	
}
else 
{
	out.print("<tr><td><p align='center'>"+"验证码已发送到您的注册邮箱"+"</tr></td>");
}

  %>
  
  </table>
  </form>
  <form method="post" id="lookforpwd"  action="找回密码.jsp"onsubmit="return lookfor_chkinput();" >
  
	 <tr>
	<td>
		
		<input class="input_box"  name="code" placeholder="验证码">
		
	</td>
  </tr>
  <tr> <td><p id="code_mes" name="code_mes" align="center">验证码</p></td></tr>
  
	<tr>
	    <td>
		<input class="input_box" type="password" placeholder="密码" onblur="password_check()" name="password"></td>
  </tr>
  <tr> <td><p id="assword" align="center"name="assword" >输入密码</p></td></tr>
  <tr>
	<td>
		
		<input class="input_box" type="password" name="password2" onblur="repassword_check()"placeholder="再输入一次密码">
		
	</td>
  </tr>
  <tr> <td><p id="reassword" name="reassword" align="center">再输入一次密码</p></td></tr>
    <input class="button_box" type="submit" value="修改密码">
  </form>
 
 
	
		</div>
	
		
	<style type="text/css">
	no_line {text-decoration: none;}
	a{text-decoration: none;}
	*{
		font-family:"楷体";
		
		
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
			background:url("back1.jpg") no-repeat;
            background-size: 100% 100%;
            background-position: center center;
            overflow: auto;
		height: 900px;
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
		height: 750px;
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