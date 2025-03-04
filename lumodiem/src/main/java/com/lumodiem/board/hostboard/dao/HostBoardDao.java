package com.lumodiem.board.hostboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.hostboard.vo.KlassAttach;
import com.lumodiem.board.hostboard.vo.KlassDate;
import com.lumodiem.board.hostboard.vo.KlassMapping;
import com.lumodiem.board.memberboard.vo.Review;

public class HostBoardDao {
	
	public int deleteKlassOne(SqlSession session, Klass klass) {
		return session.delete("klassMapper.klassDelete",klass);
	}
	
	public int updateKlassAttach(SqlSession session, KlassAttach a) {
		int result = session.update("klassMapper.klassAttachUpdate",a);
		return result;
	}
	
//	public int updateKlassDate(SqlSession session, KlassDate klassDate) {
//		int result = session.update("klassMapper.klassDateUpdate",klassDate);
//		return result;
//	}
	
	public int updateKlass(SqlSession session, Klass option) {
		int result = session.update("klassMapper.klassUpdate",option);
		return result;
	}
	
	public List<KlassDate> selectKlassDate(SqlSession session, int klassNo) {
		return session.selectList("klassMapper.klassDateList",klassNo);
	}
	
	public KlassAttach selectAttachOne(SqlSession session, int attachNo) {
		return session.selectOne("klassMapper.attachOne",attachNo);
	}
	
	public Klass selectKlassOne(SqlSession session, int klassNo) {
		return session.selectOne("klassMapper.klassOne",klassNo);
	}
	
	public List<Review> selectReviewByKlass(SqlSession session, int klassNo){
		return session.selectList("klassMapper.klassReviewList",klassNo);
	}
	
	public List<KlassAttach> selectAttachList(SqlSession session, int klassNo) {
		return session.selectList("klassMapper.klassAttachList",klassNo);
	}
	
	public List<Klass> searchBoardList(SqlSession session, Klass option){
		return session.selectList("klassMapper.klassList",option);
	}
	
	public int insertKlassDate(SqlSession session, KlassDate klassDate) {
		int result = session.insert("klassMapper.klassDateCreate",klassDate);
		return result;
	}
       
	public int insertBoard(SqlSession session, Klass option) {
		int klassNo = session.insert("klassMapper.klassCreate",option);
		return option.getKlassNo();
	}
	
	public int insertKlassAttach(SqlSession session, KlassAttach a) {
		int result = session.insert("klassMapper.klassAttachCreate",a);
		return result;
	}
	
	public int insertKlassMapping(SqlSession session, KlassMapping m) {
		int result = session.insert("klassMapper.klassMappingCreate",m);
		return result;
	}

	
}
