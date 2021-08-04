package com.javaEdu.ex.command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaEdu.ex.command.Command;
import com.javaEdu.ex.dao.MemberDao;
import com.javaEdu.ex.dto.MemberDto;

public class MContentCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id = request.getSession().getAttribute("id").toString();
		MemberDao dao = MemberDao.getInstance();
		MemberDto dto = dao.contentView(id);
		
		request.setAttribute("mdto", dto);
	}

}
