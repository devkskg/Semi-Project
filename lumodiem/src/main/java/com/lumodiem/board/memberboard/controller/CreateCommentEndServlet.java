package com.lumodiem.board.memberboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lumodiem.board.memberboard.service.ReviewCommentService;
import com.lumodiem.board.memberboard.vo.ReviewCmt;


@WebServlet("/createCommentEnd")
public class CreateCommentEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreateCommentEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp1 = request.getParameter("account_no");
		String temp2 = request.getParameter("review_no");
		String reviewCmtTxt = request.getParameter("review_cmt_txt");
		int account_no = 0;
		int review_no = 0 ;
		if(temp1!=null) account_no = Integer.parseInt(temp1);
		if(temp2!=null) review_no = Integer.parseInt(temp2);
		
		ReviewCmt cmt = new ReviewCmt();
		cmt.setAccountNo(account_no);
		cmt.setReviewNo(review_no);
		cmt.setReviewCmtTxt(reviewCmtTxt);
		System.out.println(cmt);
		
		int result = new ReviewCommentService().insertReviewComment(cmt);
		List<ReviewCmt> resultList = new ReviewCommentService().selectReviewComment(cmt);
		System.out.println(result);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
