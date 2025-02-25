package com.lumodiem.board.hostboard.dao;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.hostboard.vo.Klass;

public class HostBoardDao {
       
	public int insertBoard(SqlSession session, Klass option) {
		int result = session.insert("klassMapper.klassCreate",option);
		return result;
	}
	
	
}
