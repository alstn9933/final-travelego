package kr.or.iei.tour.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.tour.model.vo.MoreTourVal;
import kr.or.iei.tour.model.vo.ReviewVO;
import kr.or.iei.tour.model.vo.TourVO;

@Repository("tourDao")
public class TourDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int selectTotalCount(String memberId) {
		return sqlSession.selectOne("selectTotalCount",memberId);
	}

	public List moreItemList(MoreTourVal mtv) {
		return sqlSession.selectList("selectMoreItem",mtv);
	}

	public List selectReviewList(int itemNo) {
		return sqlSession.selectList("selectReviewList",itemNo);
	}
}
