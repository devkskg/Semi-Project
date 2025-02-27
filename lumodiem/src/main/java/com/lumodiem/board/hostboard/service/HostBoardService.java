package com.lumodiem.board.hostboard.service;

import static com.lumodiem.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.hostboard.dao.HostBoardDao;
import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.hostboard.vo.KlassDate;

public class HostBoardService {
	
	public List<KlassDate> selectKlassDate(int klassNo) {
		SqlSession session = getSqlSession();
		List<KlassDate> klassDate = new HostBoardDao().selectKlassDate(session,klassNo);
		return klassDate;
	}
	
	public Klass selectKlassOne(int klassNo) {
		SqlSession session = getSqlSession();
		Klass klass = new HostBoardDao().selectKlassOne(session,klassNo);
		session.close();
		return klass;
	}
	
	public List<Klass> searchBoardList(Klass option){
		SqlSession session = getSqlSession();
		List<Klass> searchList = new HostBoardDao().searchBoardList(session,option);
		session.close();
		return searchList;
	}
	
	public int insertBoard(Klass option) {
		SqlSession session = getSqlSession();
		int result = new HostBoardDao().insertBoard(session, option);
		if(result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}
	
}
