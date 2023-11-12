package usercase;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import opendb.opendb;

/**
 * Servlet implementation class changemoneyway
 */
@WebServlet("/changemoneyway")
public class changemoneyway extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changemoneyway() {
        super();
        // TODO Auto-generated constructor stub
    }

    RequestDispatcher dispatcher =null;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();//.append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		//response.setCharacterEncoding("UTF-8");
		//设置浏览器默认打开的时候采用的字符集
		//response.setHeader("Content-Type","text/html;charset=UTF-8");
		opendb mydb=new opendb();
		response.setCharacterEncoding("UTF-8");
		//设置浏览器默认打开的时候采用的字符集
		//response.setHeader("Content-Type","text/html;charset=UTF-8");
		String name = request.getParameter("username");
		String type = request.getParameter("poit");
		String sql=null;
		if(type.equals("mail"))
		{
			String mail_address=request.getParameter("mail_addr");
			sql="update employee set payment_method='"+type+"',mail='"+mail_address+"' where name='"+name+"'";
			System.out.println(sql);
		}
		else if(type.equals("bank"))
		{
			String bank_name=request.getParameter("bank_name");
			String bank_id=request.getParameter("bank_id");
			sql="update employee set payment_method='"+type+"' ,bank_id='"+bank_id+"' ,bank_name='"+bank_name+"' where name='"+name+"'";
		}
		else 
		{
			sql="update employee set payment_method='"+type+"' where name='"+name+"'";
		}
		System.out.println(sql);
		String sql1="select * from employee where name ='"+name+"'";
		ResultSet rs=mydb.executeQuery(sql1);
		HttpSession session = request.getSession();
		try {
			if(rs==null||!rs.next())
			{
				session.setAttribute("error_message", "，账号输入错误！");
				response.sendRedirect("./errorpage.jsp");
				//dispatcher = request.getRequestDispatcher("/errorpage.jsp");
			    //dispatcher.forward(request, response);
			}
			else 
			{
				mydb.executeUpdate(sql);
				response.sendRedirect("./index.jsp");
				//dispatcher = request.getRequestDispatcher("/index.jsp");
			    //dispatcher.forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
