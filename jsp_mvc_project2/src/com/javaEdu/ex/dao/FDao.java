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
			String query = "insert into find_board (num, image, model, area, title, contents, findornot) values "
					+ "(find_board_seq.nextval, ?, ?, ?, ?, ?, ?)";
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
			
			String query = "select num, image, model, rdate, area, title, contents, findornot from find_board order by num desc";
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
				String findornot = rs.getString("findornot");
				
				FDto dto = new FDto(num, image, model, rdate, area, title, contents, findornot);
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

	public FDto contentView(int intNum) {
		// TODO Auto-generated method stub

//		upHit(strID);
		FDto dto = null;
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select * from find_board where num = ?";
			ps = con.prepareStatement(query);
			ps.setInt(1, intNum);
			rs = ps.executeQuery();
			if (rs.next()) {
				int num = rs.getInt("num");
				String image = rs.getString("image");
				String model = rs.getString("model");
				Timestamp rdate = rs.getTimestamp("rdate");
				String area = rs.getString("area");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String findornot = rs.getString("findornot");
				
				dto = new FDto(num, image, model, rdate, area, title, contents, findornot);
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
				e2.printStackTrace();
			}
		}
		return dto;
	}
	
	public void delete (String num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			
			con = dataSource.getConnection();
			String query = "delete from find_board where num = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(num));
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
	}
}
