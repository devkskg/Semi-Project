package com.lumodiem.account.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.hostboard.vo.Klass;

public class HostMypageDao {

	public List<Klass> selectListByHostAccountNo(SqlSession session, int accountNo) {
		return session.selectList("klassMapper.klassListSearch", accountNo);
	}

}
