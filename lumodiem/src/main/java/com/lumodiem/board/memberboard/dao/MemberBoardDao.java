package com.lumodiem.board.memberboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.memberboard.vo.Reservation;
import com.lumodiem.board.memberboard.vo.Review;
import com.lumodiem.board.memberboard.vo.ReviewAttach;

public class MemberBoardDao {

	public int insertReview(SqlSession session, Review r) {
		session.insert("reviewMapper.reviewInsert",r);
		
		return r.getReviewNo();
	}
	public int insertReviewAttach(SqlSession session, ReviewAttach a) {
		int result = session.insert("reviewMapper.reviewAttachInsert",a);
		return result;
	}
	public ReviewAttach selectAttachOne(SqlSession session, int attachNo) {
		return session.selectOne("reviewMapper.selectAttach",attachNo);
	}
	public List<Reservation> searchResNoByAccountNo(SqlSession session, String accountNo) {
		return session.selectOne("reviewMapper.searchResNoByAccountNo",accountNo);
	}
}
