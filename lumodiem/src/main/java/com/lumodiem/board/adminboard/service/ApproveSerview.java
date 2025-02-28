package com.lumodiem.board.adminboard.service;

import static com.lumodiem.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.adminboard.dao.ApproveDao;
import com.lumodiem.board.hostboard.vo.Klass;

public class ApproveSerview {
	ApproveDao dao = new ApproveDao();
	
	public List<Klass> selectApproveList (){
		SqlSession session = getSqlSession();
		List<Klass> resultList = dao.selectApproveList(session);
		session.close();
		return resultList;
	}
}
