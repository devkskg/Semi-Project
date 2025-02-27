package com.lumodiem.board.adminboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.adminboard.vo.ReportKlass;

public class ReportDao {
	
	public List<ReportKlass> selectReportKlassList (int reportKlassNo, SqlSession session){
		return session.selectList("reportMapper.reportKlassSelect", reportKlassNo);
	}
	public List<ReportKlass> selectReportKlassList (SqlSession session){
		return session.selectList("reportMapper.reportKlassSelect");
	}
}
