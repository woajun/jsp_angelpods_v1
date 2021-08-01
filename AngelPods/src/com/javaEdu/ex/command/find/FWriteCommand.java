package com.javaEdu.ex.command.find;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javaEdu.ex.command.Command;
import com.javaEdu.ex.dao.FDao;
import com.javaEdu.ex.dao.FImageDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FWriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String writerId = (String) session.getAttribute("id");
		FDao dao = FDao.getInstance();
		
		//multipartRequest 생성자
		MultipartRequest mRequest = null;
		try {
			String directory = request.getSession().getServletContext().getRealPath("/images/");
			int maxSize = 1024 * 1024 * 100;
			String encoding = "UTF-8";
			mRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String model = mRequest.getParameter("model");
		String latitude = mRequest.getParameter("latitude");
		String longitude = mRequest.getParameter("longitude");
		String addr = mRequest.getParameter("addr");
		String addrDetail = mRequest.getParameter("addrDetail");
		String title = mRequest.getParameter("title");
		String contents = mRequest.getParameter("contents");
		String deviceId = mRequest.getParameter("deviceId");
		
		String image = null;
		int boardNum = dao.write(image, model, latitude, longitude, addr, addrDetail, title, contents, writerId, deviceId);
		
		//이미지를 생성해서 DB에 넣기
		try {
			String imageSystemName = mRequest.getFilesystemName("image");
			String imageName = mRequest.getOriginalFileName("image");
			int imageIndex = 0;
			FImageDao fImageDao = FImageDao.getInstance();
			fImageDao.imageSetDB(imageSystemName, imageName, imageIndex, boardNum);
			
			if (imageIndex == 0) {
				dao.setThumbnailImage(boardNum, imageSystemName);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("이미지를 DB에 넣는 것을 실패했습니다.");
		}
		
		request.setAttribute("ri", 1);
		
	}
}
