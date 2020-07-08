package kr.or.iei.tripBoard.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.mytrip.model.vo.TripDetail;
import kr.or.iei.tripBoard.model.vo.TripBoardMyTripVO;

@Service("tripBoardService")
public class TripBoardService {
	
	@Autowired
	@Qualifier("tripBoardDao")
	kr.or.iei.tripBoard.model.dao.TripBoardDao dao;

	public ArrayList<TripBoardMyTripVO> selectTrip(Member member) {
		return (ArrayList<TripBoardMyTripVO>)dao.selectTrip(member.getMemberId());
	}

	public ArrayList<TripDetail> selectTripDetail(int tripNo) {
		return (ArrayList<TripDetail>)dao.selectTripDetail(tripNo);
	}
	
	
}
