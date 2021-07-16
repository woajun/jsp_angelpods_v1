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
		
		if(dao.confirmId(dto.getId()) == 1){
			request.setAttribute("alert", "아이디가 이미 존재 합니다.");
		} else {
			int ri = dao.insertMember(dto);
			if(ri == 1) {
				request.setAttribute("id", dto.getId());
				request.setAttribute("alert", "회원 가입에 성공 했습니다.");
			} else {
				request.setAttribute("alert", "회원 가입에 실패 했습니다.");
			}
		}
	}
}
