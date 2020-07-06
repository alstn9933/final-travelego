package kr.or.iei.reserve.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.reserve.model.vo.ReserveVO;
import kr.or.iei.tour.model.vo.ReviewVO;
import kr.or.iei.tour.model.vo.TourVO;

@Repository("reserveDao")
public class ReserveDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List checkTourTimes(HashMap<String, String> map) {
		return sqlSession.selectList("reserve.checkTimePerson",map);
	}
	
	public TourVO checkTourTimes(TourVO t) {
		return sqlSession.selectOne("tour.selectTourTimes",t);
	}

	public List checkReserve(ReserveVO r) {
		return sqlSession.selectList("reserve.checkReserve",r);
	}

	public int selectOneTour(int itemNo) {
		return sqlSession.selectOne("reserve.selectOneTour",itemNo);
	}

	public int insertReserve(ReserveVO r) {
		return sqlSession.insert("reserve.insertReserve",r);
	}

	public int cancelReserve(int reserveNo) {
		return sqlSession.update("reserve.cancelReserve",reserveNo);
	}

	public int selectOneReserve(String memberId) {
		return sqlSession.selectOne("reserve.selectReserveNo",memberId);
	}

	public int modifyPayment(ReserveVO r) {
		return sqlSession.update("reserve.modifyPayment",r);
	}

	public ReserveVO selectOneReserve(int reserveNo) {
		return sqlSession.selectOne("reserve.selectOneReserve",reserveNo);
	}
	
	public int selectMyReserveTotalCount(HashMap<String, String> map) {
		return sqlSession.selectOne("reserve.selectTotalCount",map);
	}

	public List selectMoreReserve(HashMap<String, String> map) {
		return sqlSession.selectList("reserve.selectMoreReserve",map);
	}

	public int insertReview(ReviewVO r) {
		return sqlSession.insert("tour.insertReview",r);
	}

	public int upReChRe(int reserveNo) {
		return sqlSession.update("reserve.upReChRe",reserveNo);
	}

	public List selectAllTour(String memberId) {
		return sqlSession.selectList("tour.selectComTour",memberId);
	}

	public List selectReserveList(ReserveVO r) {
		return sqlSession.selectList("reserve.selectReserve",r);
	}
}
