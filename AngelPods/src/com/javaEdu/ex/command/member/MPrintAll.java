package com.javaEdu.ex.command.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaEdu.ex.command.Command;
import com.javaEdu.ex.dao.MemberDao;
import com.javaEdu.ex.dto.MemberDto;

public class MPrintAll implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		MemberDao dao = MemberDao.getInstance();
		ArrayList<MemberDto> dtos = dao.membersAll();
		request.setAttribute("mList", dtos);
	}
}
