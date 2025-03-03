package com.lumodiem.account.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/mypageUpdate")
public class MypageUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MypageUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String urlPath = "/";
		
		if(session != null && session.getAttribute("account") != null) {
			urlPath = request.getContextPath()+"/views/mypage/mypageUpdate.jsp";
			RequestDispatcher view = request.getRequestDispatcher(urlPath);
			view.forward(request, response);
		} else {
			response.sendRedirect(urlPath);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
