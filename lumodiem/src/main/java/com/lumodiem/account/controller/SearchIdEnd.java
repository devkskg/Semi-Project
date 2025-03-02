package com.lumodiem.account.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.lumodiem.account.service.AccountService;
import com.lumodiem.account.vo.Account;

@WebServlet("/searchIdEnd")
public class SearchIdEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchIdEnd() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Account account = null;
		Account searchAccount = null;
		
		if(session != null && session.getAttribute("account") != null) {
			response.sendRedirect("/");
		} else {
			String accountName = request.getParameter("account_name");
			String accountSsn = request.getParameter("account_ssn");
			if(accountName != null && accountSsn != null) {
				account = Account.builder()
				.accountName(accountName)
				.accountSsn(accountSsn)
				.build();
				searchAccount = new AccountService().searchIdByNameSsn(account);
			} else {
				response.sendRedirect("/");
			}
			
			
			JSONObject obj = new JSONObject();
			
			obj.put("res_code", "500");
			obj.put("res_msg", "아이디 찾기중 오류가 발생했습니다.");
			
			if(searchAccount != null) {
				obj.put("res_code", "200");
				obj.put("res_msg", "아이디 찾기를 완료했습니다.");
				
//				RequestDispatcher view = request.getRequestDispatcher(request.getContextPath()+"/views/account/searchIdSuccess.jsp");
//				view.forward(request, response);
			} else {
//				response.sendRedirect(request.getContextPath()+"/views/account/searchIdFail.jsp");
			}
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().print(obj);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
