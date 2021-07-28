package com.javaEdu.ex.command.find;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaEdu.ex.command.Command;
import com.javaEdu.ex.dao.FDao;
import com.javaEdu.ex.dto.FDto;

public class FContentCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("Num"));
		FDao dao = FDao.getInstance();
		FDto dto = dao.contentView(num);
		
		request.setAttribute("content_view",dto);
	}

}
