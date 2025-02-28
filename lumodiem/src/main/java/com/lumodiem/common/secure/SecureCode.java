package com.lumodiem.common.secure;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lumodiem.account.service.HostMypageService;
import com.lumodiem.account.vo.Account;
import com.lumodiem.board.hostboard.vo.Klass;

@WebServlet("/secureTemplate")
public class SecureCode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SecureCode() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Account account = null;
		String urlPath = "/";
		
		Klass option = null;
		List<Klass> list = null;
		
//		조건1 : 세션과 세션의 계정(로그인) 정보가 있어야한다.
		if(session != null && session.getAttribute("account") != null) {
			account = (Account)session.getAttribute("account");
			int accountNo = account.getAccountNo();
			option = Klass.builder().accountNo(accountNo).build();
			
//			조건2 : 세션의 계정 정보가 올바른 값이어야한다.
			if(option != null) {
				list = new HostMypageService().();
				request.setAttribute("", ); 
				
				urlPath = request.getContextPath()+"/.jsp";
				RequestDispatcher view = request.getRequestDispatcher(urlPath);
				view.forward(request, response);
//			예외1 : 세션의 계정 정보가 올바르지 않은 경우 홈 화면으로 보낸다.
			} else {
				response.sendRedirect("/");
			}
//		예외2 : 세션과 세션의 계정(로그인) 정보가 없는 경우 홈 화면으로 보낸다.
		} else {
			response.sendRedirect("/");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
