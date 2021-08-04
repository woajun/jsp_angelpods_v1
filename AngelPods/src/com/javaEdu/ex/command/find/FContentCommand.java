package com.javaEdu.ex.command.find;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaEdu.ex.command.Command;
import com.javaEdu.ex.dao.FindBoardDao;
import com.javaEdu.ex.dto.FindBoardDto;

public class FContentCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int fbNum = Integer.parseInt(request.getParameter("fbNum"));
		FindBoardDao dao = FindBoardDao.getInstance();
		FindBoardDto fbDto = dao.contentView(fbNum);
		String directory = request.getSession().getServletContext().getRealPath("/images/");
		request.setAttribute("directory", directory);
		request.setAttribute("fbDto",fbDto);
	}

}
