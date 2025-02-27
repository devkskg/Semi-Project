package com.lumodiem.board.adminboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/reportKlass")
public class ReportKlassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReportKlassServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("report_klass_no");
		System.out.println(temp);
		RequestDispatcher view = request.getRequestDispatcher("/views/admin/kalassReport.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
