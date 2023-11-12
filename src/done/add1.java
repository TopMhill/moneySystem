package done;

import java.io.IOException;
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
@WebServlet("/add1")
public class add1 extends HttpServlet {
	   private RequestDispatcher dispatcher = null;
	   
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public add1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		opendb mydb=new opendb();
		response.setCharacterEncoding("UTF-8");
		//设置浏览器默认打开的时候采用的字符集
		response.setHeader("Content-Type","text/html;charset=UTF-8");

		PrintWriter out = response.getWriter();//.append("Served at: ").append(request.getContextPath());
		String anss="";
		String leibie1=request.getParameter("leibie");
		String sql="";
		sql="insert into catalog (CatalogID,Catalogname) values(null,+'"+leibie1+"'"+")";
		mydb.executeUpdate(sql);
		out.print(anss);

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
