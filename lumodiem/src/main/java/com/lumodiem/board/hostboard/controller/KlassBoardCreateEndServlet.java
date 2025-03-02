package com.lumodiem.board.hostboard.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.lumodiem.board.hostboard.service.HostBoardService;
import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.hostboard.vo.KlassDate;

@WebServlet("/klassBoardCreateEnd")
public class KlassBoardCreateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KlassBoardCreateEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String klassName = request.getParameter("klass_name");
		String accountNickname = request.getParameter("account_nickname");
		String klassAddress = request.getParameter("klass_address");
		int klassMax = Integer.parseInt(request.getParameter("klass_max"));
		int klassPrice = Integer.parseInt(request.getParameter("klass_price"));
		String klassTxt = request.getParameter("klass_txt");
		int accountNo = Integer.parseInt(request.getParameter("account_no"));
		String klassOfDate = request.getParameter("klass_date");
		String klassStart = request.getParameter("klass_start");
		String klassEnd = request.getParameter("klass_end");
		
		// klass_date 테이블에 저장될 문자열로 합치는 과정
		String klassStartFull = klassOfDate + " " + klassStart + ":00";
		String klassEndFull = klassOfDate + " " + klassEnd + ":00";
		
		LocalDateTime ldt = LocalDateTime.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		Klass option = Klass.builder()
					.klassName(klassName)
					.accountNickname(accountNickname)
					.klassAddress(klassAddress)
					.klassMax(klassMax)
					.klassPrice(klassPrice)
					.klassTxt(klassTxt) 
					.accountNo(accountNo)
					.klassStatus("R")
					.klassRegDate(ldt.format(dtf))
					.klassModDate(ldt.format(dtf))
					.build();
		System.out.println("klass : "+option); // 입력 된 값 확인 출력문 추후에 지울 예정
		
		KlassDate klassDate = KlassDate.builder()
				.klassStart(klassStartFull)
				.klassEnd(klassEndFull)
				.build();
		
		System.out.println("date" + klassDate);
		
		int result = new HostBoardService().insertBoard(option,klassDate);
		
		JSONObject obj = new JSONObject();
		obj.put("res_code", "500");
		obj.put("res_msg", "게시글 등록중 오류가 발생하였습니다.");
		
		if(result > 0) {
			obj.put("res_code", "200");
			obj.put("res_msg", "정상적으로 게시글이 등록되었습니다.");
		}
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
