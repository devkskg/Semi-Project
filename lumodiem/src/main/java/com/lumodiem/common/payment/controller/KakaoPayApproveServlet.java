package com.lumodiem.common.payment.controller;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.lumodiem.account.vo.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

@WebServlet("/pay/approve")
public class KakaoPayApproveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KakaoPayApproveServlet() {
        super();
    }
//    	KAKAO_API_KEY, 
	    private static final String SECRET_KEY = "DEV304A343721CE2DA5F9531A21BCB556C7C6F06"; // 카카오 REST API 키
	    private static final String CID = "TC0ONETIME"; // 테스트용 CID
	    private static final String APPROVE_URL = "https://open-api.kakaopay.com/online/v1/payment/approve";
//	    private  String TID = "T1234567890123456789"; // 결제 요청 때 받은 tid 값 (DB에서 불러와야 함)

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String pgToken = request.getParameter("pg_token");
//		if (pgToken == null || pgToken.isEmpty()) {
//            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "pg_token이 없습니다.");
//            return;
//        }
//		
//		HttpSession session = request.getSession();
//        String tid = (String)session.getAttribute("tid");
//        
//        if (tid == null) {
//            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "TID가 없습니다. 결제 요청을 먼저 수행하세요.");
//            return;
//        }
//        
////      카카오 API 주소에 연결하고 Property를 가져오는 거? 등록하는 거?
//        URL url = new URL("https://kapi.kakao.com/v1/payment/approve");
//        HttpURLConnection conn = (HttpURLConnection)url.openConnection();
//        conn.setRequestMethod("POST");
//        conn.setRequestProperty("Authorization", "KakaoAK " + KAKAO_API_KEY);
//        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
//        conn.setDoOutput(true);
//        
//        int resNo = (int)session.getAttribute("res_no");
//        Account account = (Account)session.getAttribute("account");
//        int accountNo = account.getAccountNo();
//        
////      승인 요청 데이터 설정
//        String params = "cid=" + CID +
//                "&tid=" + tid +
//                "&partner_order_id=" + resNo +
//                "&partner_user_id=" + accountNo +
//                "&pg_token=" + pgToken;
//        
//        OutputStream os = conn.getOutputStream();
//        os.write(params.getBytes());
//        os.flush();
//        os.close();
//        
//        // 응답 받기
//        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//        StringBuilder sb = new StringBuilder();
//        String line;
//        while ((line = br.readLine()) != null) {
//            sb.append(line);
//        }
//        br.close();
//        String responseText = sb.toString().trim();
//
//        // JSON 변환
//        JSONParser parser = new JSONParser();
//        JSONObject paymentResponse;
//        try {
//        	paymentResponse = (JSONObject) parser.parse(responseText);
//        } catch (ParseException e) {
//            throw new RuntimeException("JSON 파싱 오류: " + e.getMessage());
//        }
//
//        
//        
//        JSONObject obj = new JSONObject();
//        
//        obj.put("res_code", "500");
//        obj.put("res_msg", "결제에 실패했습니다.");
//        
//        if(paymentResponse != null) {
//        	obj.put("kakao_response", paymentResponse);
//        	obj.put("res_code", "200");
//        	obj.put("res_msg", "결제가 승인되었습니다.");
//        }
//
//        response.setContentType("application/json; charset=utf-8");
//        response.getWriter().print(obj);
		HttpSession session = request.getSession();
		String tid = (String)session.getAttribute("tid");
		String partnerOrderId = (String)session.getAttribute("partner_order_id");
        String partnerUserId = (String)session.getAttribute("partner_user_id");
        String pgToken = request.getParameter("pg_token");
        System.out.println("tid :" + tid);
        System.out.println("partnerOrderId :" + partnerOrderId);
        System.out.println("partnerUserId :" + partnerUserId);
        System.out.println("pgToken :" + pgToken);
        if (tid == null || partnerOrderId == null || partnerUserId == null || pgToken == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "결제 승인에 필요한 정보가 없습니다.");
            return;
        }
        
//      결제 승인 요청하는 Connection
//        URL url = new URL("https://kapi.kakao.com/v1/payment/approve");
        URL url = new URL(APPROVE_URL);
        HttpURLConnection conn = (HttpURLConnection)url.openConnection();
        conn.setRequestMethod("POST");
//        conn.setRequestProperty("Authorization", "KakaoAK " + KAKAO_API_KEY);
		conn.setRequestProperty("Authorization", "SECRET_KEY " + SECRET_KEY);

		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
//        conn.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
        conn.setDoOutput(true);
		
        String params = "cid=TC0ONETIME"
        	    + "&tid=" + tid
        	    + "&partner_order_id=" + URLEncoder.encode(partnerOrderId, "UTF-8")
        	    + "&partner_user_id=" + URLEncoder.encode(partnerUserId, "UTF-8")
        	    + "&pg_token=" + pgToken;
////      JSON에 요청 데이터를 넣기
//        JSONObject jsonParams = new JSONObject();
//        jsonParams.put("cid", CID);
//        jsonParams.put("approve tid", tid);
//        jsonParams.put("partner_order_id", partnerOrderId);
//        jsonParams.put("partner_user_id", partnerUserId);
//        jsonParams.put("pg_token", pgToken);
        
//        System.out.println("카카오페이 승인 요청 JSON 데이터: " + jsonParams.toJSONString());
//      카카오 페이 승인 응답 코드 확인
        int responseCode = conn.getResponseCode();
        System.out.println("카카오페이 승인 응답 코드: " + responseCode);
        if (responseCode != 200) {
        	BufferedReader errorReader = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        	StringBuilder errorResponse = new StringBuilder();
        	String errorLine;
        	while ((errorLine = errorReader.readLine()) != null) {
        		errorResponse.append(errorLine);
        	}
        	errorReader.close();
        	
        	System.err.println("카카오페이 승인 요청 실패 응답: " + errorResponse.toString());
        	throw new RuntimeException("카카오페이 승인 요청 실패! 응답 확인 필요.");
        	
        }
        
//      JSON 데이터 전송
//        try (OutputStream os = conn.getOutputStream()) {
//            os.write(jsonParams.toJSONString().getBytes("UTF-8"));
//            os.flush();
//        }
        OutputStream os = conn.getOutputStream();
        os.write(params.getBytes());
        os.flush();
        os.close();
        
        
        
//      JSON 응답 받기
        StringBuilder sb = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
        }

        System.out.println("카카오페이 승인 응답 데이터: " + sb.toString());

        JSONParser parser = new JSONParser();
        JSONObject approveResponse = null;

        try {
            approveResponse = (JSONObject)parser.parse(sb.toString().trim());
        } catch (ParseException e) {
            System.err.println("JSON 파싱 오류: 응답 데이터를 확인하세요.");
            e.printStackTrace();
            throw new RuntimeException("카카오페이 응답 JSON 파싱 실패", e);
        }
        JSONObject obj = new JSONObject();
        obj.put("res_code", "500");
        obj.put("res_msg", "오류 발생");
        if (approveResponse != null) {
            obj.put("res_code", "200");
            obj.put("res_msg", "정상 결제");
            obj.put("approveResponse", approveResponse); 
        }

        
//      응답 데이터 반환
        response.setContentType("application/json; charset=utf-8");
        response.getWriter().print(obj);
        
        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
