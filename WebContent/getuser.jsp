<%@ page import="java.sql.*,person.person"%>
<%@ page contentType="text/html; charset=UTF-8" %> <%--这里的utf-8是指服务器发送给客服端时的内容编码 --%>

<%@ page pageEncoding="UTF-8"%> <%--这里的utf-8是指 .jsp文件本身的内容编码 --%>
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
<div class="mytest" style="width:100%">
<table width=100%>
<tr >
	<td class="left"><%
person u=(person)session.getAttribute("user");
	//u.getuserType();
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
<%
if(u!=null&&u.getuserType().equals("administor")){%>
	<tr><td><a href='czy_main.jsp'>员工管理</a></td></tr>
	<tr><td><a href='makevacation.jsp'>假期管理</a></td></tr>
	<tr><td><a href='行政报告.jsp'>行政报告</td></tr>
	<tr><td><a href='添加管理员.jsp'>增加管理人员</td></tr>
	<!-- <tr><td><a href='exit.jsp'>注销</td></tr>-->
	<%
	}
	else if(u!=null) {
	%>		
	
	<tr><td><a href='changemoneytype.jsp'>管理支付方式</a></td></tr>
	
	<tr><td><a href="员工报告.jsp">员工报告</a></td></tr>
	<% if(u.gettype().equals("commissioned"))
		{
		%>
		<tr><td> <a href="order_operate.jsp">订单管理</a></td></tr>
		<%} 
		else
		{
		%>
		<tr><td> <a href="工时卡.jsp">工时卡管理</a></td></tr>
		<%
			
		}
		%>
		
	<%if(u.getpayment_method().equals("bank")){}else { %>
	<tr><td><a href="getpreorder.jsp">工资单管理</a></td></tr>	
	<%} %>
	<%} %>
	
	
	<tr><td><a href="exit.jsp">注销</a></td></tr>
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
	<style type="text/css">

#big_b{position:relative;}
	#base_mes{color:white;position:relative;}
	div#use{display:none;top:50px;height:100px;width:300px;position:absolute;}
	#page_one{text-indent:0em;}
	*{
		font-family:"楷体";
		
		
	}	
	#exit :link
	{
		color : white;
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
	background-image:url('back1.jpg');
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
	.mytest {
    text-align: left; /* 文本左对齐 */
    background-color: #333; /* 更高级的背景颜色 */
    color: #fff; /* 文本颜色为白色 */
    padding: 10px 0; /* 顶部栏目的内边距 */
    /* 添加其他样式属性以适应你的项目需求 */
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
	