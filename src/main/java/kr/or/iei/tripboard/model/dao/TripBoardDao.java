package kr.or.iei.tripboard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.mytrip.model.vo.TripDetail;

@Repository("tripBoardDao")
public class TripBoardDao {
	
	@Autowired
	SqlSessionTemplate session;

	public List selectTrip(String memberId) {
		return session.selectList("selectTrip", memberId);
	}

	public List selectTripDetail(int tripNo) {
		return session.selectList("selectTripDetail", tripNo);
	}

	public int countBoard() {
		return session.selectOne("tripboard.countTotal");
	}

	public List selectBoardList(HashMap<String, Integer> map) {
		return session.selectList("tripboard.selectBoardList", map);
	}
	
	
	
}
