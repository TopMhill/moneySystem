package done;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import opendb.opendb;
/**
 * Servlet implementation class addmoney
 */
@WebServlet("/change")
public class addmoney extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addmoney() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setCharacterEncoding("UTF-8");
		//���������Ĭ�ϴ򿪵�ʱ����õ��ַ���
		response.setHeader("Content-Type","text/html;charset=UTF-8");

		PrintWriter out = response.getWriter();//.append("Served at: ").append(request.getContextPath());
		String username=request.getParameter("username");
		opendb mydb=new opendb();
		String sql="select * from customer where pk="
				+ " (select pk from user where username='"+username+"')";
		ResultSet rs=mydb.executeQuery(sql);
		boolean flag=true;
		String anss="";
		anss+="<ul>	"
			//	+ "		<li class='right'><a class='no_line' href='��¼����.jsp'>��¼</a></li>"
			//	+ "<li class='right'><a class='no_line' href='�һ�����.jsp'>�ܱ�</a></li><li class='right'>"
			//	+ "<a class='no_line' href='ע�����.jsp'>ע��</a></li><li class='right'>"
				+ "<li><a class='no_line' href='index.jsp'>��ҳ</a></li></ul>  ";
		anss+="<br/>";
		try {
			if(!rs.next())
			{
				anss+="<h1 align='center'>�޴��û����ֵ����������</h1>";
			}
			else 
			{
				int money=rs.getInt("account");
				//out.print(money);
				int b=Integer.valueOf(request.getParameter("number"));
				//out.print(money);
				//money
				if(b<=0)
				{throw new Exception();}
				money+=b;
				sql="UPDATE CUSTOMER SET account = "+money+""+" WHERE pk =  (select pk from user where username='"+username+"')";;
				mydb.executeUpdate(sql);
				anss+="<h1 align='center'>��ֵ�ɹ�</h1>";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			anss+="<h1 align='center'>�޴��û����ֵ����������</h1>";
		}
		out.print(anss);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
