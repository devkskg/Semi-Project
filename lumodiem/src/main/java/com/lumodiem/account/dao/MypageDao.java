package com.lumodiem.account.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.hostboard.vo.KlassLike;
import com.lumodiem.board.memberboard.vo.Reservation;
import com.lumodiem.board.memberboard.vo.Review;
import com.lumodiem.board.memberboard.vo.ReviewCmt;
import com.lumodiem.board.memberboard.vo.ReviewLike;

public class MypageDao {

	public List<Klass> selectApproveListByAccountNo(SqlSession session, Klass option) {
		return session.selectList("mypageMapper.klassListSearch", option);
	}

	public List<Review> selectReviewListByHostAccountNo(SqlSession session, Klass option) {
		return session.selectList("mypageMapper.selectReviewListByHostAccountNo", option);
	}

	public List<KlassLike> selectKlassLikeByHostAccountNo(SqlSession session, Klass option) {
		return session.selectList("mypageMapper.selectKlassLikeByHostAccountNo", option);
	}

	public List<ReviewLike> selectReviewLikeByHostAccountNo(SqlSession session, Klass option) {
		return session.selectList("mypageMapper.selectReviewLikeByHostAccountNo", option);
	}

	public List<ReviewCmt> selectReviewCmtListByHostAccountNo(SqlSession session, Klass option) {
		return session.selectList("mypageMapper.selectReviewCmtListByHostAccountNo", option);
	}



}
