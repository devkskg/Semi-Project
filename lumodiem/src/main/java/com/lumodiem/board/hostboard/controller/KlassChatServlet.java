package com.lumodiem.board.hostboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.lumodiem.account.vo.Account;
import com.lumodiem.board.hostboard.service.HostBoardService;


@WebServlet("/klassChat")
public class KlassChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KlassChatServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int result = 0;
		String chatTxt = null;
		String temp = null;
		int klassAccountNo = 0;
//		String accountGrade = null;
		Account account = null;
		if(session != null && session.getAttribute("account") != null) {
			account = (Account)session.getAttribute("account");
			chatTxt = request.getParameter("chatTxt");
			temp = request.getParameter("klassAccountNo");
//			accountGrade = account.getAccountGrade();
			if(chatTxt != null && "".equals(chatTxt) == false) {
				if(temp != null) {
					klassAccountNo = Integer.parseInt(temp);
					if(klassAccountNo == account.getAccountNo()) {
//						클래스 주최자 = 로그인한 사용자
						chatTxt = "(Host)" + account.getAccountNickname() + " : " + chatTxt;
					} else {
//						그 외
						chatTxt = "(Member)" + account.getAccountNickname() + " : " + chatTxt;
					}
					result = new HostBoardService().insertKlassChat(chatTxt);
				}
				
			}
			
			
			JSONObject obj = new JSONObject();
			obj.put("res_code", "500");
			obj.put("res_msg", "비정상 작동");
			if(result > 0) {
				obj.put("res_code", "200");
				obj.put("res_msg", "정상 작동");
			}
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().print(obj);
		} else {
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
