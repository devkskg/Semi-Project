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
import com.lumodiem.board.hostboard.vo.KlassAttach;
import com.lumodiem.board.hostboard.vo.KlassDate;
import com.lumodiem.board.memberboard.vo.Review;

@WebServlet("/klassDetail")
public class KlassDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KlassDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int klassNo = Integer.parseInt(request.getParameter("klass_no"));
		System.out.println(klassNo);
		
		Klass klass = new HostBoardService().selectKlassOne(klassNo);
		List<KlassDate> klassDate = new HostBoardService().selectKlassDate(klassNo);
		
		List<KlassAttach> klassAttach = new HostBoardService().selectAttachList(klassNo);
		
		List<Review> review = new HostBoardService().selectReviewByKlass(klassNo);
		System.out.println("review"+review);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/klass/klassDetail.jsp");
		request.setAttribute("klass", klass);
		request.setAttribute("klassDate", klassDate);
		request.setAttribute("klassAttach", klassAttach);
		request.setAttribute("review", review);
		System.out.println("클래스"+klass);
		System.out.println("데이트"+klassDate);
//		System.out.println("스타트"+);
//		System.out.println("엔드"+);
		view.forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
