package com.javaEdu.ex.command.find;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaEdu.ex.command.Command;
import com.javaEdu.ex.dao.FDao;
import com.javaEdu.ex.dto.FDto;

public class FListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		FDao dao = FDao.getInstance();
		ArrayList<FDto> dtos = dao.list();
		request.setAttribute("list", dtos);
		request.setAttribute("f_list", "yes");
	}

}
