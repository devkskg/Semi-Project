package com.lumodiem.account.service;

import static com.lumodiem.common.sql.SqlSessionTemplate.getSqlSession;
import static com.lumodiem.common.sql.SqlSessionTemplate.commitRollback;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.account.dao.HostMypageDao;
import com.lumodiem.board.hostboard.vo.Klass;

public class HostMypageService {

	public List<Klass> selectStayListByHostAccountNo(Klass option) {
		SqlSession session = getSqlSession();
		List<Klass> list = new HostMypageDao().selectStayListByHostAccountNo(session, option);
		return list;
	}

	public List<Klass> selectApproveListByHostAccountNo(Klass option) {
		SqlSession session = getSqlSession();
		List<Klass> list = new HostMypageDao().selectApproveListByHostAccountNo(session, option);
		return list;
	}
	
}
