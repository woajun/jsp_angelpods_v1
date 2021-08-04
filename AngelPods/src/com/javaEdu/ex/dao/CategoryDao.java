package com.javaEdu.ex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javaEdu.ex.dto.CategoryDto;
import com.javaEdu.ex.dto.MemberDto;

public class CategoryDao {
	
	private static CategoryDao instance = new CategoryDao();
	
	private CategoryDao() {
	}
	
	public static CategoryDao getInstance(){
		return instance;
	}
	
	public MemberDto getCategory(String id) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select * from members where id = ?";
		MemberDto dto = null;
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();
			
			if(set.next()) {
				dto = new MemberDto();
				dto.setId(set.getString("id"));
				dto.setPw(set.getString("pw"));
				dto.setName(set.getString("name"));
				dto.seteMail(set.getString("eMail"));
				dto.setrDate(set.getTimestamp("rDate"));
				dto.setSido(set.getString("sido"));
				dto.setGugun(set.getString("gugun"));
				dto.setPhone(set.getString("phone"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dto;
		
	}
	
	
	
	private Connection getConnection() {
		//lookup을 쓰기위해 context를 만든다. lookup 메소드로 오라클의 경로에 있는 오라클을 찾아서 datasource에 경로를 알려준다.
		//datasource는 lookup이 알려준 경로를 필드로 갖고 있다가, getConnection 메소드로 오라클과 연결한다.
		//DB가 연결된 상태에서, 자유자재로 메소드를 사용해서 소통하기 위해 connection 인터페이스에 넣어준다.
		
		Context context = null;
		DataSource dataSource = null;
		Connection connection = null;
		try {
			context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			connection = dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return connection;
	}
	
	public int confirmId(String id) {
		int ri = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select id from members where id = ?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();
			if(set.next()) {
				ri = 1;
			} else {
				ri = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return ri;
	}
	
	public int insertMember(MemberDto dto) {
		int ri = 0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "insert into members (id, pw, name, email, sido, gugun, phone) values (?,?,?,?,?,?,?)";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.geteMail());
			pstmt.setString(5, dto.getSido());
			pstmt.setString(6, dto.getGugun());
			pstmt.setString(7, dto.getPhone());
			pstmt.executeUpdate();
			ri = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	
	public ArrayList<CategoryDto> getCategory(){
		
		ArrayList<CategoryDto> dtos = new ArrayList<CategoryDto>();
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from category";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CategoryDto dto = new CategoryDto();
				dto.setcNum(rs.getInt("c_num"));
				dto.setName(rs.getString("name"));
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dtos;
		
	}
	
	public MemberDto contentView(String mId) {
		MemberDto dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			
			String query = "select * from members where id = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String eMail = rs.getString("eMail");
				Timestamp rDate = rs.getTimestamp("rDate");
				String sido = rs.getString("sido");
				String gugun = rs.getString("gugun");
				String phone = rs.getString("phone");
				
				dto = new MemberDto(id, pw, name, eMail, rDate, sido, gugun, phone);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dto;
	}

	public int modify(String mId, String pw, String name, String eMail, String sido, String gugun, String phone) {
		// TODO Auto-generated method stub

		int ri = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			
			String query = "update members set pw = ?, name = ?, eMail = ?, sido = ?, gugun = ?, phone = ? where id = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setString(3, eMail);
			pstmt.setString(4, sido);
			pstmt.setString(5, gugun);
			pstmt.setString(6, phone);
			pstmt.setString(7, mId);
			ri = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}

	public int delete(String id) {
		// TODO Auto-generated method stub
		
		int ri = -1;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			
			String query = "delete from members where id = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			ri = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}	
		}
		
		System.out.println("delete" + ri);
		return ri;
	}
}
