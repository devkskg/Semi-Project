package com.lumodiem.board.memberboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.lumodiem.board.memberboard.service.MemberBoardService;
import com.lumodiem.board.memberboard.vo.Review;

@WebServlet("/updateReviewEnd")
public class UpdateReviewEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateReviewEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("account_no");
		int accountNo = 0;
		if(temp!=null) accountNo = Integer.parseInt(temp);
		String reviewName = request.getParameter("review_name");
		String reviewTxt = request.getParameter("review_txt");
		
//		int resNo = 4;
//		int klassDateNo = 2;
		
		Review review = Review.builder()
				.reviewName(reviewName)
				.reviewTxt(reviewTxt)
				.build();
		
		int result = new MemberBoardService().UpdateReview(review);
		System.out.println("review : "+ review);
		
		JSONObject obj = new JSONObject();
		obj.put("res_code", "500");
		obj.put("res_msg", "게시글 수정중 오류가 발생하였습니다.");
		
		if(result > 0) {
		obj.put("res_code", "200");
		obj.put("res_msg", "정상적으로 게시글이 수정되었습니다.");
		}
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
