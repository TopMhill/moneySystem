<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@include file="员工报告db.jsp"%>
<%@ page import="java.sql.*,person.person"%>
<jsp:useBean id="workm" scope="page" class="opendb.opendb"/>
<html>
<head>
    <title>创建员工报告</title>
    <!-- loaded on <%= (new java.util.Date()).toLocaleString() %> -->
    <%
    
        request.setCharacterEncoding("utf-8");//设置传输方式的编码

        person user=(person)session.getAttribute("user");
        //这里需要改为由person的属性赋值
        String employeeId = String.valueOf(user.getId());
        String name = user.getname();
        String type = user.gettype();

        //获取employeeid的项目id
        stmt = conn.createStatement();
        sql = "SELECT DISTINCT project_id FROM worktimecard natural join workcard_days WHERE employee_id = '"+employeeId+"'";
        //out.println(sql);
        rs = stmt.executeQuery(sql);

        List<String> projectIdList = new ArrayList<>(); // 使用ArrayList来存储项目ID

        while (rs.next()) {
            projectIdList.add(rs.getString("project_id"));
        }
        rs.close();
        stmt.close();
    %>
</head>
<body>

<jsp:include page="getuser.jsp"/>
<center>
<div>
    <label for="报告类型">报告类型：</label>
    <select id="报告类型">
        <option value="总工作时数">总工作时数</option>
        <option value="项目总工作时数">项目总工作时数</option>
        <option value="假期/病假">假期/病假</option>
        <option value="年度至今总工资">年度至今总工资</option>
    </select><br>
    <div id="项目编号下拉框" style="display: none;">
        <label for="projectId">项目编号：</label>
        <select id="projectId"></select>
        <br>
    </div>


    <label for="开始日期">开始日期：</label>
    <input type="date" id="开始日期"><br>
    <label for="结束日期">结束日期：</label>
    <input type="date" id="结束日期"><br>



    <button id="generate-report" onclick="generateReport()">创建员工报告</button>
    <button id="out-report" onclick="exportToExcel('报告')">保存员工报告</button>
</div>
</center>
<div id="printdiv">
 
    <!-- 报告 -->
 
</div>

<script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>
<script>

    const employeeId = "<%=employeeId%>";
    const name = "<%=name%>";
    const type = "<%=type%>";


    const selectContent = document.getElementById("报告类型");
    const projectIdDropdown = document.getElementById("项目编号下拉框");
    const projectIdSelect = document.getElementById("projectId");
    const datePicker1 = document.getElementById("开始日期");
    const datePicker2 = document.getElementById("结束日期");


    //赋值getprojectId
    function getprojectIds() {
        var projectIds=new Array;
        <% for(int i = 0;i< projectIdList.size();i++) { %>
            projectIds[<%=i%>]=" <%=projectIdList.get(i)%> ";
        <% } %>
        return projectIds;
    }
    //第二个被选中时
    selectContent.addEventListener("change", function() {
        if (selectContent.value === "项目总工作时数") {
            projectIdDropdown.style.display = "block";
            const projectIds = getprojectIds();
            projectIdSelect.innerHTML = "";
            projectIds.forEach(projectId => {
                const option = document.createElement("option");
                option.value = projectId;
                option.text = projectId;
                projectIdSelect.appendChild(option);
            });
        } else {
            projectIdDropdown.style.display = "none";
        }
    });

    
    //获取报告按钮被单击
    function generateReport() {
        // 创建要发送的数据，这是一个包含参数的字符串
        var data = "employeeId="+employeeId+"&name="+name+"&type="+type;
        if (datePicker2.value==""||datePicker1.value==""||datePicker2.value<datePicker1.value) {
            alert("日期选择不合法，请重新选择");
            return;
        }
        data += '&date1=' + datePicker1.value + "&date2=" + datePicker2.value;

        if(document.getElementById("报告类型").value=="总工作时数")
        {
            data += '&reportType=1';
        }
        else if(document.getElementById("报告类型").value=="项目总工作时数")
        {
            if(document.getElementById("projectId").value==""){
                alert("未查询到您参与的项目编号！");
                return;
            }
            if(type == "commissioned") {alert("您的员工身份为：commissioned，无法查询此类型报告");return;}
            data += '&reportType=2';
            data += '&projectId='+document.getElementById("projectId").value;
        }
        else if(document.getElementById("报告类型").value=="假期/病假")
        {
            if(type == "commissioned") {alert("您的员工身份为：commissioned，无法查询此类型报告");return;}
            data += '&reportType=3';
        }
        else if(document.getElementById("报告类型").value=="年度至今总工资")
        {
            if(type == "commissioned") {alert("您的员工身份为：commissioned，无法查询此类型报告");return;}
            data += '&reportType=4';
        }else{
            alert("请检查参数选择！");
            return;
        }

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "员工报告预览.jsp", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        // 指定当请求完成时要执行的回调函数
        xhr.onload = function() {
            if (xhr.status >= 200 && xhr.status < 300) {
                // 请求成功，可以在这里处理服务器响应
                document.getElementById('printdiv').innerHTML = xhr.responseText;
            } else {
                // 请求失败，处理错误
                console.error('请求失败');
                console.error(data);
            }
        };

        // 发送请求
        xhr.send(data);
    }
    
    //打印table
    function exportToExcel(tableId) {
        var table = document.getElementById(tableId);
        var wb = XLSX.utils.table_to_book(table);
        var fileName = prompt('请输入文件名(.xlsx)', '员工报告');
        if(fileName==null) return;
        XLSX.writeFile(wb, fileName+'.xlsx');
    }
    

</script>
</body>
</html>