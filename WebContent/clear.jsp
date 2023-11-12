<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page session="true" import="java.util.*,java.sql.*,online_bookshop.Book"%>

<%
	Vector<Book> buylist=(Vector<Book>) session.getValue("shoppingcart");//使用向量类作为购物车的变量类型
	for (int i=buylist.size()-1;i>=0;i--)
	{
		buylist.removeElementAt(i);
	}
	session.putValue("shoppingcart",buylist);
%>
<h3> 您已经清空您的购物!欢迎您重新选购.</h3>
<form>
<input type="button" value="继续购买" name="b2" onclick="window.close()">
</form>


