package net.jwstm.DBCPDemo;

import java.io.InputStream;
import javax.sql.DataSource;
import java.util.Properties;
import org.apache.tomcat.dbcp.dbcp2.BasicDataSourceFactory;

public class DbcpDemo {
	public static DataSource ds = null;
	static {
		//新建一个配置文件对象
		Properties prop = new Properties();
		try {
			//通过类加载器找到文件路径，读取配置文件内容
			InputStream in = new DbcpDemo().getClass().getClassLoader().getResourceAsStream("dbcpconfig.properties");
			//将配置文件内容以输入流的方式加载到配置文件对象
			prop.load(in);
			//创建数据源对象
			ds = BasicDataSourceFactory.createDataSource(prop);
		} catch (Exception e) {
			throw new ExceptionInInitializerError(e);
		}
	}
}
