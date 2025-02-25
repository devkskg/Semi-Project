package com.lumodiem.board.memberboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lumodiem.board.memberboard.service.ReviewCommentServlet;
import com.lumodiem.board.memberboard.vo.ReviewCmt;


@WebServlet("/createcmt")
public class CreateCommentEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreateCommentEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String temp = request.getParameter("account_no");
		//String temp2 = request.getParameter("review_no");
		String review_cmt_txt = request.getParameter("review_cmt_txt");
		//int account_no = 0;
		//int review_no = 0 ;
		//if(temp!=null) account_no = Integer.parseInt(temp);
		//if(temp2!=null) review_no = Integer.parseInt(temp2);
		
		ReviewCmt cmt = new ReviewCmt();
		//cmt.setAccountNo(account_no);
		//cmt.setReviewNo(review_no);
		cmt.setReviewCmtTxt(review_cmt_txt);
		System.out.println(cmt);
		
		int result = new ReviewCommentServlet().insertReviewComment(cmt);
		System.out.println(result);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
