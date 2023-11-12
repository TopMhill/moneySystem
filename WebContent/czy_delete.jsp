<%@ page contentType="text/html; charset=utf-8" %> <%--这里的utf-8是指服务器发送给客服端时的内容编码 --%>

<%@ page pageEncoding="utf-8"%> <%--这里的utf-8是指 .jsp文件本身的内容编码 --%>
<%@ page import="java.sql.*,java.time.LocalDateTime,java.time.format.DateTimeFormatter,java.io.FileWriter,
java.io.FileReader,java.io.BufferedReader,java.io.IOException,java.util.*,java.text.*,person.person,Time.DateInfo" %>
<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>
<!DOCTYPE html>
<meta charset="utf-8">
<html>
	<head>
		<title>删除员工界面 </title>		
	</head>
	<body >	
<script type="text/javascript">
</script>
		<jsp:include page="getuser.jsp"/>
		<div class="login_box">
		<h3 class="title">删除员工</h3>

<form method="post" id="e_delete"  action="czy_delete_finish.jsp" >
   <table>
  <!--   <td><input class="input_box" type="text" id="d_id" placeholder="请输入你要删除的员工ID" name="d_id" ></td>
    -->
    </tr>  
  <%
   	String sql="select * from employee where state='normal'";
   ResultSet rs=workm.executeQuery(sql);
   	List<Integer> ids=new ArrayList<Integer>();
   while(rs.next())
   {
		ids.add(rs.getInt("id"));   
   }
   
   %>
   <tr>
   <td>
   <select id ="eid" class="input_box" type="text" placeholder="员工编号" name="d_id">
			<% for (int prof : ids) { %>
	      		<option value="<%= prof %>"><%= prof %></option>
	    	<% } %>
		</select>
		
   </td>
   </tr>
  	<tr><td><center><label for="eid">员工编号</label></center></td></tr>
  
  <tr>
	<td>
  <input class="button_box" type="submit"  value="删除">
	</td>
  </tr> 
  </table>
  </form>
  
  <form method="post" id="e_udelete"  action="czy_udelete_finish.jsp" >
   <table>
   <%
   	sql="select * from employee where state='delete'";
   rs=workm.executeQuery(sql);
   	ids=new ArrayList<Integer>();
   while(rs.next())
   {
		ids.add(rs.getInt("id"));   
   }
   
   %>
   <tr>
   <td>
   <select id ="did" class="input_box" type="text" placeholder="员工编号" name="d_uid">
			<% for (int prof : ids) { %>
	      		<option value="<%= prof %>"><%= prof %></option>
	    	<% } %>
		</select>
		
   </td>
   </tr>
   <tr><td><center><label for="did">已删除员工号</label></center></td></tr>
   <!-- <tr>
    <td><input class="input_box" type="text" id="ud_id" placeholder="请输入你要取消删除的员工ID" name="ud_id" ></td>
    </tr>  
  -->
  <tr>
	<td>
  <input class="button_box" type="submit"  value="取消删除">
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
			background:url("back.jpg") no-repeat;
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
		height: 20px;
		padding-left: 10px;
		margin-top: 10px;
		margin-left: 50px;
	}
	.title {
		text-align: center;
		font-size: 20px;
		color: #000;
		margin-top: 10px;
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
		height: 40px;
		margin-top: 20px;
		margin-left: 50px;
		border-radius: 5px;
		background-color: #12564a;
		cursor: pointer;
		color: #fff;
	.login_box {
		width: 400px;
		height: 800px;
		background-color: #fff;
		margin: auto;
		margin-top: 250px;
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