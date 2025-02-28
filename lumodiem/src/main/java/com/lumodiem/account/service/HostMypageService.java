package com.lumodiem.account.service;

import static com.lumodiem.common.sql.SqlSessionTemplate.getSqlSession;
import static com.lumodiem.common.sql.SqlSessionTemplate.commitRollback;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.account.dao.HostMypageDao;
import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.hostboard.vo.KlassLike;
import com.lumodiem.board.memberboard.vo.Reservation;
import com.lumodiem.board.memberboard.vo.Review;
import com.lumodiem.board.memberboard.vo.ReviewLike;

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

	public List<KlassLike> selectKlassLikeByHostAccountNo(Klass option) {
		SqlSession session = getSqlSession();
		List<KlassLike> list = new HostMypageDao().selectKlassLikeByHostAccountNo(session, option);
		return list;
	}

	public List<ReviewLike> selectReviewLikeByHostAccountNo(Klass option) {
		SqlSession session = getSqlSession();
		List<ReviewLike> list = new HostMypageDao().selectReviewLikeByHostAccountNo(session, option);
		return list;
	}


	
	
	
}
