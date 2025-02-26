package com.lumodiem.board.memberboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lumodiem.board.memberboard.service.MemberBoardService;
import com.lumodiem.board.memberboard.vo.Review;

@WebServlet("/reviewBoard")
public class ReviewBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewBoardServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reviewName = request.getParameter("review_name");
		String reviewTxt = request.getParameter("review_txt");
		String accountNickName = request.getParameter("account_nickname");
		String orderType = request.getParameter("order_type");
		
//		int accountNo = Integer.parseInt(request.getParameter("account_no"));
		
		Review option = Review.builder()
				.reviewName(reviewName)
				.reviewTxt(reviewTxt)
				.accountNickName(accountNickName)
				.orderType(orderType)
				.build();
		List<Review> resultList = new MemberBoardService().selectReviewList(option);
		request.setAttribute("resultList", resultList);
		RequestDispatcher view = request.getRequestDispatcher("/views/review/reviewBoard.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
