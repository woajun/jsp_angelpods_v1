package com.javaEdu.ex.command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaEdu.ex.command.Command;
import com.javaEdu.ex.dao.BDao;
import com.javaEdu.ex.dao.MemberDao;

public class MModifyCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String mId = request.getSession().getAttribute("id").toString();
		String pw = request.getParameter("pw");
		String eMail = request.getParameter("eMail");
		String address = request.getParameter("address");
		
		MemberDao dao = MemberDao.getInstance();
		int ri = dao.modify(mId, pw, eMail, address);
		
		request.setAttribute("ri", ri);
	}

}
