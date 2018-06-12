<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>显示所有学生信息</title>
</head>
<body>
	<jsp:useBean id="bc" class="net.jwstm.JavaBeanDemo.mybeans.BeanConnect"></jsp:useBean>
	<%
		String sql = "select * from studentinfo";
		ResultSet rs = bc.select(sql);
	%>
	<table border=1>
		<caption>学生信息表</caption>
		<tr>
			<th>学号</th>
			<th>姓名</th>
			<th>性别</th>
			<th>系部</th>
		</tr>
		<%
			//输出信息		
			while (rs.next()) {
				out.println("<tr>");
				out.println("<td>" + rs.getString(1) + "</td>");
				out.println("<td>" + rs.getString(2) + "</td>");
				out.println("<td>" + rs.getString(3) + "</td>");
				out.println("<td>" + rs.getString(4) + "</td>");
				out.println("</tr>");
			}
		%>
	</table>
	<%
		rs.close();
		bc.release();
	%>

</body>
</html>