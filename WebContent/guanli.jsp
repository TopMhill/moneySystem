
    <%@ page contentType="text/html; charset=utf-8" %> <%--这里的utf-8是指服务器发送给客服端时的内容编码 --%>

<%@ page pageEncoding="utf-8"%> <%--这里的utf-8是指 .jsp文件本身的内容编码 --%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

		<jsp:include page="getuser.jsp"/><br/>
<div align="center">
	<form method="post" id="mkforid"  action="change">
		<tr>
    <td><input class="input_box"align="center" type="text"id="username" name="username" onblur="login_username_check()"placeholder="账号"></td>
  </tr>
  	<tr> <td><p id="sername"align="center" name="Username" >输入账号</p></td></tr>
  <tr>
  
    <td>
		<input class="input_box" type="text" align="center" placeholder="充值金额"  name="number"></td>
  </tr>
  	<tr> <td><p id="number1"align="center" name="num" >充值金额</p></td></tr>
  
  	
  <tr>
	<td>
  <input class="button_box" type="submit" value="充值">
			
	</td>
  </tr>
	</form>
	</div>
</body>
</html>