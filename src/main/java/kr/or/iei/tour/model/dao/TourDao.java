package kr.or.iei.tour.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.common.model.vo.Photo;
import kr.or.iei.tour.model.vo.TourVO;

@Repository("tourDao")
public class TourDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int selectTotalCount(String memberId) {
		return sqlSession.selectOne("tour.selectTotalCount",memberId);
	}

	public List moreItemList(HashMap<String, String> map) {
		return sqlSession.selectList("tour.selectMoreItem",map);
	}

	public List selectReviewList(int itemNo) {
		return sqlSession.selectList("tour.selectReviewList",itemNo);
	}

	public List selectCountryList() {
		return sqlSession.selectList("tour.selectCountryList");
	}

	public List selectCityList(String regionCountry) {
		return sqlSession.selectList("tour.selectCityList",regionCountry);
	}

	public int insertTour(TourVO tv) {
		return sqlSession.insert("tour.insertTour",tv);
	}

	public List selectBoardNo(String memberId) {
		return sqlSession.selectList("tour.selectBoardNo",memberId);
	}

	public int insertPhoto(Photo p) {
		return sqlSession.insert("tour.insertPhoto",p);
	}

	public TourVO selectOneTour(int itemNo) {
		return sqlSession.selectOne("tour.selectOneTour",itemNo);
	}

	public int selectTotalReview(int itemNo) {
		return sqlSession.selectOne("tour.selectTotalReview",itemNo);
	}

	public List moreReviewList(HashMap<String, String> map) {
		return sqlSession.selectList("tour.selectMoreReview", map);
	}

	public List selectAllTour() {
		return sqlSession.selectList("tour.selectAllTour");
	}

	public int tourCloseCheck(int itemNo) {
		return sqlSession.update("tour.closeCheckTour",itemNo);
	}
}
