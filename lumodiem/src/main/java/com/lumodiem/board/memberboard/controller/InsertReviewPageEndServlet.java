package com.lumodiem.board.memberboard.controller;

import java.io.File;
import java.io.IOException;
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

import com.lumodiem.board.memberboard.service.MemberBoardService;
import com.lumodiem.board.memberboard.vo.Review;
import com.lumodiem.board.memberboard.vo.ReviewAttach;

@WebServlet("/insertReviewPageEnd")
public class InsertReviewPageEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertReviewPageEndServlet() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Review r = new Review();
		ReviewAttach a = new ReviewAttach();
		
		String path ="C:\\dev\\lumodiem\\file\\memberattach";
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
			for(int i = 0; i<items.size(); i++) {
				FileItem fileItem = items.get(i);
				if(fileItem.isFormField()) {
					switch(fileItem.getFieldName()) {
					case"review_name": r.setReviewName(fileItem.getString("utf-8"));break;
					case"review_txt": r.setReviewTxt(fileItem.getString("utf-8"));break;
					}
				}else {
					if(fileItem.getSize() > 0) {
						String oriName = fileItem.getName();
						int idx = oriName.lastIndexOf(".");
						String ext = oriName.substring(idx);
						
						String uuid = UUID.randomUUID().toString().replace("-","");
						String newName = uuid+ext;
						
						File uploadFile = new File(dir,newName);
						fileItem.write(uploadFile);
						
						a.setAttachOri(oriName);
						a.setAttachNew(newName);
						a.setAttachPath(path+"\\"+newName);
					}
				}
			}
			// 잘들어갔는지 확인용도
			System.out.println(r);
			System.out.println(a);
			
			int result = new MemberBoardService().insertReview(r,a);
			
			JSONObject obj = new JSONObject();
			if(result > 0) {
				obj.put("res_code","200");
				obj.put("res_msg", "정상적으로 게시글 등록");
			}else {
				obj.put("res_code","500");
				obj.put("res_msg", "게시글 등록 중 오류가 발생");
				String deletePath = a.getAttachPath();
				File deleteFile = new File(deletePath);
				if(deleteFile.exists()) {
					deleteFile.delete();
				}
			}
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().print(obj);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
