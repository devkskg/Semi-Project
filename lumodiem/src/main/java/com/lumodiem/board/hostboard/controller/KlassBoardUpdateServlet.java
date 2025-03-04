package com.lumodiem.board.hostboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.lumodiem.board.hostboard.service.HostBoardService;
import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.hostboard.vo.KlassDate;

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
		Klass klass = new HostBoardService().selectKlassOne(klassNo);
		List<KlassDate> klassDate = new HostBoardService().selectKlassDate(klassNo);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/klass/klassBoardUpdate.jsp");
		request.setAttribute("klass", klass);
		request.setAttribute("klassDate", klassDate);
		System.out.println("klass"+klass);
		System.out.println("klassDate"+klassDate);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
