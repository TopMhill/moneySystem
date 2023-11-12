<%@ page contentType="text/html; charset=utf-8" %> <%--这里的utf-8是指服务器发送给客服端时的内容编码 --%>

<%@ page pageEncoding="utf-8"%> <%--这里的utf-8是指 .jsp文件本身的内容编码 --%>
<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>
<%@ page import="java.sql.*,person.person"%>

<html>
<head>
<title>通过JSP打开数据表</title>
<style>
div ul {
    list-style: none; /* 取消列表项默认点 */
    text-align: center; /* 居中文本 */
}

div ul li {
    display: inline; /* 将列表项显示为行内元素，以便居中显示 */
    margin: 0 10px; /* 调整列表项之间的间距 */
}

div ul li a {
    text-decoration: none; /* 移除链接的下划线 */
}

</style>
</head>


<body>

  <jsp:include page="getuser.jsp"/>
  <center>
<div>
    <ul>
        <li><a href="czy_add.jsp">添加员工</a></li><br/>
        <li><a href="czy_update.jsp">修改员工信息</a></li><br/>
        <li><a href="czy_delete.jsp">删除/取消删除员工</a></li><br/>
        <li><a href="index.jsp">返回首页</a></li>
    </ul>
</div>

</center>

</body>
</html>