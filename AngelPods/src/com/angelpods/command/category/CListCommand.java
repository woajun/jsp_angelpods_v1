package com.angelpods.command.category;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.angelpods.command.Command;
import com.angelpods.dao.CDao;
import com.angelpods.dto.CDto;

public class CListCommand implements Command{
       
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String inputVal = request.getParameter("category");
		System.out.println(inputVal);
		CDao cDao = CDao.getInstance();
		ArrayList <CDto> cList = cDao.getList(inputVal);
		
		for (int i = 0; i < cList.size(); i++) {
			System.out.println(cList.get(i).getName());
		}
		
		response.setContentType("application/json");
		new Gson().toJson(cList, response.getWriter());
		
	}
	
	

}
