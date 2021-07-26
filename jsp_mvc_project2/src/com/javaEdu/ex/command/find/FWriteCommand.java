package com.javaEdu.ex.command.find;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javaEdu.ex.command.Command;
import com.javaEdu.ex.dao.FDao;

public class FWriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String writerId = (String) session.getAttribute("id");
		System.out.println(writerId);
		
		String image = request.getParameter("image");
		String model = request.getParameter("model");
		String latitude = request.getParameter("latitude");
		String longitude = request.getParameter("longitude");
		String addr = request.getParameter("addr");
		String addrDetail = request.getParameter("addrDetail");
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String deviceId = request.getParameter("deviceId");
		
		FDao dao = FDao.getInstance();
		dao.write(image, model, latitude, longitude, addr, addrDetail, title, contents, writerId, deviceId );
		
		
	}
}
