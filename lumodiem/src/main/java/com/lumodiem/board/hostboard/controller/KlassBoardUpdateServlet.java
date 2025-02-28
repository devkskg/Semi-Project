package com.lumodiem.board.hostboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lumodiem.board.hostboard.vo.Klass;

@WebServlet("/klassBoardUpdate")
public class KlassBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KlassBoardUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String temp = request.getParameter("klass_no");
//		int klassNo = 0;
//		if(temp != null) klassNo = Integer.parseInt(temp);
//		String klassMax = request.getParameter("klass_max");
//		String klassPrice = request.getParameter("klass_price");
//		String klassTxt = request.getParameter("klass_txt");
		Klass klass = new Klass();
		
		RequestDispatcher view = request.getRequestDispatcher("/views/klass/klassBoardUpdate.jsp");
		request.setAttribute("klass", klass);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
