package com.lumodiem.account.service;

import static com.lumodiem.common.sql.SqlSessionTemplate.getSqlSession;
import static com.lumodiem.common.sql.SqlSessionTemplate.commitRollback;;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.hostboard.vo.Klass;

public class HostMypageService {

	public List<Klass> selectListByHostAccountNo(int accountNo) {
		SqlSession session = getSqlSession();
		List<Klass> list = new HostMypageDao().selectListByHostAccountNo(session, accountNo);
		return list;
	}
	
}
