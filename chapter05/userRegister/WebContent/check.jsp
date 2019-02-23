<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>身份核查</title>
</head>
<body>
<%-- 获取注册用户信息 --%>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pass = request.getParameter("password");
		//定义表示MySQL的jdbc驱动类名的字符串	
		String driver = "com.mysql.jdbc.Driver";
		//定义表示数据库的URL的字符串，localhost为MySQL服务器的计算机名，也可以用IP地址表示，3306为访问端口
		String url = "jdbc:mysql://localhost:3306/testdb";
		//定义表示数据库用户名和密码的字符串
		String username = "root";
		String password = "12345678";
		//加载数据库JDBC驱动
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			out.println("数据库驱动出现问题，具体内容如下：");
			e.printStackTrace();
		}
		//创建网页到数据库的连接，注意：这里的Connection类来自包java.sql.Connection
		Connection conn = DriverManager.getConnection(url, username, password);
		//创建SQL语句对象
		Statement stmt = conn.createStatement();
		String sql="select * from users where id='"+id+"'";
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()){
			String pass2=rs.getString(2);
			if(pass.equals(pass2)){
				response.sendRedirect("Success.jsp");
				session.setAttribute("login", "true");
				session.setAttribute("id", id);
			}else{
				response.sendRedirect("Fail.jsp");
			}
		}else{
			response.sendRedirect("Fail.jsp");
		}
		%>
</body>
</html>