package usercase;
import Time.DateInfo;
import java.io.FileInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDType0Font;


import opendb.opendb;

/**
 * Servlet implementation class changemoneyway
 */
@WebServlet("/getPDF")
public class getPDF extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getPDF() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    RequestDispatcher dispatcher =null;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    public void getaPDF(String starttime,String endtime,double money,String name)
    {
    	//System.out.print("print:::"+name);
    	try {
            PDDocument document = new PDDocument();
            PDPage page = new PDPage(PDRectangle.A4);
            document.addPage(page);

            PDPageContentStream contentStream = new PDPageContentStream(document, page);
            String absolutePath = "D:\\sts-workbench\\online_bookshop\\WebContent\\cnstyle\\cnstyle.ttf";
            absolutePath="cnstyle.ttf";
            String relativePath = "/cnstyle.ttf";
            InputStream fontStream = getServletContext().getResourceAsStream(relativePath);

            //File file = new File(absolutePath);
            //InputStream fontStream = new FileInputStream(file);
            // 从字体文件创建自定义字体
            //InputStream fontStream = getPDF.class.getResourceAsStream("./cnstyle.ttf");
            DateInfo startdate=new DateInfo(starttime);
            DateInfo enddate=new DateInfo(endtime);

            PDType0Font customFont = PDType0Font.load(document, fontStream);
            
            // 设置自定义字体
            contentStream.setFont(customFont, 12);
            
            contentStream.beginText();
            contentStream.newLineAtOffset(50, 700);
            contentStream.showText("工资支付单");
            contentStream.newLineAtOffset(0, -20);
            contentStream.showText("收款人: "+name);
            contentStream.newLineAtOffset(0, -20);
            contentStream.showText("起始日期: "+startdate.getformatstr());
            contentStream.newLineAtOffset(0, -20);
            contentStream.showText("截至日期: "+enddate.getformatstr());
            contentStream.newLineAtOffset(0, -20);
            contentStream.showText("金额: "+money +"元");
            contentStream.endText();
            
            contentStream.close();

            document.save("./salary_payment.pdf");//("D:\\sts-workbench\\online_bookshop\\WebContent\\salary_payment.pdf");
            document.close();

            System.out.println("PDF已生成并保存为 salary_payment.pdf");

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
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
		String idstr = request.getParameter("id");
		String name = request.getParameter("name");
		//System.out.println("print:"+name);
		int id= Integer.parseInt(idstr);
		String sql="select * from payroll where id='"+id+"'";
		ResultSet rs=mydb.executeQuery(sql);
		//System.out.println(sql);
		String start=null,end=null,money=null;
		try
		{
			rs.next();
		}catch(Exception e) {e.printStackTrace();}
		try {
			start=rs.getString("start_date");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			end=rs.getString("end_date");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			Double numofmoney=rs.getDouble("salary");
	        DecimalFormat decimalFormat = new DecimalFormat("0.00");
			money=decimalFormat.format(numofmoney);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		double moneydouble=Double.parseDouble(money);
		//String name=request.getParameter("name");
		
		getaPDF(start,end,moneydouble,name);
		String filePath = "./salary_payment.pdf";//"D:\\sts-workbench\\online_bookshop\\WebContent\\salary_payment.pdf";  // 替换为实际文件路径

        // 设置响应头，告诉浏览器要下载文件

		response.setHeader("Content-Disposition", "attachment; filename=" + filePath);

        // 读取文件并写入响应输出流
        java.io.FileInputStream fileInputStream = new java.io.FileInputStream(filePath);
        int i;
        while ((i = fileInputStream.read()) != -1) {
            out.write(i);
        }
        fileInputStream.close();
        out.close();

		response.sendRedirect("getpreorder.jsp");
		//String money=request.getParameter("money");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
