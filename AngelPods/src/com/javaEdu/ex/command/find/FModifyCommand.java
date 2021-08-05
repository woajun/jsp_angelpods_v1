package com.javaEdu.ex.command.find;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaEdu.ex.command.Command;
import com.javaEdu.ex.dao.FindBoardDao;
import com.javaEdu.ex.dao.ImagesDao;
import com.javaEdu.ex.dto.FindBoardDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FModifyCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		FindBoardDao dao = FindBoardDao.getInstance();
		
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
		
		int fbNum = Integer.parseInt(mRequest.getParameter("fbNum"));
		int cNum = Integer.parseInt(mRequest.getParameter("cNum"));
		int cdNum = Integer.parseInt(mRequest.getParameter("cdNum"));
		String sn = mRequest.getParameter("sn");
		String lat = mRequest.getParameter("lat");
		String lon = mRequest.getParameter("lon");
		String addr = mRequest.getParameter("addr");
		String addrDetail = mRequest.getParameter("addrDetail");
		String title = mRequest.getParameter("title");
		String contents = mRequest.getParameter("contents");
		
		try {
			String imageSystemName = mRequest.getFilesystemName("image");
			String imageName = mRequest.getOriginalFileName("image");
			int imageIndex = 0;
			ImagesDao imagesDao = ImagesDao.getInstance();
			imagesDao.imageSetDB(imageSystemName, imageName, imageIndex, fbNum);
			
			if (imageIndex == 0) {
				dao.modify(fbNum,cNum,cdNum,imageSystemName,addr,addrDetail,title,contents,sn,lat,lon);
//				dao.setThumbnailImage(fbNum, imageSystemName);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("이미지를 DB에 넣는 것을 실패했습니다.");
		}
		
		request.setAttribute("ri", 1);
		
	}
}
