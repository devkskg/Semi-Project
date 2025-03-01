package com.lumodiem.account.service;

import static com.lumodiem.common.sql.SqlSessionTemplate.getSqlSession;
import static com.lumodiem.common.sql.SqlSessionTemplate.commitRollback;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.account.dao.MypageDao;
import com.lumodiem.account.vo.ReviewDTO;
import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.hostboard.vo.KlassDate;
import com.lumodiem.board.hostboard.vo.KlassLike;
import com.lumodiem.board.memberboard.vo.Review;
import com.lumodiem.board.memberboard.vo.ReviewCmt;
import com.lumodiem.board.memberboard.vo.ReviewLike;

public class MypageService {

	public List<Klass> selectApproveListByAccountNo(Klass option) {
		SqlSession session = getSqlSession();
		List<Klass> list = new MypageDao().selectApproveListByAccountNo(session, option);
		return list;
	}

	public List<Review> selectReviewListByHostAccountNo(Klass option) {
		SqlSession session = getSqlSession();
		List<Review> list = new MypageDao().selectReviewListByHostAccountNo(session, option);
		return list;
	}

	public List<KlassLike> selectKlassLikeByHostAccountNo(Klass option) {
		SqlSession session = getSqlSession();
		List<KlassLike> list = new MypageDao().selectKlassLikeByHostAccountNo(session, option);
		return list;
	}

	public List<ReviewLike> selectReviewLikeByHostAccountNo(Klass option) {
		SqlSession session = getSqlSession();
		List<ReviewLike> list = new MypageDao().selectReviewLikeByHostAccountNo(session, option);
		return list;
	}

	public List<ReviewCmt> selectReviewCmtListByHostAccountNo(Klass option) {
		SqlSession session = getSqlSession();
		List<ReviewCmt> list = new MypageDao().selectReviewCmtListByHostAccountNo(session, option);
		return list;
	}

	public List<Klass> selectReservationKlassListByAccountNo(Klass option) {
		SqlSession session = getSqlSession();
		List<Klass> list = new MypageDao().selectReservationKlassListByAccountNo(session, option);
		return list;
	}

	public List<KlassDate> selectReservationKlassDateListByAccountNo(Klass option) {
		SqlSession session = getSqlSession();
		List<KlassDate> list = new MypageDao().selectReservationKlassDateListByAccountNo(session, option);
		return list;
	}

	public List<ReviewDTO> selectReviewKlassListByAccountNo(Klass option) {
		SqlSession session = getSqlSession();
		List<ReviewDTO> list = new MypageDao().selectReviewKlassListByAccountNo(session, option);
		return list;
	}


	
	
	
}
