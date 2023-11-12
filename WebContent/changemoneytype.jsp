<%@ page contentType="text/html; charset=utf-8" %> <%--这里的utf-8是指服务器发送给客服端时的内容编码 --%>

<%@ page pageEncoding="utf-8"%> <%--这里的utf-8是指 .jsp文件本身的内容编码 --%>

<%@ page import="java.sql.*,person.person,java.net.URI"%>
<!DOCTYPE html>
<meta charset="utf-8">
<html>
	<head>
		<title>学习网站登陆界面 </title>
		
	</head>
	<body >
	
<script type="text/javascript">

function $$(id)
{
	return document.getElementById(id);
}
function modifyClassDisplay(className, newDisplayValue) {
    var elements = document.getElementsByClassName(className);
    for (var i = 0; i < elements.length; i++) {
    	//alert(elements[i].style.display);
        elements[i].style.display = newDisplayValue;
    	
        //elements[i]
    }
}
function click_mail()
{
	//alert("mail");
	modifyClassDisplay("mail","inline");
	modifyClassDisplay("bank","none");
}
function click_pick_up()
{
	//alert("pick_up");
	
	//modifyClassDisplay("mail","inline");
	click_mail();
	modifyClassDisplay("mail","none");
	modifyClassDispley("bank","none");
	modifyClassDisplay("bank","none");
}
function click_bank()
{
	//alert("bank");
	modifyClassDisplay("mail","none");
	modifyClassDisplay("bank","inline");
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
<%
	person aperson=(person)session.getAttribute("user");
	if(aperson==null)
	{
		String targetURL = "./登录界面.jsp"; // 要重定向的 URL
		URI uri = new URI(targetURL);
		URI encodedUri = new URI(uri.toASCIIString());
		//targetURL = java.net.URLEncoder.encode(targetURL, "UTF-8"); // 编码 URL
		response.sendRedirect(encodedUri.toASCIIString());

	}
	
%>
</script>
		<jsp:include page="getuser.jsp"/>
		<div class="login_box">
		<h1 class="title">修改支付方式</h1>
			
<form method="post" id="mkforid"  action="changemoneyway"onsubmit="return login_chkinput();" >
   <table >
   <tr>
    <td><input class="input_box" type="text"id="username" name="username" value=
    "<%if(aperson!=null&&aperson.getuserType().equals("employee"))out.print(aperson.getname());%>"
    <%if(aperson!=null&&aperson.getuserType().equals("employee")) {%>readonly="readonly"<%; }%>
     onblur="login_username_check()"placeholder="账号"></td>
  </tr>
  	<tr> <td><p id="sername" align="center" name="Username" >输入账号</p></td></tr>
  
   <tr>
   <td>
   <div align="center">
   <input type="radio" checked="true" name="poit" value="pick_up" onclick="click_pick_up()">提款
	<input type="radio" name="poit" value="mail" onclick="click_mail()">邮寄
	<input type="radio" name="poit" value="bank" onclick="click_bank()">存款
	</div>
	</td>
   </tr>
   <tr><td><input class="mail input_box" type="text" id="mail_addr" name="mail_addr" placeholder="请输入邮寄地址"></td></tr>
  	<tr><td><input class="bank input_box" type="text" id="bank_name" name="bank_name" placeholder="请输入银行名称"></td></tr>
  	<tr><td><input class="bank input_box" type="text" id="bank_id" name="bank_id" placeholder="请输入银行卡号"></td></tr>
  	
  <tr>
	<td>
  <input class="button_box" type="submit" value="提交">
	</td>
  </tr>
 
  </table>
  </form>
		</div>
	
	<style type="text/css">
	no_line {text-decoration: none;}
	a{text-decoration: none;}
	*{
		font-family:"楷体";
		
	}
	a.login_out
	{
		color: red;
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
    .bank
    {
    	display:none;
    }
    .mail
    {
    	display:none;
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
		align:center;
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