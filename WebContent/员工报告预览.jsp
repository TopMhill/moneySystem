<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.text.*" %>

<%@include file="员工报告db.jsp"%>
<html>
<head>
    <title>员工报告预览</title>

    <!-- loaded on <%= (new java.util.Date()).toLocaleString() %> -->
    <%
    
        request.setCharacterEncoding("utf-8");//设置传输方式的编码

        String employeeId = (String) request.getParameter("employeeId");
        String projectId = (String) request.getParameter("projectId");
        String name = (String) request.getParameter("name");
        String type = (String) request.getParameter("type");//hourly,commissioned,salaried
        String date1 =(String) request.getParameter("date1");
        String date2 =(String) request.getParameter("date2");
        String reportType =(String) request.getParameter("reportType");

        SimpleDateFormat longFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        SimpleDateFormat shortFormat = new SimpleDateFormat("yyyy-MM-dd");

        //String employeeId="1";
        //String projectId="1";
        //String name="haha";
        //String type="salaried";
        //String date1="2023-09-01";
        //String date2="2023-10-03";
        java.util.Date tmpdate01 = shortFormat.parse(date1);
        java.util.Date tmpdate02 = shortFormat.parse(date2);
        String date01=longFormat.format(tmpdate01);
        String date02=longFormat.format(tmpdate02);

        //String reportType="3";



        LocalDateTime currentTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");


    %>
</head>
<body>
	<center>
    <table id="报告" border="1">
    <tr>
        <th bgcolor=#D3D3D3 >报告类型</th>
        <td >
        <%
        if(reportType.equals("1")) out.println("总工作时数");
        else if(reportType.equals("2")) out.println("项目总工作时数");
        else if(reportType.equals("3")) out.println("假期/病假");
        else if(reportType.equals("4")) out.println("年度至今总工资");
        else out.println(reportType);
        %></td>
        </tr>        
        <tr>
        <th bgcolor=#D3D3D3 >员工姓名</th>
        <td ><%= name%></td>
        </tr>
        <tr>
        <th bgcolor=#D3D3D3 >员工类型</th>
        <td ><%= type%></td>
        </tr>
        <tr>
        <th bgcolor=#D3D3D3 >开始日期</th>
        <td  id="开始日期项"><%=date1%></td>
        </tr>
        <tr>
        <th bgcolor=#D3D3D3 >结束日期</th>
        <td  id="结束日期项"><%=date2%></td>
        </tr>        
        <%
        if(reportType.equals("1")){
            String sql1 = "SELECT id FROM worktimecard WHERE employee_id = "+employeeId;
            String sql2 = "SELECT SUM(time_long) AS total_time_long FROM workcard_days WHERE worktimecard_id = ? AND number_of_day BETWEEN ? AND ?";
            PreparedStatement stmt1 = conn.prepareStatement(sql1);
            ResultSet rs1 = stmt1.executeQuery(sql1);

            int totalTimeLong = 0;

            while (rs1.next()) {
                String worktimecardId = rs1.getString("id");

                PreparedStatement stmt2 = conn.prepareStatement(sql2);
                stmt2.setString(1, worktimecardId);
                stmt2.setString(2, date01);
                stmt2.setString(3, date02);
                ResultSet rs2 = stmt2.executeQuery();

                while (rs2.next()) {
                    totalTimeLong += rs2.getInt("total_time_long");
                }
            }
            out.println("<tr><th bgcolor=#D3D3D3 >总工作时数</th>");
            out.println("<td >"+totalTimeLong+"</td></tr>");
   
        }else if(reportType.equals("2")){
            String sql1 = "SELECT id FROM worktimecard WHERE employee_id = "+employeeId ;
            String sql2 = "SELECT SUM(time_long) AS total_time_long FROM workcard_days WHERE project_id="+projectId+"";
            		//"and worktimecard_id = ? AND number_of_day BETWEEN ? AND ?";
            sql2=sql2+" and worktimecard_id = ";
            String sqlpre2=sql2;
            PreparedStatement stmt1 = conn.prepareStatement(sql1);
            ResultSet rs1 = stmt1.executeQuery(sql1);

            int totalTimeLong = 0;

            while (rs1.next()) {
                String worktimecardId = rs1.getString("id");
                //System.out.println(worktimecardId+" "+projectId);

                sql2=sql2+worktimecardId+" and number_of_day between ";
                sql2=sql2+date01+" and ";
                sql2=sql2+date02;

                PreparedStatement stmt2 = conn.prepareStatement(sql2);
               	System.out.println(sql2);
               	sql2=sqlpre2;
                //stmt2.setString(1, worktimecardId);
                ///stmt2.setString(2, date01);
                //stmt2.setString(3, date02);
                ResultSet rs2 = stmt2.executeQuery();

                while (rs2.next()) {
                	System.out.println(totalTimeLong);
                    totalTimeLong += rs2.getInt("total_time_long");
                }
            }
            out.println("<tr><th bgcolor=#D3D3D3 >项目编号</th>");
            out.println("<td >"+projectId+"</td></tr>");
            out.println("<tr><th bgcolor=#D3D3D3 >项目总工作时数</th>");
            out.println("<td >"+totalTimeLong+"</td></tr>");
        }else if(reportType.equals("3")){
            String sql1 = "SELECT start_date,end_date FROM leave_record WHERE employee_id = "+employeeId+" AND end_date BETWEEN ? AND ?";
            PreparedStatement stmt1 = conn.prepareStatement(sql1);
            stmt1.setString(1, date01);
            stmt1.setString(2, date02);
            ResultSet rs1 = stmt1.executeQuery();
            out.println("<tr><th bgcolor=#D3D3D3 >假期/病假</th><td>");
            while (rs1.next()) {
                
                java.util.Date tmpdate1 = longFormat.parse(rs1.getString("start_date"));
                String stdate = shortFormat.format(tmpdate1);
                java.util.Date tmpdate2 = longFormat.parse(rs1.getString("end_date"));
                String enddate = shortFormat.format(tmpdate2);

                out.println("<li>"+stdate+" ~ "+enddate+"</li>");
            }
            out.println("</td></tr>");
        }else if(reportType.equals("4")){
            String sql1 = "SELECT salary FROM payroll WHERE employee_id = "+employeeId+" AND end_date BETWEEN ? AND ?";
            PreparedStatement stmt1 = conn.prepareStatement(sql1);
            stmt1.setString(1, date01);
            stmt1.setString(2, date02);
            ResultSet rs1 = stmt1.executeQuery();

            int totalSalary= 0;

            while (rs1.next()) {
                totalSalary += rs1.getInt("salary");
            }
            out.println("<tr><th bgcolor=#D3D3D3 >年度至今总工资</th>");
            out.println("<td >"+totalSalary+"</td></tr>");
        }
        else 
        %>

        <tr>
            <td id="创建时间" colspan="2">创建时间：<%=currentTime.format(formatter)%></td>
        </tr>    

    </table>
   	</center>
</body>
</html>