
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%//使用opendb Bean%>
<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<style>
	td{font-size:10pt}
	.tabletitle{color:black;font-size:10pt;line-height:18pt}
	a:link {text-decoration:none}
	a:visited {text-decoration:none}
	a:hover {text-decoration:underline}
</style>
<title>图书超市</title>
<meta name="generator" content="microsoft frontpage 3.0">
</head>

<script language=javascript>
	function addtoshoppingcart(spid)	
	{
		var url;
		var newwin;
		url="add.jsp?BookID="+spid;
		newwin=window.open(url,'gouwuche','refresh=1 resizable=1,scrollbars=1,status=no,toolbar=no,location=no,menu=no,width=600,height=400');
	}
</script>

<script ID="ClientEventHandlersJS" language=javascript>


	function Search_onclick() 
	{
		if (document.all("txtKeyword").values=="")
		{
			alert("请输入查询关键字");
			return false;
		}
		return true;
	}
</script>
<body>
<jsp:include page="getuser.jsp"/><br/>
<div align="center">
<table border="0" cellspacing="0" cellpadding="0" width="760" align="center">
	<tr>
	 	<td width="100%">
			<div align="center">
		
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td width="82%" align="left" valign="top" >
					<div align="center">
			
					<table border="0" cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td width="75%" align="left" valign="top">
							<div align="center">
						
							<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<form method="post" action="search.jsp">
							<tr>
								<br>
								<td width="100%" valign="middle" align="left" height="19">
								<div align="center">
		     					<p>关键字
								<input type="text" name="txtKeyword" size="12">类别
								<select name="select">
                                <%
									String cata="Select * from catalog ";;
									ResultSet rs=workm.executeQuery(cata);
									while(rs.next()){
									
								%>
								<option value="<%out.print(rs.getString("catalogID"));%>"
								selected>
								<%out.print(rs.getString("catalogName"));%>
								</option>
								<%
									}
									rs.close();
								%>
								</select>
								<input type="submit" name="submit" value="go">
								</p><hr>
								<p>查询结果</p>
								</div>
								</td>
							</tr>
							</form>
							<tr>
								<td width="100%">
								<div align="center">
								
								<table width="100%" border="1" cellspacing="0" cellpadding="0" align="center" height="15">
									<tr>
										<td><div align="center">编号</div></td>
										<td><div align="center">书名</div></td>
										<td><div align="center">价格</div></td>
										<td><div align="center">作者</div></td>
										<td><div align="center">购买选择</div></td>
									</tr>

									<%
										String name=request.getParameter("txtKeyword");
										String select=request.getParameter("select");
										String mysql;
										if (select==null)
										{
											name="'%"+name+"%'";
											mysql="select * from Book where Bookname like "+name;
											//out.print(name);
										}
										else
										{
											name="'%"+name+"%'";
											//out.print(name);
											mysql="select * from Book where Bookname like "+ name +"and fatherid="+select;
										}
										ResultSet rs1=workm.executeQuery(mysql);
										while (rs1.next())
										{
									%>
									<tr>
										<td>
										<div align="center">
										<%
											String myid=rs1.getString("BookID");
											String myid1=myid.trim();
											out.print(myid1);
										%>
										</td>
										<td>
										<div align="center">
										<%
											out.print(rs1.getString("BookName"));
										%>
										</div>
										</td>
										
										<td>
										<div align="center">
										<%
											out.print(rs1.getString("price"));
										%>
										</div>
										</td>
										<td>
										<div align="center">
										<%
											out.print(rs1.getString("author"));
										%>
										</div>
										</td>
										<td>
										<div align="center">
										<a href="#" onclick=addtoshoppingcart("<%		out.print(rs1.getString("BookID"));%>")>
										<img src="gouwu.jpg" width="34" height="33" border="0">
										</a>
										</div>
										</td>
									</tr>
									<%
										}
										rs1.close();
									%>
									</table>

									</div>
								</td>
							</tr>
						</table>

						</div>
					</td>
				</tr>
			</table>

			</div>
		</td>
	</tr>
	<tr>
		<td width="100%">
		<hr noshade color="#008000">
		</td>
	</tr>
</table>

</div>
</td>
</tr>
</table>
</div>
</body>
</html>

