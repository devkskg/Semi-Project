package com.lumodiem.board.hostboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lumodiem.board.hostboard.service.HostBoardService;
import com.lumodiem.board.hostboard.vo.Klass;

@WebServlet("/klassBoardList")
public class KlassBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KlassBoardListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String klassName = request.getParameter("klass_name");
		String accountNickname = request.getParameter("account_nickname");
		String klassAddress = request.getParameter("klass_address");
		int klassMax = Integer.parseInt(request.getParameter("klass_max"));
		int klassPrice = Integer.parseInt(request.getParameter("klass_price"));
		String klassTxt = request.getParameter("klass_txt");
		int accountNo = Integer.parseInt(request.getParameter("account_no"));
		
		Klass option = Klass.builder()
					.klassName(klassName)
					.accountNickname(accountNickname)
					.klassAddress(klassAddress)
					.klassMax(klassMax)
					.klassPrice(klassPrice)
					.klassTxt(klassTxt)
					.accountNo(accountNo)
					.klassStatus("R")
					.build();
		System.out.println(option);
		
		List<Klass> resultList = new HostBoardService().selectBoardList(option);
		request.setAttribute("resultList", resultList);
		RequestDispatcher view = request.getRequestDispatcher("/views/klass/klassBoardList.jsp");
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
