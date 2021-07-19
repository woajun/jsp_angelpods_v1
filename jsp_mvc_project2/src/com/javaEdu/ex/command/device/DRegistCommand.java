package com.javaEdu.ex.command.device;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaEdu.ex.command.Command;
import com.javaEdu.ex.dao.DeviceDao;

public class DRegistCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String dModel = request.getParameter("model");
		
		String caseDid = request.getParameter("case");
		String leftDid = request.getParameter("left");
		String rightDid = request.getParameter("right");
		
		if (caseDid != null) {
			String dId = caseDid;
			String dGroup = "case";
			String memberId = "kang";
			
			DeviceDao dao = DeviceDao.getInstance();
			dao.regist(dId, dGroup, dModel, memberId);
		}

		if (leftDid != null) {
			String dId = leftDid;
			String dGroup = "left";
			String memberId = "kang";
			
			DeviceDao dao = DeviceDao.getInstance();
			dao.regist(dId, dGroup, dModel, memberId);
		}
		
		if (rightDid != null) {
			String dId = rightDid;
			String dGroup = "right";
			String memberId = "kang";
			
			DeviceDao dao = DeviceDao.getInstance();
			dao.regist(dId, dGroup, dModel, memberId);
		}
	}
}
