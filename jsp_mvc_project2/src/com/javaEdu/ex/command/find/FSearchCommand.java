package com.javaEdu.ex.command.find;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaEdu.ex.command.Command;
import com.javaEdu.ex.dao.FDao;
import com.javaEdu.ex.dto.FDto;

public class FSearchCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String[] model = request.getParameterValues("model");
		
		String sido = request.getParameter("sido");
		String gugun = request.getParameter("gugun");
		String keyword = request.getParameter("keyword");
		String sArea = sido + " " + gugun;
		System.out.println(sArea);
		if (sArea.equals("시/도 선택 ")) {
			sArea="";
			System.out.println(sArea);
		}
		
		FDao dao = FDao.getInstance();
		ArrayList<FDto> dtos = dao.searchList(model, sArea, keyword);
		request.setAttribute("list", dtos);
		request.setAttribute("f_list", "yes");
	}

}
