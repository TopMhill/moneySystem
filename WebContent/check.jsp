<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page session="true" import="java.util.*,online_bookshop.Book"%>

<%
	Vector<Book> buylist=(Vector<Book>) session.getAttribute("shoppingcart");//ʹ����������Ϊ���ﳵ�ı�������
	if (buylist!=null && (buylist.size()>0))
	{
%>
	<html>
	<script language="javascript">
		function goon()  //��������
		{
			window.close();
		}

		function jiezhang() //����
		{
			window.open("checkout.jsp");
			window.close();
		}

		function winconfirm()
		{
			result=confirm("ȷ��Ҫ��չ��ﳵ�");
			if (result!="0")
				window.location="clear.jsp";
		}
	</script>
	<head>
	<title>�ҵĹ��ﳵ</title>
	</head>
	
	<body bgcolor="#FFFFFF" link=darkorchid vlink=darkorchid alink=blue>

	<h3>��������Ĺ��ﳵ</h3>
	<hr width=90% size=1>
	<form action=modifycart.jsp id="cartform" method="post" name="CartForm">
	<input type=hidden id=texNum value=<%=buylist.size()%>>
	<table border="1" cellpadding="0" width="500" bgcolor="#FFFFFF">
		<tr>
			<td width="116">
			<div align="center">
			<b> ����</b>
			</div>
		    </td>
			
			<td width="111">
			<div align="center">
			<b> ����</b>
			</div>
		    </td>

			<td width="120">
			<div align="center">
			<b> ����</b>
			</div>
		    </td>

			<td width="133">
			<div align="center">
			<b> ��������</b>
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
			<td colspan="4">�ܼ�:<%=ff%></td>
		</tr>
	</table>
	<hr width=90% size=1>
	<br>
	
	<input id="recompute" name="recompute" type=submit value="��������">
	<input type="button" value="��������" name="b2" onclick="goon()">
	<input type="button" value="����" name="b3" onclick="jiezhang()">
	<input type="button" value="��չ��ﳵ" name="b2" onclick="winconfirm()">
    </form>
	<br>
	<hr width=90% size=1>
	
	<%
	}
	else
	{
	%>
	
	<P>���ﳵΪ��</p>
	<input type="button" value="��������" name="b2" onclick="window.close()">
	
	<%
	}
	%>

	</body>
	</html>

