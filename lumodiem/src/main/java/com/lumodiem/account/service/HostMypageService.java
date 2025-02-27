package com.lumodiem.account.service;

import static com.lumodiem.common.sql.SqlSessionTemplate.getSqlSession;
import static com.lumodiem.common.sql.SqlSessionTemplate.commitRollback;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.account.dao.HostMypageDao;
import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.memberboard.vo.Reservation;
import com.lumodiem.board.memberboard.vo.Review;

public class HostMypageService {

	public List<Klass> selectApproveListByHostAccountNo(Klass option) {
		SqlSession session = getSqlSession();
		List<Klass> list = new HostMypageDao().selectApproveListByHostAccountNo(session, option);
		return list;
	}

	public List<Review> selectReviewListByHostAccountNo(Klass option) {
		SqlSession session = getSqlSession();
		List<Review> list = new HostMypageDao().selectReviewListByHostAccountNo(session, option);
		return list;
	}


	
	
	
}
