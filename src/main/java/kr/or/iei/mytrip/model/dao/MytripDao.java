package kr.or.iei.mytrip.model.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.common.model.vo.Region;
import kr.or.iei.mytrip.model.vo.Mytrip;
import kr.or.iei.mytrip.model.vo.RegionData;
import kr.or.iei.mytrip.model.vo.TripDetail;
import kr.or.iei.mytrip.model.vo.TripMember;

@Repository("mytripDao")
public class MytripDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int insertTrip(Mytrip t) {
		return sqlSession.insert("mytrip.insertTrip",t);
	}
	
	public List regionList() {
		return sqlSession.selectList("mytrip.regionList");
	}
	
	public List searchRegion(String regionCity){
		return sqlSession.selectList("mytrip.searchRegion",regionCity);
	}

	public int setMytrip(Mytrip mytrip) {
		return sqlSession.insert("mytrip.setMytrip",mytrip);
	}
	
	public int setMytrip2(Mytrip mytrip) {
		return sqlSession.insert("mytrip.setMytrip2",mytrip);
	}

	public int insertTripMember(TripMember tripMember) {
		return sqlSession.insert("mytrip.insertTripMember",tripMember);
	}

	public List<RegionData> selectTripList(String memberId) {
		return sqlSession.selectList("mytrip.selectTripList",memberId);
	}
	
	
	public List<Mytrip> currValIs(){ 
		return sqlSession.selectList("mytrip.currValIs"); 
	}

	public TripDetail ifExist(TripDetail tripDetail) {
		return sqlSession.selectOne("mytrip.ifExist",tripDetail);
	}

	public int addMemoFirst(TripDetail tripDetail) {
		return sqlSession.insert("mytrip.addMemoFirst",tripDetail);
	}

	public int addMemo(TripDetail tripDetail) {
		return sqlSession.insert("mytrip.addMemo",tripDetail);
	}

	public TripDetail tripOrderIs(TripDetail tripDetail) {
		return sqlSession.selectOne("mytrip.tripOrderIs",tripDetail);
	}

	public Mytrip selectMytrip(int tripNoIs) {
		return sqlSession.selectOne("mytrip.selectMytrip",tripNoIs);
	}

	public List<TripDetail> selectDateList(int tripNoIs) {
		return sqlSession.selectList("mytrip.selectDateList",tripNoIs);
	}

	public int deleteMemo(TripDetail tripDetail) {
		return sqlSession.delete("mytrip.deleteMemo",tripDetail);
	}

	public int sortMemo(TripDetail tripDetail) {
		return sqlSession.update("mytrip.sortMemo",tripDetail);
	}

	public int changeOrder1(TripDetail tripDetail1) {
		return sqlSession.update("mytrip.changeOrder1",tripDetail1);
	}

	public int changeOrder2(TripDetail tripDetail2) {
		return sqlSession.update("mytrip.changeOrder2",tripDetail2);
	}

	public int changeOrder3(TripDetail tripDetail2) {
		return sqlSession.update("mytrip.changeOrder3",tripDetail2);
	}

	public int changeOrder4(TripDetail tripDetail2) {
		return sqlSession.update("mytrip.changeOrder4",tripDetail2);
	}

	public String selectNickname(String memberNickname) {
		return sqlSession.selectOne("mytrip.selectNickname",memberNickname);
	}

	public int deleteData(int currValIs) {
		return sqlSession.delete("mytrip.deleteData",currValIs);
	}
	
}
