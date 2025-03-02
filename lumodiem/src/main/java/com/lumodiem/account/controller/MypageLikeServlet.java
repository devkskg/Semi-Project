package com.lumodiem.account.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lumodiem.account.service.MypageService;
import com.lumodiem.account.vo.Account;
import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.hostboard.vo.KlassLike;
import com.lumodiem.board.memberboard.vo.Review;
import com.lumodiem.board.memberboard.vo.ReviewLike;

@WebServlet("/mypageLike")
public class MypageLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MypageLikeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Account account = null;
		String urlPath = "/";
		
		Klass option = null;
		List<KlassLike> klassLikeList = null;
		List<ReviewLike> reviewLikeList = null;
		
		if(session != null && session.getAttribute("account") != null) {
			account = (Account)session.getAttribute("account");
			int accountNo = account.getAccountNo();
			option = Klass.builder().accountNo(accountNo).build();
			
			if(option != null) {
				klassLikeList = new MypageService().selectKlassLikeByAccountNo(option);
				reviewLikeList = new MypageService().selectReviewLikeByAccountNo(option);
				request.setAttribute("klassLikeList", klassLikeList);
				request.setAttribute("reviewLikeList", reviewLikeList);
				
				urlPath = request.getContextPath()+"/views/mypage/mypagelike.jsp";
				RequestDispatcher view = request.getRequestDispatcher(urlPath);
				view.forward(request, response);
			} else {
				response.sendRedirect("/");
			}
		} else {
			response.sendRedirect("/");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
