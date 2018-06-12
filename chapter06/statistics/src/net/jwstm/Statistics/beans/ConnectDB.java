package net.jwstm.Statistics.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectDB {
	public ConnectDB() {
		
	}
	//该方法用于获取数据库连接
		public Connection getConnection() throws SQLException,ClassNotFoundException {
			Connection conn=null;
			//定义字符串,表示驱动,数据库地址,用户名和密码
			String driver = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/testdb";
			String username = "root";
			String password = "12345678";
			//加载数据库JDBC驱动
			Class.forName(driver);
			//创建数据库的连接
			conn = DriverManager.getConnection(url, username, password);
			return conn;
		}
		
		//该方法用于执行查询语句，并返回查询结果
		public ResultSet select(String sql) throws Exception {
			Connection conn=null;
			Statement stmt=null;
			ResultSet rs=null;
			try {  
	            conn = getConnection();
	            stmt = conn.createStatement();
	            rs = stmt.executeQuery(sql);
	        } catch (Exception e) {  
	        	throw new Exception("查询条件有误"+e.getMessage());
	        }
			return rs;
		}
		
		//该方法根据参数不同，可用于增加、修改或删除指定学生信息
		public void executeSQL(String sql) throws Exception {
			Connection conn=null;
			Statement stmt=null;
			try {
				conn=getConnection();
				stmt=conn.createStatement();
				stmt.executeUpdate(sql);
			}catch (SQLException e) {
				throw new Exception(e.getMessage());
			}finally {
				stmt.close();
				conn.close();
			}
		}
}
