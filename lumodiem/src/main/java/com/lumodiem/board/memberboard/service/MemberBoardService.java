package com.lumodiem.board.memberboard.service;

import static com.lumodiem.common.sql.SqlSessionTemplate.getSqlSession;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.memberboard.dao.MemberBoardDao;
import com.lumodiem.board.memberboard.vo.Review;
import com.lumodiem.board.memberboard.vo.ReviewAttach;
public class MemberBoardService {
	
	public int insertReview(Review r,ReviewAttach a) {
		SqlSession session = getSqlSession();
		int result = 0;
		
		int reviewNo = new MemberBoardDao().insertReview(session,r);
		a.setAttachNo(reviewNo);
		int attachNo = new MemberBoardDao().insertReviewAttach(session,a);
		
		if(reviewNo != 0 && attachNo != 0) {
			result = 1;
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		return result;
		
	}
	
}
