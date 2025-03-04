package com.lumodiem.board.hostboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lumodiem.board.hostboard.service.HostBoardService;
import com.lumodiem.board.hostboard.vo.Klass;

@WebServlet("/klassReport")
public class KlassReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KlassReportServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("klass_no");
		int klassNo = 0;
		if(temp != null) klassNo = Integer.parseInt(temp);
		Klass klass = new HostBoardService().selectKlassOne(klassNo);
		Account account = new HostBoardService().selectAccount
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
