package com.lumodiem.common.payment.service;

import static com.lumodiem.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.memberboard.dao.MemberBoardDao;
import com.lumodiem.board.memberboard.vo.Review;

import static com.lumodiem.common.sql.SqlSessionTemplate.commitRollback;

public class PaymentService {
//	public List<Review> selectReviewList(Review option){
//		SqlSession session = getSqlSession();
//		List<Review> resultList = new MemberBoardDao().selectReviewList(session,option);
//		session.close();
//		return resultList;
//	}
	
}
