<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<meta charset="utf-8">
<html>
	<head>
		<title>学习网站 </title>
		
	</head>
	<body >
	<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<%--@ page import="com.mysql.jdbc.Driver"--%>
<h1>使用Statement进行数据库更新操作</h1>
<%--
	除了insert , update , delete 之外，还可以进行create操作
--%>
	<p><img src="shangbiao.jpg" height="50px" width= 100%></p>
	<b align="center" valign="center"> Welcome to Study Web!    学习网站</b>
		
	<ul class="mytest">
		<li class="right"><a class="no_line" href="xyz">文件</a></li>
		<li class="right"><a class="no_line" href="xyz">班级</a></li>
		<li class="right"><a class="no_line" href="登陆界面.html">登录</a></li>
		<li class="right"><a class="no_line" href="注册界面.html">注册</a></li>
		<li class="right"><a class="no_line" href="首页.html">首页</a></li>
</ul>  
	<?php 
	
	out.print( "注册成功!");
	?>
<style type="text/css">
	#page_one{text-indent:0em;}
	no_line {text-decoration: none;}
	a{text-decoration: none;}
*{
margain:0px;
		font-family:"楷体";
	text-indent:0em;
		
	}
	#left_pic
	{
		float:left;
		height:100px;
		widtt:50px;
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
		height: 2000px;
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
</style>
	</body>
</html>