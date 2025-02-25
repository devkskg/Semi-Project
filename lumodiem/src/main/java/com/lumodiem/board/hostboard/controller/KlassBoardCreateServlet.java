package com.lumodiem.board.hostboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lumodiem.board.hostboard.service.HostBoardService;
import com.lumodiem.board.hostboard.vo.Klass;


@WebServlet("/klassBoardCreate")
public class KlassBoardCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KlassBoardCreateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String klassName = request.getParameter("klass_name");
		String accountNickname = request.getParameter("account_nickname");
		String klassAddress = request.getParameter("account_address");
		int klassMax = Integer.parseInt(request.getParameter("klass_max"));
		int klassPrice = Integer.parseInt(request.getParameter("klass_price"));
		String klassTxt = request.getParameter("klass_txt");
		
//		Klass klass = new Klass();
		
		Klass option = Klass.builder()
					.klassName(klassName)
					.accountNickname(accountNickname)
					.klassAddress(klassAddress)
					.klassMax(klassMax)
					.klassPrice(klassPrice)
					.klassTxt(klassTxt)
					.build();
		
		int result = new HostBoardService().insertBoard(option);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
