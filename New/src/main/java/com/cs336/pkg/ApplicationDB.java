package com.cs336.pkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ApplicationDB {
	private String TravelDB;
	private String InputDB;
	
	public ApplicationDB(){
//		local host port number is subject to change depending on MySQL configurations
//		VVV jdbc:mysql://localhost:[Port Number]/[SQL FILENAME] VVV
		this.TravelDB = "jdbc:mysql://localhost:3006/travelReservationSystem";
		this.InputDB = "jdbc:mysql://localhost:3006/travelReservationSystem";
//		this.InputDB = "jdbc:mysql://localhost:3006/Inputs";
	}

	public Connection getConnection(String Ref){
		
		Connection connection = null;
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (InstantiationException e) {
			
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
		try {
			
			connection = DriverManager.getConnection(Ref,"root", "1A3Am6tR4kW*97$");
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return connection;
		
	}
	
	public void closeConnection(Connection connection){
		try {
			connection.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
	
	public String getInputDB() { return InputDB; }
	public String getTravelDB() { return TravelDB; }
	
	
	public static void main(String[] args) {
		
		ApplicationDB dao = new ApplicationDB();
		Connection connection = dao.getConnection(dao.getInputDB());
		
		System.out.println(connection);		
		dao.closeConnection(connection);
		
		ApplicationDB daoTravel = new ApplicationDB();
		Connection connection2 = daoTravel.getConnection(daoTravel.getTravelDB());
		
		System.out.println(connection2);		
		dao.closeConnection(connection2);
	}
	
	

}
