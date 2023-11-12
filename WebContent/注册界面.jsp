<%@ page contentType="text/html; charset=utf-8" %> <%--这里的utf-8是指服务器发送给客服端时的内容编码 --%>

<%@ page pageEncoding="utf-8"%> <%--这里的utf-8是指 .jsp文件本身的内容编码 --%>

<!DOCTYPE html>
<meta charset="utf-8">
<html>
	<head>
		<title>网站注册界面 </title>
		
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

function one_username_check()
{//alert("?");
	var formm=document.getElementById("mkforid");
	if(formm.one_username.value.length<6)
	{
		$$('one_sername').innerHTML="长度过短";
		$$('one_sername').className="failure";
	}
	else 
	{
		$$('one_sername').innerHTML="长度合适";
		$$('one_sername').className="success";
	}
}

function password_check()
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

function repassword_check()
{
	var formm=document.getElementById("mkforid");
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
function emailCheck() 
{
	var emailStr=document.getElementById("mkforid").mail.value;
	var emailPat=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
	var matchArray=emailStr.match(emailPat);
	if (matchArray==null) 
	{
		return false;
	}
	return true;
}
function mail_check()
{
	var formm=document.getElementById("mkforid");
	if(!emailCheck())
	{
		
		$$('mail_mes').innerHTML="邮箱格式错误";
		$$('mail_mes').className="failure";
	}
	else 
	{
		$$('mail_mes').innerHTML="邮箱格式正确";
		$$('mail_mes').className="success";
	}
}

function choose_customer()
{
	var form=document.getElementById("age");
	form.style.display="none";
	form=document.getElementById("aname");
	form.style.display="none";
	form=document.getElementById("phone");
	form.style.display="none";


	form=document.getElementById("cus_phone");
	form.style.display="";

}
function choose_administor()
{
	var form=document.getElementById("age");
	form.style.display="";
	form=document.getElementById("aname");
	form.style.display="";
	form=document.getElementById("phone");
	form.style.display="";


	form=document.getElementById("cus_phone");
	form.style.display="none";
}
function chkinput()
{
	var formm=document.getElementById("mkforid");
	//alert(formm.username.value);
	if(formm.username.value=="")
	{
		alert("请输入!");
		formm.username.focus();
		return false;
	}
	if(formm.one_username.value=="")
	{
		alert("请输入用户名!");
		formm.one_username.focus();
		return false;
	}
	if(formm.password.value=="")
	{
		alert("请输入密码！");
		formm.password.focus();
		return false;
	}
	if(!emailCheck())
	{
		
		alert("电子邮件地址错误");
		formm.mail.focus();
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
function hello()
{
	alert("good good study, day day happy!");
}

</script>
	</head>
	<body >
	
		<jsp:include page="getuser.jsp"/>
	
		<div class="login_box">
		<h1 class="title">欢迎注册</h1>
		
<form method="post" id="mkforid"  action="注册成功.jsp"onsubmit="return chkinput();" >
   <table>
   <div align="center">
   <input type="radio" checked="true" name="poit" value="customer"onclick="choose_customer()">客户
	<input type="radio" name="poit" value="administor"onclick="choose_administor()">管理员<br/>
	</div>
   <tr>
    <td><input class="input_box" type="text"id="username" name="username" onblur="username_check()"placeholder="账号"></td>
  </tr>
  	<tr> <td><p id="sername"align="center" name="Username" >输入账号</p></td></tr>
   <tr>
    <td><input class="input_box" type="text"id="one_username" name="one_username" onblur="one_username_check()"placeholder="用户名"></td>
  </tr>
  	<tr> <td><p id="one_sername"align="center" name="one_Username" >输入用户名</p></td></tr>
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
  <tr>
   <tr>
    <td><input class="input_box" type="text"id="mail" name="mail"placeholder="邮箱" onblur="mail_check()"></td>
  </tr>
  
 	<tr> <td><p id="mail_mes"align="center" name="mail_mes"  >输入邮箱</p></td></tr>
   <tr>
    <td><input class="input_box"  style="display:none;"type="text"id="age"  name="age"placeholder="年龄" onblur=""></td>
  </tr>
   
   <tr>
    <td><input class="input_box" style="display:none;"type="text"id="phone" name="phone"placeholder="联系电话" onblur="phone_check()"></td>
  </tr>
	
   <tr>
    <td><input class="input_box" style="display:;"type="text"id="cus_phone" name="cus_phone"placeholder="电话" onblur="tea_phone_check()"></td>
  </tr>

 
	<td>
  <input class="button_box" type="submit" value="注册">
			
	</td>
  </tr>
 	
  </table>
  </form>
		
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
			background:url("backpic1.jpg") no-repeat;
            background-size: 100% 100%;
            background-position: center center;
            overflow: auto;
		height: 1100px;
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
		height: 1150px;
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