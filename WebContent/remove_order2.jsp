<%@ page import="java.sql.*,person.person,java.util.*,java.io.*,java.text.*"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%--
	除了insert , update , delete 之外，还可以进行create操作
--%>
<%--
--
 <jsp:include page="getuser.jsp"/>
--
--%>
<%@ page contentType="text/html; charset=utf-8" %> <%--这里的utf-8是指服务器发送给客服端时的内容编码 --%>
<%@ page pageEncoding="utf-8"%> <%--这里的utf-8是指 .jsp文件本身的内容编码 --%>

<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>
<html>
	<head>
		<title>网站 </title>
		
	</head>
	<body >


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
<%
request.setCharacterEncoding("UTF-8");
person u=(person)session.getAttribute("user");
if(u == null){
%>
<jsp:forward page = "首页.jsp"></jsp:forward>
<%}%>

<div class="mytest" style="width:100%">
<table width=100%>
<tr >
	<td class="left"><%
//person u=(person)session.getAttribute("user");
if(u==null)
{
	out.print("<a onmouseover='show_it() 'href=\"登录界面.jsp\">请登录</a>");
}
else
{
out.print("	<a href=''  onmouseover='show_it()' id='base_mes'>");
out.print("用户:"+u.getname()+"</a>");

%>
	<div id="use" onmouseleave="close_it()">
	<table>

	
	<tr><td>
		<a href='selfmes.jsp' >个人信息</a>
	
	</td>
	</tr>
	
<%if(u.getuserType().equals("administor")){%>
	<tr><td><a href='guanli.jsp'>管理</a></td></tr>
	<tr><td><a href='add1.jsp'>增类</a></td></tr>
	<tr><td><a href='add2.jsp'>增书</a></td></tr>
	<%}%>
		
	<tr><td><a href='findorders.jsp'>订单</a></td></tr>
	<tr><td><a href="exist.jsp">注销</a></td></tr>
	</table>
	</div>
<%} %>

	</td>
		<td class="right"><a class="no_line" href="登录界面.jsp">登录</a></td>
		<td class="right"><a class="no_line" href="找回密码.jsp">密保</a></td>
		<!--<li class="right"><a class="no_line" href="注册界面.jsp">注册</a></li>-->
		<td class="right"><a class="no_line" href="index.jsp">首页</a></td>
</tr>  
</table>
	</div>


    <div class="login_box">
		<h1 class="title">删除成功</h1>
			
<%
	int oid = (Integer)session.getAttribute("oid");
    String Sql = "delete from purchase_order " + "where id = " + oid;
	
    workm.executeUpdate(Sql);
%>
		</div>
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
}
	</style>
    </body>
</html>