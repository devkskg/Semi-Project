package com.lumodiem.common.secure;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

import com.lumodiem.account.vo.Account;

public class SecureTemplate {
//	보류 - 유틸리티 클래스를 사용화는 방법으로 해볼까?
//	public static void secureMethod(int accountNo, String accountGrade) {
//		HttpSession session = request.getSession();
//		Account account = null;
//		String urlPath = "/";
//		
//		if(session != null && session.getAttribute("account") != null) {
//			account = (Account)session.getAttribute("account");
//			String accountGrade = account.getAccountGrade();
//			if("H".equals(accountGrade)) {
//				urlPath = "/views/mypage/hostmypage.jsp";
//				RequestDispatcher view = request.getRequestDispatcher(urlPath);
//				view.forward(request, response);
//			} else {
//				response.sendRedirect("/");
//			}
//		} else {
//			response.sendRedirect("/");
//		}
//	}
}
