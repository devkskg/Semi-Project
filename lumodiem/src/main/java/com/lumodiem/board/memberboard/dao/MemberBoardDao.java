package com.lumodiem.board.memberboard.dao;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.memberboard.vo.Review;
import com.lumodiem.board.memberboard.vo.ReviewAttach;

public class MemberBoardDao {

	public int insertReview(SqlSession session, Review r) {
		int result = session.insert("reviewMapper.reviewInsert",r);
		return result;
	}
	public int insertReviewAttach(SqlSession session, ReviewAttach a) {
		int result = session.insert("reviewMapper.reviewAttachInsert",a);
		return result;
	}
}
