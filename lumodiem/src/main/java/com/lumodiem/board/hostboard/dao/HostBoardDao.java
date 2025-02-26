package com.lumodiem.board.hostboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.hostboard.vo.Klass;

public class HostBoardDao {
	
	public List<Klass> searchBoardList(SqlSession session, Klass option){
		return session.selectList("klassMapper.klassListSearch",option);
	}
       
	public int insertBoard(SqlSession session, Klass option) {
		int result = session.insert("klassMapper.klassCreate",option);
		return result;
	}
	
	
}
