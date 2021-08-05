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

public class CategoryDetailDao {
	
	private static CategoryDetailDao instance = new CategoryDetailDao();
	
	private CategoryDetailDao() {
	}
	
	public static CategoryDetailDao getInstance(){
		return instance;
	}
	
}
