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
import com.lumodiem.board.hostboard.vo.KlassDate;

@WebServlet("/cnclReservation")
public class CnclReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CnclReservationServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int resNo = Integer.parseInt(request.getParameter("res_no"));
		int klassDateNo = Integer.parseInt(request.getParameter("klass_date_no"));
		int accountNo = 0;
		int result = 0;
		KlassDate option = KlassDate.builder().klassDateNo(klassDateNo).build();
		KlassDate kd = new HostBoardService().klassCountByKlassMax(option);
		Account ac = null;
		HttpSession session = request.getSession();
		if(session != null && session.getAttribute("account") != null) {
			ac = (Account)session.getAttribute("account");
			accountNo = ac.getAccountNo();
		}
		result = new HostBoardService().cnclReservation(resNo);
		
		JSONObject obj = new JSONObject();
		if(result > 0) {
			obj.put("res_code","200");
			obj.put("res_msg", "정상적으로 게시글 삭제");
		}else {
			obj.put("res_code","500");
			obj.put("res_msg", "게시글 삭제 중 오류가 발생");
		}
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
