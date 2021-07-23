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
import com.javaEdu.ex.dto.MemberDto;

public class MemberDao {
	
	private static MemberDao instance = new MemberDao();
	
	private MemberDao() {
	}
	
	public static MemberDao getInstance(){
		return instance;
	}
	
	public int userCheck(String id, String pw) {
		int ri = 0;
		String dbPw;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select pw from members where id = ?";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1,id);
			set = pstmt.executeQuery();
			
			if(set.next()) {
				dbPw = set.getString("pw");
				if(dbPw.equals(pw)) {
					ri = 1;
				} else {
					ri = 0;
				}
			} else {
				ri = -1;
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
		return ri;
	}
	
	public MemberDto getMember(String id) {
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
				dto.setAddress(set.getString("address"));
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
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select id from members where id = ?";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
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
				connection.close();
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
		String query = "insert into members (id, pw, name, email, address, phone) values (?,?,?,?,?,?)";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.geteMail());
			pstmt.setString(5, dto.getAddress());
			pstmt.setString(6, dto.getPhone());
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
	
	public ArrayList<MemberDto> membersAll(){
		
		ArrayList<MemberDto> dtos = new ArrayList<MemberDto>();
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from members";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();

			System.out.println("============");
			while (rs.next()) {
				MemberDto dto = new MemberDto();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.seteMail(rs.getString("eMail"));
				dto.setrDate(rs.getTimestamp("rDate"));
				dto.setAddress(rs.getString("address"));
				dto.setAddress(rs.getString("phone"));
				dtos.add(dto);
			}
			System.out.println("--------------------");
		
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
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		try {
			connection = getConnection();
			
			String query = "select * from members where id = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, mId);
			rs = preparedStatement.executeQuery();
			if (rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String eMail = rs.getString("eMail");
				Timestamp rDate = rs.getTimestamp("rDate");
				String address = rs.getString("address");
				String phone = rs.getString("phone");
				
				dto = new MemberDto(id, pw, name, eMail, rDate, address, phone);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dto;
	}

	public int modify(String mId, String pw, String name, String eMail, String address, String phone) {
		// TODO Auto-generated method stub

		int ri = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = getConnection();
			
			String query = "update members set pw = ?, name = ?, eMail = ?, address = ?, phone = ? where id = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, pw);
			preparedStatement.setString(2, name);
			preparedStatement.setString(3, eMail);
			preparedStatement.setString(4, address);
			preparedStatement.setString(5, phone);
			preparedStatement.setString(6, mId);
			ri = preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null)preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
}
