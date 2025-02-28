package com.lumodiem.board.memberboard.service;

import static com.lumodiem.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.memberboard.dao.MemberBoardDao;
import com.lumodiem.board.memberboard.vo.Reservation;
import com.lumodiem.board.memberboard.vo.Review;
import com.lumodiem.board.memberboard.vo.ReviewAttach;
public class MemberBoardService {
	
	public int insertReview(Review r,ReviewAttach a) {
		SqlSession session = getSqlSession();
		int result = 0;
		
		 if (r.getResNo() == 0) {
		        List<Reservation> resList = searchResNoByAccountNo(String.valueOf(r.getAccountNo()));
		        if (resList != null && !resList.isEmpty()) {
		            r.setResNo(resList.get(0).getResNo());
		        } else {
		            System.out.println("해당 계정의 예약 정보가 없음!");
		            session.close();
		            return 0;  
		        }
		    }
		 
		int reviewNo = new MemberBoardDao().insertReview(session,r);
//		a.setAttachNo(reviewNo);
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
	public List<Reservation> searchResNoByAccountNo(String accountNo) {
		SqlSession session = getSqlSession();
		List<Reservation> resList = new MemberBoardDao().searchResNoByAccountNo(session, accountNo);
		session.close();
		return resList;
	}
	public int UpdateReview(Review review) {
		SqlSession session = getSqlSession();
		int result = new MemberBoardDao().UpdateReview(session,review);
		session.close();
		return result;
	}
	public List<Review> selectReviewList(Review option){
		SqlSession session = getSqlSession();
		List<Review> resultList = new MemberBoardDao().selectReviewList(session,option);
		session.close();
		return resultList;
	}
	public Review selectReviewOne(int reviewNo) {
		SqlSession session = getSqlSession();
		Review review = new MemberBoardDao().selectReviewOne(session,reviewNo);
		session.close();
		return review;
	}
	public ReviewAttach selectAttachOne(int attachNo) {
		SqlSession session = getSqlSession();
		ReviewAttach a = new MemberBoardDao().selectAttachOne(session,attachNo);
		session.close();
		return a;
	}
	public List<Klass> attendedKlass(int accountNo){
		SqlSession session = getSqlSession();
		List<Klass> klass = new MemberBoardDao().attendedKlass(session,accountNo);
		session.close();
		return klass;
	}
	public List<Klass> searchResNo(int resNo){
		SqlSession session = getSqlSession();
		List<Klass> klass = new MemberBoardDao().searchResNo(session,resNo);
		session.close();
		return klass;
	}
}
