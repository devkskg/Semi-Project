package com.lumodiem.board.memberboard.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
		LocalDateTime ldt = LocalDateTime.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		
		int accountNo = Integer.parseInt(request.getParameter("account_no"));
		String reviewName = request.getParameter("reivew_name");
		String reviewTxt = request.getParameter("review_txt");
		int reviewNo = Integer.parseInt(request.getParameter("review_no"));
		
		Review review = Review.builder()
				.accountNo(accountNo)
				.reviewName(reviewName)
				.reviewTxt(reviewTxt)
				.reviewNo(reviewNo)
				.reviewModDate(ldt.format(dtf))
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
