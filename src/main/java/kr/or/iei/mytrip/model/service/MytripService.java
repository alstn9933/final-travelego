package kr.or.iei.mytrip.model.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.iei.common.model.vo.Region;
import kr.or.iei.mytrip.model.dao.MytripDao;
import kr.or.iei.mytrip.model.vo.Mytrip;
import kr.or.iei.mytrip.model.vo.TripMember;

@Service("mytripService")
public class MytripService {
	@Autowired
	@Qualifier("mytripDao")
	private MytripDao dao;
	
	public int insertTrip(Mytrip t) {
		return dao.insertTrip(t);
	}
	
	public ArrayList<Region> searchRegion(String regionCity){
		List regionList = dao.searchRegion(regionCity);
		return (ArrayList<Region>)regionList;
	}

	public int setMytrip(Mytrip mytrip) {
		return dao.setMytrip(mytrip);
	}

	public int insertTripMember(TripMember tripMember) {
		return dao.insertTripMember(tripMember);
	}

	public List<TripMember> selectTripList(TripMember tripMember) {
		return dao.selectTripList(tripMember);
	}

	
	
	
}
