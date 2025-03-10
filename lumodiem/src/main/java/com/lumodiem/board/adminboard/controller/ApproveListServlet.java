package com.lumodiem.board.adminboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lumodiem.board.adminboard.service.ApproveSerview;
import com.lumodiem.board.adminboard.service.ReportService;
import com.lumodiem.board.hostboard.service.HostBoardService;
import com.lumodiem.board.hostboard.vo.Klass;

@WebServlet("/arreoveList")
public class ApproveListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ApproveListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String klassName = request.getParameter("klass_name");
		String accountNickname = request.getParameter("account_nickname");
		String klassTxt = request.getParameter("klass_txt");
		String searchType = request.getParameter("search_type");
		String searchTxt = request.getParameter("search_txt");
		String orderType = request.getParameter("order_type"); 
		String approveCode = request.getParameter(accountNickname);
		
 		Klass option = Klass.builder()
				.klassName(klassName)
				.accountNickname(accountNickname)
				.klassTxt(klassTxt)
				.searchType(searchType)
				.searchTxt(searchTxt)
				.orderType(orderType)
				.approveCode(approveCode)
				.build();
 		System.out.println(option);
 		
//		페이징 추가
		String nowPage = request.getParameter("nowPage");
		if(nowPage != null) {
			option.setNowPage(Integer.parseInt(nowPage));
		}
		System.out.println("option : " + option);
		
		int totalData = new ApproveSerview().approveListCount(option);
		option.setTotalData(totalData);
		request.setAttribute("paging", option);
//		페이징 추가
		
		//List<Klass> resultList = new HostBoardService().searchBoardList(option);
		List<Klass> resultList = new ApproveSerview().selectApproveList(option);
		request.setAttribute("resultList", resultList);
		RequestDispatcher view = request.getRequestDispatcher("/views/admin/approveList.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
