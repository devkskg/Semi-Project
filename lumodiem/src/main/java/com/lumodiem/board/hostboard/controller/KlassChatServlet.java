package com.lumodiem.board.hostboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;


@WebServlet("/klassChat")
public class KlassChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KlassChatServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int result = 0;
		if(session != null && session.getAttribute("account") != null) {
			
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
