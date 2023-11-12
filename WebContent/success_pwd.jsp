<!DOCTYPE html>
<meta charset="utf-8">
<%@ page contentType="text/html; charset=utf-8" %> <%--这里的utf-8是指服务器发送给客服端时的内容编码 --%>

<%@ page pageEncoding="utf-8"%> <%--这里的utf-8是指 .jsp文件本身的内容编码 --%>

<html>
	<head>
		<title>网站 </title>
		
	</head>
	<body >
	<jsp:include page="getuser.jsp"/>
	<h1 align="center">密码修改完成</h1>
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