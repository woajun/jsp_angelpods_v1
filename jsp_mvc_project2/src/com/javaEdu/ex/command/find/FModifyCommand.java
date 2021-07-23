package com.javaEdu.ex.command.find;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaEdu.ex.command.Command;

public class FModifyCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
	}

}
