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
import com.javaEdu.ex.command.member.MJoinCommand;
import com.javaEdu.ex.command.member.MLoginCommand;
import com.javaEdu.ex.command.member.MPrintAll;
import com.javaEdu.ex.command.regist.DRegistCommand;

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
		
//		String uri = request.getRequestURI();
//		String conPath = request.getContextPath();
//		String com = uri.substring(conPath.length());
		
		String uri[] = request.getRequestURI().split("/");
		String com = uri[uri.length-1];
		System.out.println(com);
		
		if(com.equals("write_view.do")) {
			viewPage = "/board/write_view.jsp";
		} else if (com.equals("write.do")) {
			command = new BWriteCommand();
			command.execute(request, response);
			viewPage = "list.do";
		} else if (com.equals("list.do")) {
			command = new BListCommand();
			command.execute(request, response);
			viewPage = "/board/list.jsp";
		} else if (com.equals("content_view.do")) {
			command = new BContentCommand();
			command.execute(request,response);
			viewPage = "/board/content_view.jsp";
		} else if (com.equals("modify.do")) {
			command = new BModifyCommand();
			command.execute(request, response);
			viewPage = "list.do";
		} else if (com.equals("delete.do")) {
			command = new BDeleteCommand();
			command.execute(request, response);
			viewPage = "list.do";
		} else if (com.equals("reply.do")) {
			command = new BReplyCommand();
			command.execute(request, response);
			viewPage = "list.do";
		} else if (com.equals("reply_view.do")) {
			command = new BReplyViewCommand();
			command.execute(request, response);
			viewPage = "/board/reply_view.jsp";
		}
		
//------------------멤버 -----------------------
		if(com.equals("membersAll.do")) {
			command = new MPrintAll();
			command.execute(request, response);
			viewPage = "/member/membersAll.jsp";
		} else if (com.equals("join.do")) {
			command = new MJoinCommand();
			command.execute(request, response);
			viewPage = "/member/login.jsp";
		} else if (com.equals("login.do")) {
			command = new MLoginCommand();
			command.execute(request, response);
			viewPage = "/member/main.jsp";
		}
		
//------------------디바이스---------------------
		
		if(com.equals("regist.do")) {
			command = new DRegistCommand();
			command.execute(request, response);
			viewPage = "list.do";
		}
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request,response);
	}
}
