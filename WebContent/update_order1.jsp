<%@ page import="java.sql.*,person.person,java.util.*,java.io.*,java.text.*"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%--
	除了insert , update , delete 之外，还可以进行create操作
--%>
<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>
<%--
--
 <jsp:include page="getuser.jsp"/>
--
--%>
<%@ page contentType="text/html; charset=utf-8" %> <%--这里的utf-8是指服务器发送给客服端时的内容编码 --%>
<%@ page pageEncoding="utf-8"%> <%--这里的utf-8是指 .jsp文件本身的内容编码 --%>
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
<%}%>

	</td>
		<td class="right"><a class="no_line" href="登录界面.jsp">登录</a></td>
		<td class="right"><a class="no_line" href="找回密码.jsp">密保</a></td>
		<!--<li class="right"><a class="no_line" href="注册界面.jsp">注册</a></li>-->
		<td class="right"><a class="no_line" href="index.jsp">首页</a></td>
</tr>  
</table>
	</div>


    <div class="login_box">
		<h3 class="title">修改订单</h3>
			
<%    
ResultSet rs;
int oid = Integer.parseInt(request.getParameter("order_id"));
String Sql="select  * from purchase_order where id = '"+oid+"' and commissioned_employee_id ='"+u.getId()+"'";
rs = workm.executeQuery(Sql);
request.getSession().setAttribute("oid", oid);
if(!rs.next()){
    session.setAttribute("error_message","您不能操作不存在或不是您申请创建的订单" );
    %>
    <jsp:forward page="errorpage.jsp" />
		<%

};
%>
<form method="post"  action="update_order2.jsp" >
   <table>
   <!-- 
		<p style="text-align:center">客户联络点：<%= rs.getString("customer_point_of_contact") %></p>
		<p style="text-align:center">客户账单地址：<%= rs.getString("customer_billing_address") %></p>
		<p style="text-align:center">购买的产品：<%= rs.getString("products_purchases") %></p>
		<p style="text-align:center">日期：<%= rs.getString("date") %></p>
		<p style="text-align:center">金额：<%= rs.getString("money") %></p>
		-->
    <tr>
        <td><input class="input_box" type="text" value=<%= rs.getString("customer_point_of_contact") %> name="order_point"></td>
      </tr>
          <tr> <td><p align="center" >客户联络点</p></td></tr>
      <tr>
        <td><input class="input_box" type="text" value=<%=rs.getString("customer_billing_address") %> name="order_address"></td>
      </tr>
      <tr> 
        <td><p align="center" >客户账单地址</p></td>
      </tr>
      <tr>
        <td><input class="input_box" type="text" value=<%=rs.getString("products_purchases") %> name="order_purchases"></td>
      </tr>
      <tr> 
        <td><p align="center" >购买的产品</p></td>
      </tr>
	  
  <tr>
    <td><input class="input_box" type="text" value=<%=rs.getString("money")%> name="order_money"></td>
  </tr>
	  <tr> 
		<td><p align="center" >金额</p></td>
	   <tr>
        <td align="center">
        
       <%  if(rs.getString("state").equals("unsubmit"))
		{
		%>
      <input class="button_box" class="button_box" type="submit" value="确认修改">
       <%
		}
		else
		{
			out.println("<p align='center'>该订单已经提交！</p>");
		}
  %>
	</td>
  </tr>
 
  </table>
  </form>
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
}
	</style>
	</body>
	</html>