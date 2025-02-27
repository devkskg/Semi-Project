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

@WebServlet("/klassBoardListSearch")
public class KlassBoardListSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KlassBoardListSearchServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
//		String searchType = request.getParameter("search_type");
//		String searchTxt = request.getParameter("search_txt");
//		
//		Klass option = Klass.builder()
//				.searchType(searchType)
//				.searchTxt(searchTxt)
//				.build();
//		
//		List<Klass> searchList = new HostBoardService().searchBoardList(option);
//		
//		request.setAttribute("resultList", searchList);
//		RequestDispatcher view = request.getRequestDispatcher("/views/klass/klassBoardList.jsp");
//		view.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
