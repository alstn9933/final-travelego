package kr.or.iei.tripBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.common.model.vo.Photo;
import kr.or.iei.mytrip.model.vo.TripDetail;
import kr.or.iei.tripBoard.model.vo.TripBoardVO;

@Repository("tripBoardDao")
public class TripBoardDao {
	
	@Autowired
	SqlSessionTemplate session;

	public List selectTrip(String memberId) {
		return session.selectList("tripboard.selectTrip", memberId);
	}

	public List selectTripDetail(int tripNo) {
		return session.selectList("tripboard.selectTripDetail", tripNo);
	}

	public int insertBoard(TripBoardVO board) {
		return session.insert("tripboard.insertBoard", board);
	}

	public int insertPhoto(Photo photo) {
		return session.insert("tripboard.insertPhoto", photo);
	}

	public int countBoard() {
		return session.selectOne("tripboard.countTotal");
	}

	public List selectBoardList(HashMap<String, Integer> map) {
		return session.selectList("tripboard.selectBoardList", map);
	}
	
	
	
}
