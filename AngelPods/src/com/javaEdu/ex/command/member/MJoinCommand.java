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
		
		dto.setUserId(request.getParameter("userId"));
		dto.setPw(request.getParameter("pw"));
		dto.setName(request.getParameter("name"));
		dto.seteMail(request.getParameter("eMail"));
		dto.setAddr(request.getParameter("addr"));
		dto.setLat(request.getParameter("lat"));
		dto.setLon(request.getParameter("lon"));
		
		int ri = 0;
		if(dao.confirmUserId(dto.getUserId()) == 1){
			ri = 1;
		} else {
			int ri2 = dao.insertMember(dto);
			if(ri2 == 1) {
				request.setAttribute("userId", dto.getUserId());
				ri = 2;
			} else {
				ri = 0;
			}
		}
		request.setAttribute("ri", ri);
	}
}
