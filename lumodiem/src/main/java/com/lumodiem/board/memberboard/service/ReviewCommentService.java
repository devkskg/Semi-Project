package com.lumodiem.board.memberboard.service;

import static com.lumodiem.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.memberboard.dao.ReviewCommentDao;
import com.lumodiem.board.memberboard.vo.ReviewCmt;

public class ReviewCommentService {
	ReviewCommentDao dao = new ReviewCommentDao();	
	
	
	public List<ReviewCmt> selectReviewComment(ReviewCmt cmt){
		SqlSession session = getSqlSession();
		List<ReviewCmt> resultList = dao.selectReviewComment(cmt,session);
		session.close();
		return resultList;
	}
	
	public int insertReviewComment(ReviewCmt cmt) {
		SqlSession session = getSqlSession();
		int result = dao.insertReviewComment(cmt,session);
		if(result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}
	
}
