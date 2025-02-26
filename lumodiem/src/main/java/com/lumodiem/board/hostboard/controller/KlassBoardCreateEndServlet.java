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
		LocalDateTime ldt = LocalDateTime.now();
		DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		System.out.println(ldt.format(dtf1));
		DateTimeFormatter dtf2 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		System.out.println(ldt.format(dtf2));
		Klass option = Klass.builder()
					.klassName(klassName)
					.accountNickname(accountNickname)
					.klassAddress(klassAddress)
					.klassMax(klassMax)
					.klassPrice(klassPrice)
					.klassTxt(klassTxt)
					.accountNo(accountNo)
					.klassStatus("R")
					.klassRegDate(ldt.format(dtf1))
					.klassModDate(ldt.format(dtf2))
					.build();
		System.out.println(option); // 입력 된 값 확인 출력문 추후에 지울 예정
		int result = new HostBoardService().insertBoard(option);
		
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
