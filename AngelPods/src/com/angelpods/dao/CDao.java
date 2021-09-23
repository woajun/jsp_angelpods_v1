package com.angelpods.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.angelpods.dto.CDto;

public class CDao {
	
	DataSource dataSource;
	
	private static CDao instance = new CDao();
	
	private CDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static CDao getInstance(){
		return instance;
	}

	public ArrayList<CDto> getList(String inputVal) {
		// TODO Auto-generated method stub
		ArrayList<CDto> cList = new ArrayList <CDto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String searchVal = "%" + inputVal +"%";
			con = dataSource.getConnection();
			String query = "select "
					+ "id, name from CATEGORY where name like ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, searchVal);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("id");
				String name= rs.getString("name");
				CDto cDto = new CDto(id, name);
				cList.add(cDto);
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
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return cList;
	}
}
