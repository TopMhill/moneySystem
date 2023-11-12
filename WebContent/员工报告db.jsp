<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");//设置传输方式的编码
    //定义变量
    String DBDRIVER = "com.mysql.cj.jdbc.Driver";
    String DBURL = "jdbc:mysql://hillweb.cn:3306/pubdb?serverTimezone=Asia/Shanghai";
    String username="user";
    String pwd="123456";
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    String sql = null;
    
    try{
        Class.forName(DBDRIVER);//加载JDBC驱动
        conn = DriverManager.getConnection(DBURL,username,pwd);//创建数据库连接
    }
    catch(Exception e){
        //out.println("数据库驱动程序加载失败！！！" + e + "<br>");
        out.println("数据库连接失败！！！" + e + "<br>");
    }
%>