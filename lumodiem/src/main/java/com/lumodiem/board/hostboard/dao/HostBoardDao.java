package com.lumodiem.board.hostboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.hostboard.vo.KlassDate;

public class HostBoardDao {
	
	public int deleteKlassOne(SqlSession session, Klass klass) {
		return session.delete("klassMapper.klassDelete",klass);
	}
	
	public int updateKlass(SqlSession session, Klass option) {
		int result = session.update("klassMapper.klassUpdate",option);
		return result;
	}
	
	public List<KlassDate> selectKlassDate(SqlSession session, int klassNo) {
		return session.selectList("klassMapper.klassDateList",klassNo);
	}
	
	public Klass selectKlassOne(SqlSession session, int klassNo) {
		return session.selectOne("klassMapper.klassOne",klassNo);
	}
	
	public List<Klass> searchBoardList(SqlSession session, Klass option){
		return session.selectList("klassMapper.klassList",option);
	}
	
	public int insertKlassDate(SqlSession session, KlassDate klassDate) {
		int result = session.insert("klassMapper.klassDateCreate",klassDate);
		return result;
	}
       
	public int insertBoard(SqlSession session, Klass option) {
		int result = session.insert("klassMapper.klassCreate",option);
		return result;
	}
	
	
}
