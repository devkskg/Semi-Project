package com.lumodiem.board.memberboard.dao;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.memberboard.vo.ReviewCmt;

public class ReviewCommentDao {
	
	public int insertReviewComment(ReviewCmt cmt, SqlSession session) {
		return session.insert("commentMapper.commentCreate",cmt);
	}
}
