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
import kr.or.iei.mytrip.model.vo.RegionData;
import kr.or.iei.mytrip.model.vo.TripDetail;
import kr.or.iei.mytrip.model.vo.TripMember;

@Service("mytripService")
public class MytripService {
	@Autowired
	@Qualifier("mytripDao")
	private MytripDao dao;
	
	public int insertTrip(Mytrip t) {
		return dao.insertTrip(t);
	}
	
	public ArrayList<Region> regionList() {
		List regionList = dao.regionList();
		return (ArrayList<Region>)regionList;
	}
	
	public ArrayList<Region> searchRegion(String regionCity){
		List regionList = dao.searchRegion(regionCity);
		return (ArrayList<Region>)regionList;
	}

	public int setMytrip(Mytrip mytrip) {
		return dao.setMytrip(mytrip);
	}
	
	public int setMytrip2(Mytrip mytrip) {
		return dao.setMytrip2(mytrip);
	}

	public int insertTripMember(TripMember tripMember) {
		return dao.insertTripMember(tripMember);
	}

	public List<RegionData> selectTripList(String memberId) {
		return dao.selectTripList(memberId);
	}
	
	public ArrayList<Mytrip> currValIs() {
		List currValList = dao.currValIs();
		return (ArrayList<Mytrip>)currValList; 
	}

	public TripDetail ifExist(TripDetail tripDetail) {
		return dao.ifExist(tripDetail);
	}

	public int addMemoFirst(TripDetail tripDetail) {
		return dao.addMemoFirst(tripDetail);
	}

	public int addMemo(TripDetail tripDetail) {
		return dao.addMemo(tripDetail);
	}

	public TripDetail tripOrderIs(TripDetail tripDetail) {
		return dao.tripOrderIs(tripDetail);
	}

	public Mytrip selectMytrip(int tripNoIs) {
		return dao.selectMytrip(tripNoIs);
	}

	public ArrayList<TripDetail> selectDateList(int tripNoIs) {
		List detailList = dao.selectDateList(tripNoIs);
		return (ArrayList<TripDetail>)detailList;
	}

	public int deleteMemo(TripDetail tripDetail) {
		return dao.deleteMemo(tripDetail);
	}

	public int sortMemo(TripDetail tripDetail) {
		return dao.sortMemo(tripDetail);
	}

	public int changeOrder1(TripDetail tripDetail1) {
		return dao.changeOrder1(tripDetail1);
	}

	public int changeOrder2(TripDetail tripDetail2) {
		return dao.changeOrder2(tripDetail2);
	}

	public int changeOrder3(TripDetail tripDetail2) {
		return dao.changeOrder3(tripDetail2);
	}
	
	public int changeOrder4(TripDetail tripDetail2) {
		return dao.changeOrder4(tripDetail2);
	}

	public String selectNickname(String memberNickname) {
		return dao.selectNickname(memberNickname);
	}

	public int deleteData(int currValIs) {
		return dao.deleteData(currValIs);
	}



	 

	
	
	
}
