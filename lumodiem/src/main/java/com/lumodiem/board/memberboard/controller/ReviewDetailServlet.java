package com.lumodiem.board.memberboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lumodiem.board.memberboard.service.MemberBoardService;
import com.lumodiem.board.memberboard.vo.Review;
import com.lumodiem.board.memberboard.vo.ReviewAttach;

@WebServlet("/reviewDetail")
public class ReviewDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reviewNo = Integer.parseInt(request.getParameter("review_no"));
		System.out.println(reviewNo);
		Review review = null;
		ReviewAttach noImg = new MemberBoardService().selectNoImgReview(reviewNo);
		if(noImg == null) {
			review = new MemberBoardService().selectReviewNo(reviewNo);
		} else {
			review = new MemberBoardService().selectReviewOne(reviewNo);
			
		}
		RequestDispatcher view = request.getRequestDispatcher("/views/review/reviewDetail.jsp");
		request.setAttribute("review", review);
		System.out.println(review);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
