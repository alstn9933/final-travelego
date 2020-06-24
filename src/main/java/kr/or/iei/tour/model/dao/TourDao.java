package kr.or.iei.tour.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.tour.model.vo.MoreTourVal;
import kr.or.iei.tour.model.vo.Photo;
import kr.or.iei.tour.model.vo.TourVO;

@Repository("tourDao")
public class TourDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int selectTotalCount(String memberId) {
		return sqlSession.selectOne("tour.selectTotalCount",memberId);
	}

	public List moreItemList(MoreTourVal mtv) {
		return sqlSession.selectList("tour.selectMoreItem",mtv);
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
}
