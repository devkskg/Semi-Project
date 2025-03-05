package com.lumodiem.board.memberboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lumodiem.account.vo.Account;
import com.lumodiem.board.memberboard.service.MemberBoardService;
import com.lumodiem.board.memberboard.vo.Review;
import com.lumodiem.board.memberboard.vo.ReviewAttach;
import com.lumodiem.board.memberboard.vo.ReviewLike;

@WebServlet("/reviewDetail")
public class ReviewDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String url = request.getContextPath() + "/";
		int totalLikeCount = 0;
		int myLikeCount = 0;
		ReviewLike reviewLike = null;
		if(session != null && session.getAttribute("account") != null) {
			Account account = (Account)session.getAttribute("account");
			int reviewNo = Integer.parseInt(request.getParameter("review_no"));
			Review review = null;
			
			ReviewAttach noImg = new MemberBoardService().selectNoImgReview(reviewNo);
			if(noImg == null) {
				review = new MemberBoardService().selectReviewNo(reviewNo);
				System.out.println("사진 없는 거 조회");
			} else {
				review = new MemberBoardService().selectReviewOne(reviewNo);
				System.out.println("사진 있는 거 조회");
			}
			totalLikeCount = new MemberBoardService().countLikeByReviewNo(reviewNo);
			reviewLike = ReviewLike.builder().accountNo(account.getAccountNo()).reviewNo(reviewNo).build();
			myLikeCount = new MemberBoardService().countLikeByAccountNoReviewNo(reviewLike);
			
			RequestDispatcher view = request.getRequestDispatcher("/views/review/reviewDetail.jsp");
			request.setAttribute("totalLikeCount", totalLikeCount);
			request.setAttribute("myLikeCount", myLikeCount);
			request.setAttribute("review", review);
			view.forward(request, response);
		} else {
			response.sendRedirect(url);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
