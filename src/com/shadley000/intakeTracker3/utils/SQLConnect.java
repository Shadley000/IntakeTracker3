package com.shadley000.intakeTracker3.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SQLConnect {
	// init database constants

	private static final String DATABASE_DRIVER = "com.mysql.jdbc.Driver";
	private static final String DATABASE_URL = "jdbc:mysql://localhost:3306/intaketracker";
	// private static final String DATABASE_URL =
	// "jdbc:mysql://a4alarms.ccbaz5k8ib32.us-east-2.rds.amazonaws.com:3306/a4alarms";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "0verl00k";

	public SQLConnect() {
		try {
			Class.forName(DATABASE_DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	// connect database
	public Connection getConnection() throws SQLException {
		return DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);

	}

	public static void main(String args[]) {
		System.out.println("database test");
		SQLConnect mySQLConnect = new SQLConnect();
		try {
			Connection connection = mySQLConnect.getConnection();
			System.out.println(connection.toString());

			String sql = "show tables";
			PreparedStatement stmt;
			stmt = connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				System.out.println(rs.getString(1));
			}

			System.out.println("statement executed");
			connection.close();
			
		} catch (SQLException ex) {
			Logger.getLogger(SQLConnect.class.getName()).log(Level.SEVERE, null, ex);
		}
		System.out.println("database test completed");

	}
}
