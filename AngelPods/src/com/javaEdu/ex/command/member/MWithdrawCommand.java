package com.javaEdu.ex.command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaEdu.ex.command.Command;
import com.javaEdu.ex.dao.MemberDao;

public class MWithdrawCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		MemberDao dao = MemberDao.getInstance();
		
		String id  = request.getParameter("userId");
		int ri = -1;
		
		if(dao.delete(id) == 1) ri = 1;
		
		request.getSession().invalidate();
		request.setAttribute("ri", ri);
	}
}
