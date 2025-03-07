package com.lumodiem.board.hostboard.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
import com.lumodiem.board.memberboard.vo.Reservation;

@WebServlet("/klassReservation")
public class KlassReservationServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KlassReservationServelt() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LocalDateTime ldt = LocalDateTime.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		int resNo = Integer.parseInt(request.getParameter("res_no"));
		int klassDateNo = Integer.parseInt(request.getParameter("klass_date_no"));
		int resPpl = Integer.parseInt(request.getParameter("res_ppl"));
		int klassNo = Integer.parseInt(request.getParameter("klass_no"));
		int accountNo = 0;
		int klassDate = 0;
		List<Reservation> res = null;
		KlassDate option = KlassDate.builder().klassDateNo(klassDateNo).klassNo(klassNo).build();
		KlassDate kd = new HostBoardService().klassCountByKlassMax(option);
		Account ac = null;
		HttpSession session = request.getSession();
		if(session != null && session.getAttribute("account") != null) {
			ac = (Account)session.getAttribute("account");
			accountNo = ac.getAccountNo();
		}

		// 예약테이블 account_no 랑 klass_date 테이블에서 account_no 랑 비교해서 같으면 예약X
		
		Reservation reservation = Reservation.builder()
				.resNo(resNo)
				.klassDateNo(klassDateNo)
				.resPpl(resPpl)
				.accountNo(accountNo)
				.build();
		
		request.setAttribute("reservation", reservation);
		RequestDispatcher view = request.getRequestDispatcher("/views/klass/klassDetail.jsp");
		view.forward(request, response);
		
		int count = 0;
		LocalDateTime klassTimeStart =  LocalDateTime.parse(kd.getKlassStart(),dtf);
		res = new HostBoardService().resSelect(reservation);
		if(klassTimeStart.isAfter(ldt)) {
			if((kd.getKlassMax()-kd.getKlassCount()) >= resPpl) {
				if(!res.isEmpty()) {
					for(int i = 0; i < res.size(); i++) {
						if (res.get(i).getKlassDateNo() == kd.getKlassDateNo()) {
							count++;
						}
					}
				}
				if(count == 0) {
					klassDate = new HostBoardService().reserveKlass(reservation);
				} else {
//				count 1인 경우 이미 같은 시간대 예약 했음.
				}
				
			}
			
		}
		JSONObject obj = new JSONObject();
		if(klassDate > 0) {
			obj.put("res_code","200");
			obj.put("res_msg", "예약이 완료 되었습니다");
		}else {
			obj.put("res_code","500");
			obj.put("res_msg", "예약시도중 문제가 발생하였습니다.");
		}
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
