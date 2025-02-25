package com.lumodiem.board.hostboard.service;

import static com.lumodiem.common.sql.SqlSessionTemplate.getSqlSession;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.hostboard.dao.HostBoardDao;
import com.lumodiem.board.hostboard.vo.Klass;

public class HostBoardService {

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
