package com.lumodiem.account.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.hostboard.vo.Klass;

public class HostMypageDao {

	public List<Klass> selectStayListByHostAccountNo(SqlSession session, Klass option) {
		return session.selectList("mypageMapper.stayKlassListSearch", option);
	}

	public List<Klass> selectApproveListByHostAccountNo(SqlSession session, Klass option) {
		return session.selectList("mypageMapper.approveKlassListSearch", option);
	}

}
