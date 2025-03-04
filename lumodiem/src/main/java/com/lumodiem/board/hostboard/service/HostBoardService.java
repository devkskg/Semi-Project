package com.lumodiem.board.hostboard.service;

import static com.lumodiem.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.hostboard.dao.HostBoardDao;
import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.hostboard.vo.KlassAttach;
import com.lumodiem.board.hostboard.vo.KlassDate;
import com.lumodiem.board.hostboard.vo.KlassMapping;
import com.lumodiem.board.memberboard.vo.Review;

public class HostBoardService {
	
	public int deleteKlassOne(Klass klass) {
		SqlSession session = getSqlSession();
		int result = new HostBoardDao().deleteKlassOne(session,klass);
		if(result > 0) {
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		return result;
	}
	
	public int updateKlass(Klass option,KlassDate klassDate,KlassAttach a) {
		SqlSession session = getSqlSession();
		int result = 0;
		int updateResult = new HostBoardDao().updateKlass(session, option);
		klassDate.setKlassNo(option.getKlassNo());
		int updateDateResult = new HostBoardDao().updateKlassDate(session,klassDate);
		int updateAttachResult = new HostBoardDao().updateKlassAttach(session,a);
		if(updateResult > 0 && updateDateResult >0 && updateAttachResult > 0) {
			result = 1;
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		return result;
		
	}
	
	public KlassAttach selectAttachOne(int attachNo) {
		SqlSession session = getSqlSession();
		KlassAttach a = new HostBoardDao().selectAttachOne(session,attachNo);
		session.close();
		return a;
	}

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
	
	public List<Review> selectReviewByKlass(int klassNo){
		SqlSession session = getSqlSession();
		List<Review> review = new HostBoardDao().selectReviewByKlass(session,klassNo);
		return review;
	}
	
	public List<KlassAttach> selectAttachList(int klassNo) {
		SqlSession session = getSqlSession();
		List<KlassAttach> klassAttach = new HostBoardDao().selectAttachList(session,klassNo);
		return klassAttach;
	}
	
	public int insertKlassDate(KlassDate klassDate) {
		SqlSession session = getSqlSession();
		int dateResult = new HostBoardDao().insertKlassDate(session,klassDate);
		if(dateResult > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return dateResult;
	}
	
	public int insertBoard(Klass option, KlassDate klassDate,KlassAttach a, KlassMapping m) {
		SqlSession session = getSqlSession();
		int result = 0;
		int klassNo = new HostBoardDao().insertBoard(session, option); 
		klassDate.setKlassNo(klassNo);
		int klassDateNo = new HostBoardDao().insertKlassDate(session, klassDate);
		
		int attachNo = new HostBoardDao().insertKlassAttach(session,a);
		
		m.setKlassNo(option.getKlassNo());
		m.setAttachNo(a.getAttachNo());
		
		int mappingNo = new HostBoardDao().insertKlassMapping(session,m);
		
		if(klassNo > 0 && klassDateNo > 0 && attachNo > 0 && mappingNo > 0) {
			result = 1;
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}

	
}
