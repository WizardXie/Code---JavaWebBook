package net.jwstm.JavaBeanDemo.mybeans;

import java.sql.*;

public class BeanConnect {
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	// 该方法用于获取数据库连接
	public Connection getConnection() throws SQLException, ClassNotFoundException {
		// 定义字符串,表示驱动,数据库地址,用户名和密码
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/testdb";
		String username = "root";
		String password = "12345678";
		// 加载数据库JDBC驱动
		Class.forName(driver);
		// 创建数据库的连接
		conn = DriverManager.getConnection(url, username, password);
		return conn;
	}

	// 该方法用于执行查询语句，并返回查询结果
	public ResultSet select(String sql) throws Exception {
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (Exception e) {
			throw new Exception("查询条件有误" + e.getMessage());
		}
		return rs;
	}

	// 该方法根据参数不同，可用于增加、修改或删除指定学生信息
	public void executeSQL(String sql) throws Exception {
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			throw new Exception(e.getMessage());
		} finally {
			stmt.close();
			conn.close();
		}
	}

	// 该方法用于释放资源
	public void release() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
