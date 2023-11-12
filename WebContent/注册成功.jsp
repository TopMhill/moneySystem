<%@ page contentType="text/html; charset=utf-8" %> <%--这里的utf-8是指服务器发送给客服端时的内容编码 --%>

<%@ page pageEncoding="utf-8"%> <%--这里的utf-8是指 .jsp文件本身的内容编码 --%>



<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>
<html>
	<head>
		<title>网站 </title>
		
	</head>
	<body >
<%@ page import="java.sql.*,person.person"%>
<%--@ page import="com.mysql.jdbc.Driver"--%>
<%--
	除了insert , update , delete 之外，还可以进行create操作
--%>
<jsp:include page="getuser.jsp"/>

<%
	// 1、加载驱动程序

		   ResultSet rs;
		   String name=request.getParameter("username");
		   String one_username=request.getParameter("one_username");
		String pass=request.getParameter("password");
		String poi[]=request.getParameterValues("poit");
		String mail=request.getParameter("mail");
		String age=request.getParameter("age");
		String phone=request.getParameter("phone");

		String cus_phone=request.getParameter("cus_phone");

		boolean poi_flag;
		//out.print(poi[0]);
		if(poi[0].equals("administor"))
		{
			poi_flag=true;
		}
		else 
		{
			poi_flag=false;
		}
	//	out.print(name);
	//	name=name.replace(" ","");
     String sql="select * from user where username='"+name+"'";
     rs=workm.executeQuery(sql);
	 boolean is_exit_flag=false;
     if(rs!=null&&rs.next())
	 {
	//	 out.print(rs.getString(1));
         is_exit_flag=true;
     }
     if(rs!=null)
	 rs.close();
	%>
	
	<% 
	try
	{
    // conn.close();
		if(!is_exit_flag)
		
		{
			
			if(poi_flag)
				sql = "insert into user values(null,'" + name + "','" +  pass + "','" +"administor"+ "','"+mail+"')";  
			else 
				sql = "insert into user values(null,'" + name + "','" +  pass + "','" +"customer"+"','"+mail+ "')";  
		 	workm.executeUpdate(sql);
		 	sql="select pk from user where username='"+name+"'";
		 	//out.print("1");
		 	rs=workm.executeQuery(sql);
		 	rs.next();
		 	
		 	//out.print("1");
		 	int number = rs.getInt("pk");
		 //	out.print(number);
			if(poi_flag)
			sql = "insert into administor values('" + number + "','" +  age + "','" +one_username+"','"+phone+ "')";  
			else
			sql = "insert into customer values('" + number + "','" +  cus_phone + "','" +one_username+"','"+0+ "')";  
			//out.print("1");
			workm.executeUpdate(sql);
			//out.print("1");
			out.print("<br/><h1 align='center'>"+name);
			out.print(" "+"您的身份是");
			if(poi_flag)
				out.println("管理员</h1>");
			else 
				out.println("顾客</h1>");
		out.println("<br/><h1 align='center'>"+"注册完成");
		}
		else 
		{
			out.println("<br/><h1 align='center'>"+"账号已存在");
		}
		
	
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
%>
</div>
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