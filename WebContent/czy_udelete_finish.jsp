<%@ page contentType="text/html; charset=utf-8" %> <%--这里的utf-8是指服务器发送给客服端时的内容编码 --%>

<%@ page pageEncoding="utf-8"%> <%--这里的utf-8是指 .jsp文件本身的内容编码 --%>
<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>
<%@ page import="java.sql.*,person.person"%>

<html>
<head>
<title>取消删除成功</title>
</head>
<li><a class="no_line" href="czy_delete.jsp">返回取消删除界面</a></li>
<body>

 <%  
        try {          
                Statement stmt = null;  
                ResultSet rs = null;
                String ud_id=request.getParameter("d_uid");
                // Execute a simple SQL query
                String sql;
                sql="UPDATE employee SET state = 'normal' WHERE id = '"+ud_id+"'";
                System.out.println(sql);                
                workm.executeUpdate(sql);
        }
 catch(Exception e)
 {e.printStackTrace();}
%>   
</body>
</html>