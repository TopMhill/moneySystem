<%@ page contentType="text/html; charset=utf-8" %> <%--这里的utf-8是指服务器发送给客服端时的内容编码 --%>

<%@ page pageEncoding="utf-8"%> <%--这里的utf-8是指 .jsp文件本身的内容编码 --%>

<!DOCTYPE html>
<meta charset="utf-8">
<html>
	<head>
		<title>添加员工界面 </title>		
	</head>
	<body >	
<script type="text/javascript">

</script>
		<jsp:include page="getuser.jsp"/>
		<div class="login_box">
		<h3 class="title">添加员工</h3>
			
<form method="post" id="e_add"  action="czy_add_in.jsp" accept-charset="utf-8">
   <table>
   <tr>
      员工类型：<input type="radio"  name="e_type" value="salaried">salaried
   <input type="radio"  name="e_type" value="commissioned">commissioned
   <input type="radio"  name="e_type" value="hourly">hourly
   </tr>
	
  <tr>
    <td><input class="input_box" type="text" id="e_name" placeholder="名字" name="e_name" ></td>
    </tr>
   
  <tr>   
  <td><input class="input_box" type="e_mailing_address" placeholder="通讯地址" name="e_mailing_address"></td>
  </tr>
  
  <tr> 
  <td><input class="input_box" type="e_social_security_number" placeholder="社会保障号码" name="e_social_security_number"></td>
  </tr>
  
  <tr> 
  <td><input class="input_box" type="e_standard_tax_deductions" placeholder="标准税收减免" name="e_standard_tax_deductions"></td>
  </tr>
  
  <tr> 
  <td><input class="input_box" type="e_other_deductions" placeholder="其它扣除" name="e_other_deductions"></td>
  </tr>
  
  <tr> 
  <td><input class="input_box" type="e_phone_number" placeholder="电话号码" name="e_phone_number"></td>
  </tr>
  
  <tr> 
  <td><input class="input_box" type="e_hourly_rate" placeholder="时薪" name="e_hourly_rate"></td>
  </tr>
  
  <tr> 
  <td><input class="input_box" type="e_salary" placeholder="薪资" name="e_salary"></td>
  </tr>
  
  <tr> 
  <td><input class="input_box" type="e_commission_rate" placeholder="佣金率" name="e_commission_rate"></td>
  </tr>
  
  <tr> 
  <td><input class="input_box" type="e_hour_limit" placeholder="工时限制" name="e_hour_limit"></td>
  </tr>
  <tr> 
  <td><input class="input_box" type="e_hour_limit" placeholder="电子邮箱" name="email"></td>
  </tr>  

  
  <tr>
	<td>
  <input class="button_box" type="submit" value=" 添加">
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
		height: 600px;
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