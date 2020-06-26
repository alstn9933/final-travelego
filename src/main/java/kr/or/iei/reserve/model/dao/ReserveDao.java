package kr.or.iei.reserve.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.reserve.model.vo.ReserveVO;
import kr.or.iei.tour.model.vo.TourVO;

@Repository("reserveDao")
public class ReserveDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List checkTourTimes(HashMap<String, String> map) {
		return sqlSession.selectList("reserve.checkTimePerson",map);
	}

	public int checkReserve(ReserveVO rv) {
		return sqlSession.selectOne("reserve.checkReserve",rv);
	}

	public int selectOneTour(int itemNo) {
		return sqlSession.selectOne("reserve.selectOneTour",itemNo);
	}

	public int insertReserve(ReserveVO rv) {
		return sqlSession.insert("reserve.insertReserve",rv);
	}
}
