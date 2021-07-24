package com.javaEdu.ex.command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javaEdu.ex.command.Command;
import com.javaEdu.ex.dao.MemberDao;

public class MModifyCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String id = request.getSession().getAttribute("id").toString();
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String eMail = request.getParameter("eMail");
		String sido = request.getParameter("sido");
		String gugun = request.getParameter("gugun") ;
		String phone = request.getParameter("phone");
		
		MemberDao dao = MemberDao.getInstance();
		int ri = dao.modify(id, pw, name, eMail, sido, gugun, phone);
		
		HttpSession session = request.getSession();
		session.setAttribute("name", name);
		
		request.setAttribute("ri", ri);
	}

}
