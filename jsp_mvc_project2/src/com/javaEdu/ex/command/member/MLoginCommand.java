package com.javaEdu.ex.command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javaEdu.ex.command.Command;
import com.javaEdu.ex.dao.MemberDao;
import com.javaEdu.ex.dto.MemberDto;

public class MLoginCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
//		// TODO Auto-generated method stub
		MemberDao dao = MemberDao.getInstance();

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		int checkNum = dao.userCheck(id, pw);
		int ri= 0;
			
		if(checkNum == -1) {
			ri = 2;
		}else if (checkNum == 0 ) {
			ri = 3;
		}else if (checkNum == 1) {
			MemberDto dto = dao.getMember(id);
			if(dto == null) {
				ri = 4;
			} else {
				HttpSession session = request.getSession();
				String name = dto.getName();
				session.setAttribute("id", id);
				session.setAttribute("name", name);
				session.setAttribute("ValidMem", "yes");
				ri = 1;
			}
		}
		request.setAttribute("ri", ri);
	}
}
