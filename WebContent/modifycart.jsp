<jsp:useBean id="workm" scope="page" class="opendb.opendb" />

<%@ page session="true" import="java.util.*,java.sql.*,online_bookshop.Book"%>

<%
	Vector<Book> buylist=(Vector<Book>) session.getValue("shoppingcart");//使用向量类作为购物车的变量类型
	String bookid=request.getParameter("ProID");
	Integer my=new Integer(0);
	for (int i=0;i<buylist.size();i++)
	{
		Book book=(Book)buylist.elementAt(i);
		book.setQuantity((new Integer(request.getParameter("N"+my.toString(i)))).intValue());
		buylist.setElementAt(book,i);
	}
	for (int i=0;i<buylist.size();i++)
	{
		Book book= (Book)buylist.elementAt(i);
		if (book.getQuantity()==0) 
			buylist.removeElementAt(i);
	}
	session.putValue("shoppingcart",buylist);
%>
<script language="javascript">
  self.location="check.jsp"
 </script>
