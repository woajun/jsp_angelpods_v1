package com.javaEdu.ex.frontController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaEdu.ex.command.Command;
import com.javaEdu.ex.command.board.BContentCommand;
import com.javaEdu.ex.command.board.BDeleteCommand;
import com.javaEdu.ex.command.board.BListCommand;
import com.javaEdu.ex.command.board.BModifyCommand;
import com.javaEdu.ex.command.board.BReplyCommand;
import com.javaEdu.ex.command.board.BReplyViewCommand;
import com.javaEdu.ex.command.board.BWriteCommand;
import com.javaEdu.ex.command.member.MPrintAll;

@WebServlet("*.do")
public class BFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BFrontController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		actionDo(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("dopost");
		actionDo(request,response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo");
		
		request.setCharacterEncoding("UTF-8");
		
		String viewPage = null;
		Command command = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		if(com.equals("/board/write_view.do")) {
			viewPage = "write_view.jsp";
		} else if (com.equals("/board/write.do")) {
			command = new BWriteCommand();
			command.execute(request, response);
			viewPage = "list.do";
		} else if (com.equals("/board/list.do")) {
			command = new BListCommand();
			command.execute(request, response);
			viewPage = "list.jsp";
		} else if (com.equals("/board/content_view.do")) {
			command = new BContentCommand();
			command.execute(request,response);
			viewPage = "content_view.jsp";
		} else if (com.equals("/board/modify.do")) {
			command = new BModifyCommand();
			command.execute(request, response);
			viewPage = "list.do";
		} else if (com.equals("/board/delete.do")) {
			command = new BDeleteCommand();
			command.execute(request, response);
			viewPage = "list.do";
		} else if (com.equals("/board/reply.do")) {
			command = new BReplyCommand();
			command.execute(request, response);
			viewPage = "list.do";
		} else if (com.equals("/board/reply_view.do")) {
			command = new BReplyViewCommand();
			command.execute(request, response);
			viewPage = "reply_view.jsp";
		}
		
		if(com.equals("/member/membersAll.do")) {
			command = new MPrintAll();
			command.execute(request, response);
			viewPage = "membersAll.jsp";
		}
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request,response);
		}
}
