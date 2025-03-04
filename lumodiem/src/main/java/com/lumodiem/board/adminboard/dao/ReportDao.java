package com.lumodiem.board.adminboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.adminboard.vo.ReportKlass;
import com.lumodiem.board.adminboard.vo.ReportReview;
import com.lumodiem.board.adminboard.vo.ReportReviewCmt;
import com.lumodiem.board.hostboard.vo.Klass;

public class ReportDao {
	
	public int deleteReportReviewCmt(int reportReviewCmtNo, SqlSession session) {
		return session.insert("reportMapper.deleteReportReviewCmt",reportReviewCmtNo);
	}
	
	public List<ReportReviewCmt> selectReportReviewCmtList(SqlSession session){
		return session.selectList("reportMapper.selectReportReviewCmt");
	}
	
	public int deleteReportReview(int reportReviewNo, SqlSession session) {
		return session.insert("reportMapper.deleteReportReview",reportReviewNo);
	}
	
	public List<ReportReview> selectReportReviewList(SqlSession session){
		return session.selectList("reportMapper.selectReportReview");
		
	}
	
	public int deleteReportKlass(int klassNo, SqlSession session) {
		return session.insert("reportMapper.deleteReportKlass",klassNo);
	}
		
	
//	public List<ReportKlass> selectReportKlassList (int reportKlassNo, SqlSession session){
//		return session.selectList("reportMapper.reportKlassSelect", reportKlassNo);
//	}
	
	public ReportKlass selectReportKlassOne(ReportKlass klass,SqlSession session) {
		return session.selectOne("reportMapper.reportKlassOne",klass);
	}
	
	public List<ReportKlass> selectReportKlassList (ReportKlass option,SqlSession session){
		return session.selectList("reportMapper.selectReportKlass",option);
	}
}
