package com.lumodiem.board.memberboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.memberboard.vo.ReviewCmt;

public class ReviewCommentDao {
	
	public List<ReviewCmt> selectReviewComment(ReviewCmt cmt, SqlSession session){
		return session.selectList("commentMapper.commentSelect",cmt);
	}
	
	public int insertReviewComment(ReviewCmt cmt, SqlSession session) {
		return session.insert("commentMapper.commentCreate",cmt);
	}
}
