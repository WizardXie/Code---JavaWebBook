<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>录入成绩</title>
</head>
<body>
输入学生的姓名和考核成绩
<form action="inputScores.jsp" method="POST">
	姓名：<input type="text" name="name"><br>
	成绩：<input type="text" name="score"><br>
	<input type="submit" value="添加">&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="reset" value="重置">
</form>
<hr>
<jsp:useBean id="bc" class="net.jwstm.Statistics.beans.ConnectDB"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");
	String score=request.getParameter("score");
	if ((name != null &&  score!= null) && (name.equals("") || score.equals(""))) {
		out.println("<font color=\"red\">请输入姓名和成绩，这是必填信息</font><br><hr>");
	} else if (name != null && score != null) {
		String sql = "insert into score values('" + name + "','" + Integer.parseInt(score) + "')";
		try {
			bc.executeSQL(sql);
		} catch (Exception e) {
			out.println("<font color=\"red\">输入信息有误，可能会覆盖现有数据，请检查后重新输入</font><br><hr>");
		}
	}
	//创建包含sql语句的字符串
			String sql = "select * from score";
			//执行SQL语句并获取执行结果
			ResultSet rs = bc.select(sql);
			//显示取出来的信息
		%>
		<table border=1>
			<caption>学生成绩表</caption>
			<tr>
				<th>姓名</th>
				<th>成绩</th>
			</tr>
			<%
				//输出信息		
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>" + rs.getString(1) + "</td>");
					out.println("<td>" + rs.getString(2) + "</td>");
					out.println("</tr>");
				}
			%>
		</table>
		<%
			//关闭连接
			rs.close();
		%>
<a href="count.jsp">点击本链接可以查看统计信息</a>
</body>
</html>