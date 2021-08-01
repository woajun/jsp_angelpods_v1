package com.javaEdu.ex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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
	
	public int write(String image, String model, String latitude, String longitude, String addr, String addrDetail, String title, String contents, String writerId, String deviceId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		//TODO findornot 값 정의
		String findOrNot = "NORMAL";
		
		//TODO 쭌 : select와 insert를 함께 사용해서 트랜잭션으로 문제 생길 수 있고 해답은 to 트랜잭션 공부할 것
		int num = -1;
		try {
			con = dataSource.getConnection();
			String sqlIdentifier = "select FIND_BOARD_SEQ.NEXTVAL from dual";
			pstmt = con.prepareStatement(sqlIdentifier);
			ResultSet rsNum = pstmt.executeQuery();
			if (rsNum.next()) {
				num = rsNum.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		try {
			con = dataSource.getConnection();
			String query = "insert into find_board (num, image, model, latitude, longitude, addr, addrDetail, title, contents, findornot, writerId, deviceId) values "
					+ "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setString(2, image);
			pstmt.setString(3, model);
			pstmt.setString(4, latitude);
			pstmt.setString(5, longitude);
			pstmt.setString(6, addr);
			pstmt.setString(7, addrDetail);
			pstmt.setString(8, title);
			pstmt.setString(9, contents);
			pstmt.setString(10, findOrNot);
			pstmt.setString(11, writerId);
			pstmt.setString(12, deviceId);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return num;
	}
	
	public ArrayList<FDto> list() {
		ArrayList<FDto> dtos = new ArrayList <FDto>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select num, image, model, rdate, latitude, longitude, addr, addrDetail, title, contents, findornot, writerId, deviceId from find_board order by num desc";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int num = rs.getInt("num");
				String image = rs.getString("image");
				String model = rs.getString("model");
				Timestamp rdate = rs.getTimestamp("rdate");
				String latitude = rs.getString("latitude");
				String longitude = rs.getString("longitude");
				String addr = rs.getString("addr");
				String addrDetail = rs.getString("addrDetail");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String findornot = rs.getString("findornot");
				String writerId = rs.getString("writerId");
				String deviceId = rs.getString("deviceId");
				
				FDto dto = new FDto(num, image, model, rdate, latitude, longitude, addr, addrDetail, title, contents, findornot, writerId, deviceId);
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
				String latitude = rs.getString("latitude");
				String longitude = rs.getString("longitude");
				String addr = rs.getString("addr");
				String addrDetail = rs.getString("addrDetail");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String findornot = rs.getString("findornot");
				String writerId = rs.getString("writerId");
				String deviceId = rs.getString("deviceId");
				
				dto = new FDto(num, image, model, rdate, latitude, longitude, addr, addrDetail, title, contents, findornot, writerId, deviceId);
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

	public ArrayList<FDto> searchList(String[] models, String sArea, String keyword) {
		// TODO Auto-generated method stub
		
		ArrayList<FDto> dtos = new ArrayList <FDto>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select num, image, model, rdate, latitude, longitude, addr, addrDetail, title, contents, findornot, writerId, deviceId from find_board where area = ? order by num desc";
			ps = con.prepareStatement(query);
			ps.setString(1, sArea);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int num = rs.getInt("num");
				String image = rs.getString("image");
				String model = rs.getString("model");
				Timestamp rdate = rs.getTimestamp("rdate");
				String latitude = rs.getString("latitude");
				String longitude = rs.getString("area");
				String addr = rs.getString("addr");
				String addrDetail = rs.getString("addrDetail");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String findornot = rs.getString("findornot");
				String writerId = rs.getString("writerId");
				String deviceId = rs.getString("deviceId");
				
				FDto dto = new FDto(num, image, model, rdate, latitude, longitude, addr, addrDetail, title, contents, findornot, writerId, deviceId);
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

	public void setThumbnailImage(int boardNum, String imageSystemName) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = dataSource.getConnection();
			String query = "update find_board set image = ? where num = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, imageSystemName);
			pstmt.setInt(2, boardNum);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
