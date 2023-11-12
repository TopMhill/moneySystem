<%@ page import="java.sql.*,person.person"%>
<%@ page contentType="text/html; charset=utf-8" %> <%--这里的utf-8是指服务器发送给客服端时的内容编码 --%>

<%@ page pageEncoding="utf-8"%> <%--这里的utf-8是指 .jsp文件本身的内容编码 --%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript">
function $$(id)
{
	return document.getElementById(id);
}
function show_it()
{
	//alert("hello");
	$$('use').style.display="block";
}
function close_it()
{
	$$('use').style.display="none";
}
</script>
</head>
<body>

<jsp:include page="getuser.jsp" />

<%
request.setCharacterEncoding("UTF-8");
person u=(person)session.getAttribute("user");
if(u == null){
%>
<jsp:forward page = "首页.jsp"></jsp:forward>
<%}%>
<!-- 
<div class="mytest" style="width:100%">
<table width=100%>
<tr >
	<td class="left">

	</td>
		<td class="right"><a class="no_line" href="登录界面.jsp">登录</a></td>
		<td class="right"><a class="no_line" href="找回密码.jsp">密保</a></td>
		<!--<li class="right"><a class="no_line" href="注册界面.jsp">注册</a></li>-->
<!-- 		<td class="right"><a class="no_line" href="index.jsp">首页</a></td>
</tr>  
</table>
	</div>
-->

<ul class="login_box">
	<li><a href="create_order.jsp">创建订单</a></li>
	<li><a href="alter_order.jsp" >变更订单</a></li>
	<li><a href="delete_order.jsp">删除订单</a></li>
	</ul>
<style type="text/css">

#big_b{position:relative;}
	#base_mes{color:blue;position:relative;}
	div#use{display:none;top:30px;height:100px;width:300px;position:absolute;}
	#page_one{text-indent:0em;}
	*{
		font-family:"楷体";
		
		
	}	
	#exit :link
	{
		color : red;
	}
	#exit :visited {
  color: black;
}

#exit:hover {
  color: blue;
}

#exit:active {
  color: yellow;
}
a:link {
  color: black;
}
.no_line {text-decoration: none;}
	a{text-decoration: none;}

body
{
	background-image:url('back.jpg');
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
		
	.mytest
	{
		align:left;
		background-color:white;
	}
	.left
	{
		list-style:none;
		text-align:left;
		
	}
	.right
	{
		list-style:none;
		width :50px;
		text-align:left;
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
	