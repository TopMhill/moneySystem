<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page session="true" import="java.util.*,java.sql.*,online_bookshop.Book"%>

<%
	Vector<Book> buylist=(Vector<Book>) session.getValue("shoppingcart");//ʹ����������Ϊ���ﳵ�ı�������
	for (int i=buylist.size()-1;i>=0;i--)
	{
		buylist.removeElementAt(i);
	}
	session.putValue("shoppingcart",buylist);
%>
<h3> ���Ѿ�������Ĺ���!��ӭ������ѡ��.</h3>
<form>
<input type="button" value="��������" name="b2" onclick="window.close()">
</form>


