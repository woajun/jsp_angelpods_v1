package com.javaEdu.ex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javaEdu.ex.dto.BDto;
import com.javaEdu.ex.dto.FDto;

public class FDao {
	
	DataSource dataSource;
	
	private static FDao instance = new FDao();
	
	private FDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static FDao getInstance() {
		return instance;
	}
	
	public void write(String image, String model, String area, String title, String contents) {
		Connection con = null;
		PreparedStatement ps = null;
		String findOrNot = "NORMAL";
		
		try {
			con = dataSource.getConnection();
			String query = "insert into find_board (num, image, model, area, title, contents, comments, findornot) values "
					+ "(find_board_seq.nextval, ?, ?, ?, ?, ?, 0, ?)";
			ps = con.prepareStatement(query);
			ps.setString(1, image);
			ps.setString(2, model);
			ps.setString(3, area);
			ps.setString(4, title);
			ps.setString(5, contents);
			ps.setString(6, findOrNot);
			ps.executeUpdate();
			
		} catch(Exception e) {
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
	
	public ArrayList<FDto> list() {
		ArrayList<FDto> dtos = new ArrayList <FDto>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select num, image, model, rdate, area, title, contents, comments, findornot from find_board order by num desc";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int num = rs.getInt("num");
				String image = rs.getString("image");
				String model = rs.getString("model");
				Timestamp rdate = rs.getTimestamp("rdate");
				String area = rs.getString("area");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				int comments = rs.getInt("comments");
				String findornot = rs.getString("findornot");
				
				FDto dto = new FDto(num, image, model, rdate, area, title, contents, comments, findornot);
				dtos.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dtos;
	}
}
