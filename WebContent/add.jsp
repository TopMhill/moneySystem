<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<jsp useBean id="work" scope="page" class="opendb.opendb"/>
<%@ page session="true" import="java.util.*,java.sql.*,online_bookshop.Book"%>

<%
	String bookid=request.getParameter("BookID");  //获得产品编号
	if (bookid==null)  //如果产品编号为空，直接转到查看购物车
	{
%>
	<script language="javascript">
	self.location="check.jsp"
	</script>
<%
	}
	Vector<Book> buylist=(Vector<Book>) session.getValue("shoppingcart");//使用向量类作为购物车的变量类型
	Boolean match=false;  //所选的书是否已经在购物车里
	System.out.println("bookid"+bookid);
	Book myBook=new Book(bookid); //调用Bean 来获得特定编号的书的详细信息

	if (buylist==null)  //购物车第一次使用
	{
		buylist=new Vector<Book>();
		buylist.addElement(myBook);
	}
	else //不是第一次使用
	{
		for (int i=0;i<buylist.size();i++)  //判断所选书是否已在购物车里
		{
			Book book=(Book) buylist.elementAt(i);
			if (book.getbookid().equals(myBook.getbookid()))//已在,数量增加
			{
				book.setQuantity(book.getQuantity()+myBook.getQuantity());
				buylist.setElementAt(book,i);
				match=true;
			}
		}
		if (!match) //没有重复的书，直接增加
			buylist.addElement(myBook);
	}
	session.putValue("shoppingcart",buylist);//更新session变量
%>
	<script language="javascript"> //转到查看购物车
	self.location="check.jsp"
	</script>

