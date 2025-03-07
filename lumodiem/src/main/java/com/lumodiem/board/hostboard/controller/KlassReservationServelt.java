package com.lumodiem.board.hostboard.controller;

import java.io.IOException;
<<<<<<< HEAD
=======
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
>>>>>>> refs/heads/develop
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
		int klassDateNo = Integer.parseInt(request.getParameter("klass_date_no"));
		int resPpl = Integer.parseInt(request.getParameter("res_ppl"));
		int klassNo = Integer.parseInt(request.getParameter("klass_no"));
		int accountNo = 0;
		int klassDate = 0;
		List<Reservation> res = null;
		KlassDate option = KlassDate.builder().klassDateNo(klassDateNo).klassNo(klassNo).build();
		System.out.println(option);
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
			
<<<<<<< HEAD
=======
		
		
		
		Klass klassPayment = new HostBoardService().selectKlassOne(klassNo);
		Reservation resPayment = new HostBoardService().selectReservationOne(klassDate);
		session.setAttribute("res_no", resPayment.getResNo());
		
//		카카오로 보내는 url
		URL url = new URL("https://open-api.kakaopay.com/online/v1/payment/ready");
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization", "SECRET_KEY " + KAKAO_API_KEY);
//		conn.setRequestProperty("Authorization", "KakaoAK " + KAKAO_API_KEY);
		
		conn.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
		conn.setDoOutput(true);
		

        
        String orderId = String.valueOf(resPayment.getResNo());
// 		요청 데이터 설정
		JSONObject jsonParams = new JSONObject();
		jsonParams.put("cid", CID);
        jsonParams.put("partner_order_id", orderId);
        session.setAttribute("partner_order_id", orderId);
        jsonParams.put("partner_user_id", ac.getAccountId());
        session.setAttribute("partner_user_id", ac.getAccountId());
        jsonParams.put("item_name", klassPayment.getKlassName());
        jsonParams.put("quantity", resPayment.getResPpl());
        jsonParams.put("total_amount", (resPayment.getResPpl() * klassPayment.getKlassPrice()));
        jsonParams.put("vat_amount", "0");
        jsonParams.put("tax_free_amount", "0");
//        jsonParams.put("approval_url", "http://localhost:8090/pay/approve");
//        String approvalUrl = URLEncoder.encode("http://localhost:8090/pay/success", "UTF-8");
//        String cancelUrl = URLEncoder.encode("http://localhost:8090/pay/cancel", "UTF-8");
//        String failUrl = URLEncoder.encode("http://localhost:8090/pay/fail", "UTF-8");
//        jsonParams.put("approval_url", approvalUrl);
//        jsonParams.put("cancel_url", cancelUrl);
//        jsonParams.put("fail_url", failUrl);
        jsonParams.put("approval_url", "http://localhost:8090/pay/success");
        jsonParams.put("cancel_url", "http://localhost:8090/pay/cancel");
        jsonParams.put("fail_url", "http://localhost:8090/pay/fail");

		
        
		System.out.println("카카오페이 요청 시작...");
		System.out.println("Authorization 헤더: KakaoAK " + KAKAO_API_KEY);
		System.out.println("요청 URL: " + url);
		System.out.println("JSON 데이터 : " + jsonParams.toJSONString());
		
		try (OutputStream os = conn.getOutputStream()) {
            os.write(jsonParams.toJSONString().getBytes("UTF-8"));
            os.flush();
        }
		
//		
		int responseCode = conn.getResponseCode();
		System.out.println("카카오페이 응답 코드: " + responseCode);

		if (responseCode != 200) {
		    BufferedReader errorReader = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		    StringBuilder errorResponse = new StringBuilder();
		    String errorLine;
		    while ((errorLine = errorReader.readLine()) != null) {
		        errorResponse.append(errorLine);
		    }
		    errorReader.close();

		    System.err.println("카카오페이 요청 실패 응답: " + errorResponse.toString());
		    throw new RuntimeException("카카오페이 요청 실패! 응답 확인 필요.");
>>>>>>> refs/heads/develop
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
