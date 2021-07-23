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
		String name = request.getParameter("name");
		String eMail = request.getParameter("eMail");
		String address = request.getParameter("sido") + " " + request.getParameter("gugun") ;
		String phone = request.getParameter("phone");
		
		MemberDao dao = MemberDao.getInstance();
		int ri = dao.modify(mId, pw, name, eMail, address, phone);
		
		System.out.println(ri);
		request.setAttribute("ri", ri);
	}

}
