package com.lumodiem.board.memberboard.service;

import static com.lumodiem.common.sql.SqlSessionTemplate.getSqlSession;
import static com.lumodiem.common.sql.SqlSessionTemplate.commitRollback;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.memberboard.dao.MemberBoardDao;
import com.lumodiem.board.memberboard.vo.Review;
import com.lumodiem.board.memberboard.vo.ReviewAttach;
import com.lumodiem.board.memberboard.vo.ReviewMapping;
public class MemberBoardService {
	
	public int insertReview(Review r,ReviewAttach a,ReviewMapping m) {
		SqlSession session = getSqlSession();
		int result = 0;	 
		
		int reviewNo = new MemberBoardDao().insertReview(session,r);
		int attachNo = new MemberBoardDao().insertReviewAttach(session,a);
		
		m.setReviewNo(reviewNo);
		m.setAttachNo(attachNo);
		
		int mappingNo = new MemberBoardDao().insertReviewMapping(session,m);
		
		if(reviewNo > 0 && attachNo > 0 && mappingNo > 0) {
			result = 1;
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		return result;
	}
	public int UpdateReview(Review r ,ReviewAttach a ,ReviewMapping m) {
		SqlSession session = getSqlSession();
		int result = 0;
		
		int updateResult = new MemberBoardDao().updateReview(session,r);
		int updateAttachResult = new MemberBoardDao().updateAttach(session,a);
		m.setReviewNo(updateResult);
		m.setAttachNo(updateAttachResult);
		
		int updateMappingResult = new MemberBoardDao().updateMapping(session,m);
		
		if(updateResult > 0 && updateAttachResult > 0 && updateMappingResult > 0) {
			result = 1;
			session.commit();
		}else {
			session.rollback();
		}
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
	public List<Klass> searchKlassDateNo(int klassDateNo){
		SqlSession session = getSqlSession();
		List<Klass> klass = new MemberBoardDao().searchKlassDateNo(session,klassDateNo);
		session.close();
		return klass;
	}
	public ReviewAttach selectNoImgReview(int reviewNo) {
		SqlSession session = getSqlSession();
		ReviewAttach a = new MemberBoardDao().selectNoImgReview(session,reviewNo);
		session.close();
		return a;
	}
	public Review selectReviewNo(int reviewNo) {
		SqlSession session = getSqlSession();
		Review r = new MemberBoardDao().selectReviewNo(session,reviewNo);
		session.close();
		return r;
	}
	public int deleteReview(int reviewNo, int attachNo) {
		SqlSession session = getSqlSession();
		int result = 0;
		int review = new MemberBoardDao().deleteReview(session,reviewNo);
		int attach = new MemberBoardDao().deleteAttach(session,attachNo);
//		int mapping = new MemberBoardDao().deleteMapping(session,reviewNo);
//		System.out.println("r : "+review);
//		System.out.println("a : "+attach);
//		System.out.println("m : "+mapping);
		if(review > 0 && attach > 0 ) {
			result = 1;
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		return result;
	}
	public int deleteReview(int reviewNo) {
		SqlSession session = getSqlSession();
		int review = new MemberBoardDao().deleteReviewOne(session,reviewNo);
		commitRollback(review, session);
		session.close();
		return review;
	}
	public int countLikeByReviewNo(int reviewNo) {
		SqlSession session = getSqlSession();
		int count = new MemberBoardDao().countLikeByReviewNo(session,reviewNo);
		session.close();
		return count;
	}
	
}
