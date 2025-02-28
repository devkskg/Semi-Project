package com.lumodiem.account.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.hostboard.vo.KlassLike;
import com.lumodiem.board.memberboard.vo.Reservation;
import com.lumodiem.board.memberboard.vo.Review;
import com.lumodiem.board.memberboard.vo.ReviewLike;

public class HostMypageDao {

	public List<Klass> selectApproveListByHostAccountNo(SqlSession session, Klass option) {
		return session.selectList("mypageMapper.approveKlassListSearch", option);
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



}
