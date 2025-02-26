package com.lumodiem.account.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.hostboard.vo.Klass;

public class HostMypageDao {

	public List<Klass> selectListByHostAccountNo(SqlSession session, int accountNo) {
//		List<Klass> list = session.selectOne("", accountNo);
//		윤아님 mapper PR 완료 후 진행하기. 안 그러면 conflict!
		return null;
	}

}
