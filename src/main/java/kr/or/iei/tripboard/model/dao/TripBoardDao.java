package kr.or.iei.tripboard.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.common.model.vo.Photo;
import kr.or.iei.mytrip.model.vo.TripDetail;
import kr.or.iei.tripboard.model.vo.TripBoardVO;

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
	
	
	
}
