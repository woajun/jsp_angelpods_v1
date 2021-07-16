package com.javaEdu.ex.command.member;

import java.io.IOException;
import java.io.PrintWriter;

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
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
//		
		MemberDao dao = MemberDao.getInstance();
		int checkNum = dao.userCheck(id, pw);
		response.setContentType("text/html; charset=UTF-8"); 
//		
		try {
			PrintWriter writer;
			writer = response.getWriter();
			
			if(checkNum == -1) {
				writer.println("<script>alert('아이디가 없습니다.'); location.href='login.jsp';</script>"); 
			}else if (checkNum == 0 ) {
				writer.println("<script>alert('비밀번호가 틀립니다.'); location.href='login.jsp';</script>"); 
			}else if (checkNum == 1) {
				MemberDto dto = dao.getMember(id);
				if(dto == null) {
					writer.println("<script>alert('존재하지 않는 회원 입니다.'); location.href='login.jsp';</script>"); 
				} else {
					HttpSession session = request.getSession();
					String name = dto.getName();
					session.setAttribute("id", id);
					session.setAttribute("name", name);
					session.setAttribute("ValidMem", "yes");
					writer.println("<script>alert('환영합니다!'); location.href='main.jsp';</script>");
				}
			}
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}
}
