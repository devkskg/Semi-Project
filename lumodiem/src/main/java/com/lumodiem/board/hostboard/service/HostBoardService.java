package com.lumodiem.board.hostboard.service;

import static com.lumodiem.common.sql.SqlSessionTemplate.commitRollback;
import static com.lumodiem.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.hostboard.dao.HostBoardDao;
import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.hostboard.vo.KlassAttach;
import com.lumodiem.board.hostboard.vo.KlassDate;
import com.lumodiem.board.hostboard.vo.KlassLike;
import com.lumodiem.board.hostboard.vo.KlassMapping;
import com.lumodiem.board.memberboard.vo.Reservation;
import com.lumodiem.board.memberboard.vo.Review;
import com.lumodiem.board.memberboard.dao.MemberBoardDao;

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
	
	public int updateKlass(Klass option,KlassDate klassDate,KlassAttach a,KlassMapping m) {
		SqlSession session = getSqlSession();
		int result = 0;
		int updateResult = new HostBoardDao().updateKlass(session, option);
//		klassDate.setKlassNo(option.getKlassNo());
		// klassNo 값의 klass_date 를 delete 후 insert 
		int deleteDateResult = new HostBoardDao().deleteDateOne(session,option);
		int insertDateResult = new HostBoardDao().insertKlassDate(session,klassDate);
		
		int deleteAttachResult = new HostBoardDao().deleteAttachOne(session,a);
		int insertAttachResult = new HostBoardDao().insertKlassAttach(session,a);
		m.setAttachNo(insertAttachResult);
		// 추후 attach_no delete되면 mappin_no까지 같이 지워지는 작업 진행 되면 안써도 될 메소드임.
//		int deleteMapResult = new HostBoardDao().deleteMappingOne(session,m);
		int insertMapResult = new HostBoardDao().insertKlassMapping(session, m);
		
		if(updateResult > 0 && deleteDateResult >0 && insertDateResult > 0 
				&& deleteAttachResult > 0 && insertAttachResult > 0 && insertMapResult > 0) {
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

	public KlassAttach selectAttachOneByKlassNo(int klassNo) {
		SqlSession session = getSqlSession();
		KlassAttach result = new HostBoardDao().selectAttachOneByKlassNo(session,klassNo);
		return result;
	}

	public int reserveKlass(int klassDateNo, int resPpl) {
		SqlSession session = getSqlSession();
		int result = 0;
		
		int kd = new HostBoardDao().reserveKlassDate(session,klassDateNo);
		int res = new HostBoardDao().reserveKlassRes(session,resPpl);
		
		if(kd > 0 && res > 0) {
			result = 1;
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		return result;
	}

	public int countLikeByKlassNo(int klassNo) {
		SqlSession session = getSqlSession();
		int count = new HostBoardDao().countLikeByKlassNo(session,klassNo);
		session.close();
		return count;
	}

	public int countLikeByAccountNoKlassNo(KlassLike klassLike) {
		SqlSession session = getSqlSession();
		int count = new HostBoardDao().countLikeByAccountNoKlassNo(session,klassLike);
		session.close();
		return count;
	}

	public int klassUnlikeToLike(KlassLike klassLike) {
		SqlSession session = getSqlSession();
		int result = new HostBoardDao().klassUnlikeToLike(session,klassLike);
		commitRollback(result, session);
		session.close();
		return result;
	}

	public int klassLikeToUnlike(KlassLike klassLike) {
		SqlSession session = getSqlSession();
		int result = new HostBoardDao().klassLikeToUnlike(session,klassLike);
		commitRollback(result, session);
		session.close();
		return result;
	}
	
}
