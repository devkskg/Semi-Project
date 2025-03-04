package com.lumodiem.board.hostboard.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONObject;

import com.lumodiem.board.hostboard.service.HostBoardService;
import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.hostboard.vo.KlassAttach;
import com.lumodiem.board.hostboard.vo.KlassDate;
import com.lumodiem.board.hostboard.vo.KlassMapping;

@WebServlet("/klassBoardUpdateEnd")
public class KlassBoardUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KlassBoardUpdateEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LocalDateTime ldt = LocalDateTime.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		
		KlassAttach a = new KlassAttach();
		
		Klass option = new Klass();
		
		KlassMapping m = new KlassMapping();
		
		KlassDate klassDate = new KlassDate();
		String klassOfDate = "";
		
		KlassAttach atc = null;
		
		String path ="C:\\dev\\lumodiem\\file\\klassattach";
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(dir);
		factory.setSizeThreshold(1024*1024*10);
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			List<FileItem> items = upload.parseRequest(request);
			for(int i = 0; i < items.size(); i++) {
				FileItem fileItem = items.get(i);
				if(fileItem.isFormField()) {
					switch(fileItem.getFieldName()) {
					case "klass_date" : klassOfDate += fileItem.getString("UTF-8");break;
					}
					
					switch(fileItem.getFieldName()) {
						case "klass_name" : option.setKlassName(fileItem.getString("UTF-8"));break;
						case "account_nickname" : option.setAccountNickname(fileItem.getString("UTF-8"));break;
						case "klass_address" : option.setKlassAddress(fileItem.getString("UTF-8"));break;
						case "klass_max" : option.setKlassMax(Integer.parseInt(fileItem.getString("UTF-8")));break;
						case "klass_price" : option.setKlassPrice(Integer.parseInt(fileItem.getString("UTF-8")));break;
						case "klass_txt" : option.setKlassTxt(fileItem.getString("UTF-8"));break;
						case "account_no" : option.setAccountNo(Integer.parseInt(fileItem.getString("UTF-8")));break;
						case "klass_start" : klassDate.setKlassStart(klassOfDate + " " + fileItem.getString("UTF-8") + ":00");
							option.setKlassStart(fileItem.getString("UTF-8"));break;
						case "klass_end" : klassDate.setKlassEnd(klassOfDate + " " + fileItem.getString("UTF-8") + ":00");
							option.setKlassEnd(fileItem.getString("UTF-8"));break;
						case "klass_no" : option.setKlassNo(Integer.parseInt(fileItem.getString("UTF-8")));
										klassDate.setKlassNo(Integer.parseInt(fileItem.getString("UTF-8"))); 
										atc = new HostBoardService().selectAttachOneByKlassNo(Integer.parseInt(fileItem.getString("UTF-8")));
										break;
						default : option.setKlassModDate(ldt.format(dtf)); break;
					}
				}else {
					if(fileItem.getSize() > 0) {
						String oriName = fileItem.getName();
						int idx = oriName.lastIndexOf(".");
						String ext = oriName.substring(idx);
						
						String uuid = UUID.randomUUID().toString().replace("-", "");
						String newName = uuid+ext;
						
						File uploadFile = new File(dir,newName);
						fileItem.write(uploadFile);
						
						
						
						a = KlassAttach.builder()
							.attachOri(oriName)
							.attachNew(newName)
							.attachPath(path+"\\"+newName).build();
					}
					
				}
			}
			
			
			a.setAttachNo(atc.getAttachNo());
//			m.setAttachNo(atc.getAttachNo());
			m.setKlassNo(option.getKlassNo());
			System.out.println("klass : "+option); // 입력 된 값 확인 출력문 추후에 지울 예정
			System.out.println("date : " + klassDate);
			System.out.println("날짜"+klassOfDate);
			System.out.println("attach : " +a);
			System.out.println("mapping : "+m);
			int result = new HostBoardService().updateKlass(option,klassDate,a,m);
			
			JSONObject obj = new JSONObject();
			
			if(result > 0) {
				obj.put("res_code", "200");
				obj.put("res_msg", "정상적으로 게시글이 등록되었습니다.");
			}else {
				obj.put("res_code", "500");
				obj.put("res_msg", "게시글 등록중 오류가 발생하였습니다.");
				String deletePath = a.getAttachPath();
				File deleteFile = new File(deletePath);
				if(deleteFile.exists()) {
					deleteFile.delete();
				}
				
			}
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(obj);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
//		int accountNo = Integer.parseInt(request.getParameter("account_no"));
//		String klassName = request.getParameter("klass_name");
//		String accountNickname = request.getParameter("account_nickname");
//		String klassAddress = request.getParameter("klass_address");
//		int klassMax = Integer.parseInt(request.getParameter("klass_max"));
//		int klassPrice = Integer.parseInt(request.getParameter("klass_price"));
//		int klassNo = Integer.parseInt(request.getParameter("klass_no"));
//		String klassTxt = request.getParameter("klass_txt");
//		String klassOfDate = request.getParameter("klass_date");
//		String klassStart = request.getParameter("klass_start");
//		String klassEnd = request.getParameter("klass_end");
//		
//		String klassStartFull = klassOfDate + " " + klassStart + ":00";
//		String klassEndFull = klassOfDate + " " + klassEnd + ":00";
//		
//		LocalDateTime ldt = LocalDateTime.now();
//		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
//		
//		Klass option = Klass.builder()
//				.accountNo(accountNo)
//				.klassName(klassName)
//				.accountNickname(accountNickname)
//				.klassAddress(klassAddress)
//				.klassMax(klassMax)
//				.klassPrice(klassPrice)
//				.klassTxt(klassTxt)
//				.klassNo(klassNo)
//				.klassModDate(ldt.format(dtf))
//				.build();
//		
//		System.out.println(klassStartFull +"+"+klassEndFull);
//		
//		KlassDate klassDate = new KlassDate();
//		KlassDate.builder()
//		.klassDateNo(klassNo)
//		.klassStart(klassStartFull)
//		.klassEnd(klassEndFull)
//		.klassNo(klassNo)
//		.build();
//		
//		System.out.println("Update option:" + option);
//		System.out.println("Update klassDate : "+klassDate);
//		int result = new HostBoardService().updateKlass(option,klassDate);
//		
//		
//		JSONObject obj = new JSONObject();
//		obj.put("res_code", "500");
//		obj.put("res_msg", "게시글 수정중 오류가 발생하였습니다.");
//		
//		if(result > 0) {
//		obj.put("res_code", "200");
//		obj.put("res_msg", "정상적으로 게시글이 수정되었습니다.");
//		}
//		response.setContentType("application/json; charset=utf-8");
//		response.getWriter().print(obj);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
