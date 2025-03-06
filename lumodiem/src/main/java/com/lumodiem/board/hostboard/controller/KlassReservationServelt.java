package com.lumodiem.board.hostboard.controller;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.lumodiem.account.vo.Account;
import com.lumodiem.board.hostboard.service.HostBoardService;
import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.hostboard.vo.KlassDate;
import com.lumodiem.board.memberboard.vo.Reservation;

@WebServlet("/klassReservation")
public class KlassReservationServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// 우리 어플리케이션 전용 REST_API_KEY
	private static final String KAKAO_API_KEY = "e1a4d3ee6c12a15b4925fa7069e0b3c3";
	// 테스트 CID(이렇게 써야 카카오에서 테스트 정보인지 확인 가능)
    private static final String CID = "TC0ONETIME";
       
    public KlassReservationServelt() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
				.klassDateNo(klassDateNo)
				.resPpl(resPpl)
				.accountNo(accountNo)
				.build();
		int count = 0;
		res = new HostBoardService().resSelect(reservation);
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
		
		
		Klass klassPayment = new HostBoardService().selectKlassOne(klassNo);
		Reservation resPayment = new HostBoardService().selectReservationOne(klassDate);
		
//		카카오로 보내는 url
		URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
//		url 연결?(터널 뚫기)
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", "KakaoAK " + KAKAO_API_KEY);
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
        conn.setDoOutput(true);
		
        
        
// 		요청 데이터 설정
        String params = "cid=" + CID + // 가맹 코드
			        "&partner_order_id=" + resPayment.getResNo() + // 주문번호 res_no
			        "&partner_user_id=" + ac.getAccountId() + // 사용자ID account_id
			        "&item_name=" + klassPayment.getKlassName() + // 상품명 klass_name
			        "&quantity=" + resPayment.getResPpl() + // 상품 개수 res_ppl
			        "&total_amount=10000" + (resPayment.getResPpl() * klassPayment.getKlassPrice()) + // 최종 결제 금액 res_ppl * klass_price
			        "&vat_amount=0" + // vat 부가세
			        "&tax_free_amount=0" + // 면세 금액
			        "&approval_url=http://localhost:8080/pay/success" + // 결제 성공시 이동 url
			        "&cancel_url=http://localhost:8080/pay/cancel" + // 결제 취소시 이동 rul
			        "&fail_url=http://localhost:8080/pay/fail"; // 결제 실패시 이동 url
        
        OutputStream os = conn.getOutputStream();
        os.write(params.getBytes());
        os.flush();
        os.close();
        
//      응답 받는 곳
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder sb = new StringBuilder();
        String line;
        while((line = br.readLine()) != null) {
        	sb.append(line);
        }
        
        br.close();
        String responseText = sb.toString().trim();
        JSONParser parser = new JSONParser();
        
        JSONObject paymentResponse = null;
        try {
        	paymentResponse = (JSONObject) parser.parse(responseText);
		} catch (ParseException e) {
			e.printStackTrace();
		}
        
        // 응답 JSON을 클라이언트에 반환 // res_code 등이랑 같이 보내야 하니 주석!
//        response.setContentType("application/json");
//        response.getWriter().write(responseText);  		
		
		
		
		
		
		
		
		
		
		
		
		JSONObject obj = new JSONObject();
		obj.put("paymentResponse", paymentResponse);
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
