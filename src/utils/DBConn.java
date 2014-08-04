package utils;

import java.sql.*;

public class DBConn {
	
	public static Connection getConn(String conn, String usr, String pwd, String connDriver) throws Exception {
		// Class.forName("com.mysql.jdbc.Driver");
		Class.forName(connDriver);
		// Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifeboat_test","root","root");
		Connection con = DriverManager.getConnection(conn, usr, pwd);
		return con;
	}
}
