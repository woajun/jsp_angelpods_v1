package com.javaEdu.ex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DeviceDao {

	private static DeviceDao instance = new DeviceDao();
	
	DataSource dataSource;
	
	public static DeviceDao getInstance() {
		return instance;
	}
	
	public DeviceDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void regist(String dId, String dGroup, String dModel, String memberId) {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String dState = "Normal";
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into DEVICES (dId, dGroup, dState, dModel, memberId) values (?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, dId);
			preparedStatement.setString(2, dGroup);
			preparedStatement.setString(3, dState);
			preparedStatement.setString(4, dModel);
			preparedStatement.setString(5, memberId);
			preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
