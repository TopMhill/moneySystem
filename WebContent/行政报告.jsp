<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@include file="行政报告db.jsp"%>
<html>
<head>
    <title>创建行政报告</title>
    <!-- loaded on <%= (new java.util.Date()).toLocaleString() %> -->
    <%
    
        request.setCharacterEncoding("utf-8");//设置传输方式的编码

        //获取名字列表
        stmt = conn.createStatement();
        sql = "SELECT DISTINCT name FROM employee";
        //out.println(sql);
        rs = stmt.executeQuery(sql);

        List<String> nameList = new ArrayList<>(); // 使用ArrayList来存储项目ID

        while (rs.next()) {
            nameList.add(rs.getString("name"));
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
        <option value="年初至今的工资">年初至今的工资</option>
    </select><br>
    <div id="名字下拉框">
        <label for="name">名字：</label>
        <select id="name"></select>
        <br>
    </div>


    <label for="开始日期">开始日期：</label>
    <input type="date" id="开始日期"><br>
    <label for="结束日期">结束日期：</label>
    <input type="date" id="结束日期"><br>



    <button id="generate-report" onclick="generateReport()">创建行政报告</button>
    <button id="out-report" onclick="exportToExcel('报告')">保存行政报告</button>
</div>

<div id="printdiv">
 
    <!-- 报告 -->
 
</div>
</center>
<script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>
<script>


    const selectContent = document.getElementById("报告类型");
    const nameDropdown = document.getElementById("名字下拉框");
    const nameSelect = document.getElementById("name");
    const datePicker1 = document.getElementById("开始日期");
    const datePicker2 = document.getElementById("结束日期");


    //赋值getname
    function getnames() {
        var names=new Array;
        <% for(int i = 0;i< nameList.size();i++) { %>
            names[<%=i%>]="<%=nameList.get(i)%>";
        <% } %>
        return names;
    }
    //显示名字
        const names = getnames();
        nameSelect.innerHTML = "";
        names.forEach(name => {
            const option = document.createElement("option");
            option.value = name;
            option.text = name;
            nameSelect.appendChild(option);
        });

    
    //获取报告按钮被单击
    function generateReport() {
        // 创建要发送的数据，这是一个包含参数的字符串
        if(document.getElementById("name").value=="") {alert("没有被选择的员工！");return;}
        var data = "name="+document.getElementById("name").value;
        if (datePicker2.value==""||datePicker1.value==""||datePicker2.value<datePicker1.value) {
            alert("日期选择不合法，请重新选择");
            return;
        }
        data += '&date1=' + datePicker1.value + "&date2=" + datePicker2.value;

        if(document.getElementById("报告类型").value=="总工作时数")
        {
            data += '&reportType=1';
        }
        else if(document.getElementById("报告类型").value=="年初至今的工资")
        {
            data += '&reportType=2';
        }
        else{
            alert("请检查参数选择！");
            return;
        }

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "行政报告预览.jsp", true);
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
        var fileName = prompt('请输入文件名(.xlsx)', '行政报告');
        if(fileName==null) return;
        XLSX.writeFile(wb, fileName+'.xlsx');
    }
    

</script>
</body>
</html>