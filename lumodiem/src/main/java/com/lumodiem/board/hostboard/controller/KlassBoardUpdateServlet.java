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

@WebServlet("/klassBoardUpdate")
public class KlassBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KlassBoardUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("klass_no");
		int klassNo = 0;
		if(temp != null) klassNo = Integer.parseInt(temp);
		List<Klass> klass = new HostBoardService().selectKlassDetail(klassNo);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/klass/klassBoardUpdate.jsp");
		request.setAttribute("klass", klass);
		System.out.println(klass);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
