package com.lumodiem.board.adminboard.service;

import static com.lumodiem.common.sql.SqlSessionTemplate.getSqlSession;
import static com.lumodiem.common.sql.SqlSessionTemplate.commitRollback;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.adminboard.dao.ReportDao;
import com.lumodiem.board.adminboard.vo.ReportKlass;

public class ReportService {
	ReportDao dao = new ReportDao();
	
	public int deleteReportKlass(int rk) {
		
		
		SqlSession session = getSqlSession();
		
		int result = dao.deleteReportKlass(rk, session);
		commitRollback(session, result);
		session.close();
		return result;
	}
	
	public List<ReportKlass> selectReportKlassList (int reportKlassNo){
		SqlSession session = getSqlSession();
		List<ReportKlass> resultList = dao.selectReportKlassList(reportKlassNo, session);
		session.close();
		return resultList;
	}
	public List<ReportKlass> selectReportKlassList (){
		SqlSession session = getSqlSession();
		List<ReportKlass> resultList = dao.selectReportKlassList(session);
		session.close();
		return resultList;
	}
	
	
}
