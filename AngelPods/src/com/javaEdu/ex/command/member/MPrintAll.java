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
		// TODO 조회 권한 확인
		MemberDao dao = MemberDao.getInstance();
		ArrayList<MemberDto> dto = dao.membersAll();
		request.setAttribute("mList", dto);
	}
}
