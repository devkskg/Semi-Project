package com.lumodiem.board.hostboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.lumodiem.board.hostboard.service.HostBoardService;
import com.lumodiem.board.hostboard.vo.KlassDate;

@WebServlet("/klassReservation")
public class KlassReservationServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KlassReservationServelt() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int klassDateNo = Integer.parseInt(request.getParameter("klass_date_no"));
		int resPpl = Integer.parseInt(request.getParameter("res_ppl"));
		
		int klassDate = new HostBoardService().reserveKlass(klassDateNo,resPpl);
		
		JSONObject obj = new JSONObject();
		if(klassDate > 0) {
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
