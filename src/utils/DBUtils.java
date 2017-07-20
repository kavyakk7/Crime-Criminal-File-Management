package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtils {
	public static Connection con = null;
	public static Statement stmt = null;
	public static PreparedStatement pst = null;
	public static ResultSet rs = null;

	public static Connection getConnection(String dbName, String username, String password) {
		String url = "jdbc:mysql://localhost:3307/crime_info";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, "root", "root");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

	public static Statement getStatement() {
		try {
			stmt = con.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stmt;
	}

	public static PreparedStatement getPreparedStatement(String sql) {
		try {
			pst = con.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pst;
	}

	public static void closeResources() {
		try {
			if (rs != null)
				rs.close();
			if (pst != null)
				pst.close();
			if (stmt != null)
				stmt.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
