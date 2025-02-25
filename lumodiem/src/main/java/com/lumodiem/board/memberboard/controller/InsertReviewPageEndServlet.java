package com.lumodiem.board.memberboard.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lumodiem.board.hostboard.vo.Klass;

@WebServlet("/insertReviewPageEnd")
public class InsertReviewPageEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertReviewPageEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String path ="C:\\dev\\lumodiem\\file\\memberattach";
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		String name = request.getParameter("klass_name");
		String chat = request.getParameter("klass_txt");
		
		Klass k = Klass.builder();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
