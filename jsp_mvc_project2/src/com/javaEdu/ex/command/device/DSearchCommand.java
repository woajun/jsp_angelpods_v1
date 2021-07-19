package com.javaEdu.ex.command.device;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaEdu.ex.command.Command;
import com.javaEdu.ex.dao.DeviceDao;
import com.javaEdu.ex.dao.MemberDao;
import com.javaEdu.ex.dto.DeviceDto;
import com.javaEdu.ex.dto.MemberDto;

public class DSearchCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		DeviceDao dao = DeviceDao.getInstance();
		
		String dId = request.getParameter("dId");
		String ownerId = dao.search(dId);
		
		int ri = 0;
		
		if (ownerId != null) {
			MemberDao mDao = MemberDao.getInstance();
			MemberDto mDto = mDao.getMember(ownerId);
			request.setAttribute("owner", mDto);
			ri = 1;
		} 
		
		request.setAttribute("ri", ri);
	}

}
