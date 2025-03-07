package com.lumodiem.common.payment.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/wsfwefwefwefwefwfwefwef")
public class KakaoPayReadyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// 우리 어플리케이션 전용 REST_API_KEY
//	private static final String KAKAO_API_KEY = "e1a4d3ee6c12a15b4925fa7069e0b3c3";
	// 테스트 CID(이렇게 써야 카카오에서 테스트 정보인지 확인 가능)
//    private static final String CID = "TC0ONETIME"; 
       
    public KakaoPayReadyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		카카오로 보내는 url
//		URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
//		url 연결?(터널 뚫기)
//        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//		conn.setRequestMethod("POST");
//        conn.setRequestProperty("Authorization", "KakaoAK " + KAKAO_API_KEY);
//        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
//        conn.setDoOutput(true);
		
        
        
// 		요청 데이터 설정
//        String params = "cid=" + CID + // 가맹 코드
//			        "&partner_order_id=order1234" + // 주문번호 res_no
//			        "&partner_user_id=user1234" + // 사용자ID account_id
//			        "&item_name=테스트상품" + // 상품명 klass_name
//			        "&quantity=1" + // 상품 개수 res_ppl
//			        "&total_amount=10000" + // 최종 결제 금액 res_ppl * klass_price
//			        "&vat_amount=0" + // vat 부가세
//			        "&tax_free_amount=0" + // 면세 금액
//			        "&approval_url=http://localhost:8080/pay/success" + // 결제 성공시 이동 url
//			        "&cancel_url=http://localhost:8080/pay/cancel" + // 결제 취소시 이동 rul
//			        "&fail_url=http://localhost:8080/pay/fail"; // 결제 실패시 이동 url
//		
		
		
		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
