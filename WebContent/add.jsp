<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<jsp useBean id="work" scope="page" class="opendb.opendb"/>
<%@ page session="true" import="java.util.*,java.sql.*,online_bookshop.Book"%>

<%
	String bookid=request.getParameter("BookID");  //��ò�Ʒ���
	if (bookid==null)  //�����Ʒ���Ϊ�գ�ֱ��ת���鿴���ﳵ
	{
%>
	<script language="javascript">
	self.location="check.jsp"
	</script>
<%
	}
	Vector<Book> buylist=(Vector<Book>) session.getValue("shoppingcart");//ʹ����������Ϊ���ﳵ�ı�������
	Boolean match=false;  //��ѡ�����Ƿ��Ѿ��ڹ��ﳵ��
	System.out.println("bookid"+bookid);
	Book myBook=new Book(bookid); //����Bean ������ض���ŵ������ϸ��Ϣ

	if (buylist==null)  //���ﳵ��һ��ʹ��
	{
		buylist=new Vector<Book>();
		buylist.addElement(myBook);
	}
	else //���ǵ�һ��ʹ��
	{
		for (int i=0;i<buylist.size();i++)  //�ж���ѡ���Ƿ����ڹ��ﳵ��
		{
			Book book=(Book) buylist.elementAt(i);
			if (book.getbookid().equals(myBook.getbookid()))//����,��������
			{
				book.setQuantity(book.getQuantity()+myBook.getQuantity());
				buylist.setElementAt(book,i);
				match=true;
			}
		}
		if (!match) //û���ظ����飬ֱ������
			buylist.addElement(myBook);
	}
	session.putValue("shoppingcart",buylist);//����session����
%>
	<script language="javascript"> //ת���鿴���ﳵ
	self.location="check.jsp"
	</script>

