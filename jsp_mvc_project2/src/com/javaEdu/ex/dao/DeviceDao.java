package com.javaEdu.ex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javaEdu.ex.dto.DeviceDto;

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
	
	public void regist(String dId, String dGroup, String dModel, String ownerId) {
		
		Connection con = null;
		PreparedStatement ps = null;
		String dState = "Normal";
		
		try {
			con = dataSource.getConnection();
			String query = "insert into DEVICES (dId, dGroup, dState, dModel, memberId) values (?,?,?,?,?)";
			ps = con.prepareStatement(query);
			ps.setString(1, dId);
			ps.setString(2, dGroup);
			ps.setString(3, dState);
			ps.setString(4, dModel);
			ps.setString(5, ownerId);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null) ps.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	public String search(String dId) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			String query = "select * from devices where dId = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, dId);
			rs = ps.executeQuery();
			if(rs.next()) {
				String ownerId = rs.getString("ownerId");
				return ownerId;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return null;
	}
}
