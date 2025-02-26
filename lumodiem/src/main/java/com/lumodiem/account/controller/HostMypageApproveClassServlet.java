package com.lumodiem.account.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lumodiem.account.service.HostMypageService;
import com.lumodiem.board.hostboard.vo.Klass;

@WebServlet("/hostMypageApproveClass")
public class HostMypageApproveClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HostMypageApproveClassServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("account_no");
		int accountNo = 0;
		if(temp != null) accountNo = Integer.parseInt(temp);
		
		List<Klass> list = new  HostMypageService().selectListByHostAccountNo(accountNo);
		
		String urlPath = "/";
		if(list != null) urlPath = "/views/mypage/hostmypageapproveclass.jsp";
		
		RequestDispatcher view = request.getRequestDispatcher(urlPath);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
