<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page session="true" import="java.util.*,online_bookshop.Book"%>

<%
	Vector<Book> buylist=(Vector<Book>) session.getAttribute("shoppingcart");//使用向量类作为购物车的变量类型
	if (buylist!=null && (buylist.size()>0))
	{
%>
	<html>
	<script language="javascript">
		function goon()  //继续购买
		{
			window.close();
		}

		function jiezhang() //结帐
		{
			window.open("checkout.jsp");
			window.close();
		}

		function winconfirm()
		{
			result=confirm("确认要清空购物车嘛？");
			if (result!="0")
				window.location="clear.jsp";
		}
	</script>
	<head>
	<title>我的购物车</title>
	</head>
	
	<body bgcolor="#FFFFFF" link=darkorchid vlink=darkorchid alink=blue>

	<h3>这里是你的购物车</h3>
	<hr width=90% size=1>
	<form action=modifycart.jsp id="cartform" method="post" name="CartForm">
	<input type=hidden id=texNum value=<%=buylist.size()%>>
	<table border="1" cellpadding="0" width="500" bgcolor="#FFFFFF">
		<tr>
			<td width="116">
			<div align="center">
			<b> 书名</b>
			</div>
		    </td>
			
			<td width="111">
			<div align="center">
			<b> 作者</b>
			</div>
		    </td>

			<td width="120">
			<div align="center">
			<b> 单价</b>
			</div>
		    </td>

			<td width="133">
			<div align="center">
			<b> 购买数量</b>
			</div>
		    </td>
		</tr>
		
		<%
			float ff=0;
			for (int index=0;index<buylist.size();index++)
			{
				Book anOrder=(Book) buylist.elementAt(index);
				ff=ff+anOrder.getQuantity()*anOrder.getPrice();
		%>
		<tr>
			<td width="116">
			<div align="center">
			<b> <%=anOrder.getbookname()%></b>
			</div>
		    </td>

			<td width="111">
			<div align="center">
			<b> <%=anOrder.getauthor()%></b>
			</div>
		    </td>

			<td width="120">
			<div align="center">
			<b> <%=anOrder.getPrice()%></b>
			</div>
		    </td>
			
			<td width="133">
			<div align="center">
			<b>
			<input type="text" name="N<%=index%>" value="<%=anOrder.getQuantity()%>" size="8">
			</b>
			</div>
		    </td>
		</tr>
		
		<%
			}
		%>
		
		<tr>
			<td colspan="4">总计:<%=ff%></td>
		</tr>
	</table>
	<hr width=90% size=1>
	<br>
	
	<input id="recompute" name="recompute" type=submit value="更改数量">
	<input type="button" value="继续购买" name="b2" onclick="goon()">
	<input type="button" value="结帐" name="b3" onclick="jiezhang()">
	<input type="button" value="清空购物车" name="b2" onclick="winconfirm()">
    </form>
	<br>
	<hr width=90% size=1>
	
	<%
	}
	else
	{
	%>
	
	<P>购物车为空</p>
	<input type="button" value="继续购买" name="b2" onclick="window.close()">
	
	<%
	}
	%>

	</body>
	</html>

