package done;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import opendb.opendb;
/**
 * Servlet implementation class addmoney
 */
@WebServlet("/add2")
public class add2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public add2() {
        super();
        // TODO Auto-generated constructor stub
    }

    RequestDispatcher dispatcher =null;
	/**
	 * @throws UnsupportedEncodingException 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected String tochi(String s) throws UnsupportedEncodingException
    {
    	return new String(s.getBytes("ISO-8859-1"),"utf-8");
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		//设置浏览器默认打开的时候采用的字符集
		response.setHeader("Content-Type","text/html;charset=UTF-8");
		opendb mydb=new opendb();
		response.setCharacterEncoding("UTF-8");
		//设置浏览器默认打开的时候采用的字符集
		response.setHeader("Content-Type","text/html;charset=UTF-8");

		PrintWriter out = response.getWriter();//.append("Served at: ").append(request.getContextPath());
		String anss="";
		int  leibie1=Integer.valueOf(request.getParameter("select"));
		Double  Price=Double.valueOf(request.getParameter("price"));
		String price=Price.toString();
		String author=request.getParameter("author");
		String book=request.getParameter("book");
		//book=tochi(book);
		//author=tochi(author);
		//out.print(book);
		//out.print(author);
		String sql="";
		sql="insert into Book(BookID,Bookname,author,price,fatherid) values(null,'"+book+"','"+author+"','"+price+"',"+leibie1+""+")";
		mydb.executeUpdate(sql);
		//out.print(anss);
		sql="select * from Book where Bookname='"+book+"'and author ='"+author+"'and price='"+price+"'and fatherid='"+leibie1+"'";
		ResultSet rs=mydb.executeQuery(sql);
		try {
			if(!rs.next())
			{
				dispatcher = request.getRequestDispatcher("/errorpage.jsp");
		        dispatcher.forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
