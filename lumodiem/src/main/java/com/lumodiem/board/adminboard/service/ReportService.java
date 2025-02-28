package com.lumodiem.board.adminboard.service;

import static com.lumodiem.common.sql.SqlSessionTemplate.commitRollback;
import static com.lumodiem.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.adminboard.dao.ReportDao;
import com.lumodiem.board.adminboard.vo.ReportKlass;
import com.lumodiem.board.adminboard.vo.ReportReview;
import com.lumodiem.board.adminboard.vo.ReportReviewCmt;

public class ReportService {
	ReportDao dao = new ReportDao();
	
	
	
	public List<ReportReviewCmt> selectReportReviewCmtList(){
		SqlSession session = getSqlSession();
		List<ReportReviewCmt> resultList = dao.selectReportReviewCmtList(session);
		session.close();
		return resultList;
	}
	
	public int deleteReportReview(int reportReviewNo) {
		SqlSession session = getSqlSession();
		int result = dao.deleteReportReview(reportReviewNo, session);
		commitRollback(session, result);
		session.close();
		return result;
	}
	
	public List<ReportReview> selectReportReviewList(){
		SqlSession session = getSqlSession();
		List<ReportReview> resultList = dao.selectReportReviewList(session);
		session.close();
		return resultList;
	}
	
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
