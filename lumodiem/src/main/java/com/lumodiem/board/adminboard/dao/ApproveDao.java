package com.lumodiem.board.adminboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.hostboard.vo.Klass;

public class ApproveDao {

	public List<Klass> selectApproveList(SqlSession session){
		return session.selectList("approveMapper.approveList");
	}
}
