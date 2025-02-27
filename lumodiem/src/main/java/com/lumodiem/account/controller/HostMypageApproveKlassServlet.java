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

@WebServlet("/hostMypageApproveKlass")
public class HostMypageApproveKlassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HostMypageApproveKlassServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("account_no");
		String approveCode = request.getParameter("approve_code");
		Klass option = null;
		List<Klass> list = null;
		int accountNo = 0;
		if(temp != null) {
			accountNo = Integer.parseInt(temp);
			option = Klass.builder().accountNo(accountNo).approveCode(approveCode).build();
		}
//		System.out.println("어카운트넘버 : " + accountNo);
		System.out.println("어프로브코드 : " + approveCode);
		
		if(option != null || approveCode !=null) {
			list = new HostMypageService().selectApproveListByHostAccountNo(option);
			request.setAttribute("approveList", list);
			request.setAttribute("approveCode", approveCode);
		} else {
			response.sendRedirect("/");
		}
		
		String urlPath = "/";
		if(list != null && option != null) {
			urlPath = "/views/mypage/hostmypageapproveklass.jsp";
		}
		
//		System.out.println(option);
		
		RequestDispatcher view = request.getRequestDispatcher(urlPath);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
