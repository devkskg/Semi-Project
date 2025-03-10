package com.lumodiem.board.adminboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lumodiem.board.adminboard.service.ReportService;
import com.lumodiem.board.adminboard.vo.ReportKlass;
import com.lumodiem.board.hostboard.vo.Klass;


@WebServlet("/reportKlass")
public class ReportKlassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReportKlassServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String klassName = request.getParameter("klass_name");
		String accountNickname = request.getParameter("account_nickname");
		String klassTxt = request.getParameter("klass_txt");
		String searchType = request.getParameter("search_type");
		String searchTxt = request.getParameter("search_txt");
		String orderType = request.getParameter("order_type"); 
		
		Klass option  = Klass.builder()
				.klassName(klassName)
				.accountNickname(accountNickname)
				.klassTxt(klassTxt)
				.searchType(searchType)
				.searchTxt(searchTxt)
				.orderType(orderType)
				.build();
		List<ReportKlass> resultList = new ReportService().selectReportKlassList(option);

		String nowPage = request.getParameter("nowPage");
		if(nowPage != null) {
			option.setNowPage(Integer.parseInt(nowPage));
		}
//		페이징 추가중
//		int totalCount = new ReportService().selectReportKlassCount(option);
		
		
		
		
		RequestDispatcher view = request.getRequestDispatcher("/views/admin/reportKlass.jsp");
		request.setAttribute("resultList", resultList);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
