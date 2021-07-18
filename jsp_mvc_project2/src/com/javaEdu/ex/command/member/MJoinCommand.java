package com.javaEdu.ex.command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaEdu.ex.command.Command;
import com.javaEdu.ex.dao.MemberDao;
import com.javaEdu.ex.dto.MemberDto;

public class MJoinCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		MemberDto dto = new MemberDto();
		MemberDao dao = MemberDao.getInstance();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String eMail = request.getParameter("eMail");
		String address = request.getParameter("address");
		
		dto.setId(id);
		dto.setPw(pw);
		dto.setName(name);
		dto.seteMail(eMail);
		dto.setAddress(address);
		
		
		int ri = 0;
		if(dao.confirmId(dto.getId()) == 1){
			ri = 1;
		} else {
			int ri2 = dao.insertMember(dto);
			if(ri2 == 1) {
				request.setAttribute("id", dto.getId());
				ri = 2;
			} else {
				ri = 0;
			}
		}
		
		request.setAttribute("ri", ri);
		
	}
}
