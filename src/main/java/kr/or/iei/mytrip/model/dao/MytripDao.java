package kr.or.iei.mytrip.model.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.common.model.vo.Region;
import kr.or.iei.mytrip.model.vo.Mytrip;
import kr.or.iei.mytrip.model.vo.TripMember;

@Repository("mytripDao")
public class MytripDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int insertTrip(Mytrip t) {
		return sqlSession.insert("mytrip.insertTrip",t);
	}
	
	public List searchRegion(String regionCity){
		return sqlSession.selectList("mytrip.searchRegion",regionCity);
	}

	public int setMytrip(Mytrip mytrip) {
		return sqlSession.insert("mytrip.setMytrip",mytrip);
	}

	public int insertTripMember(TripMember tripMember) {
		return sqlSession.insert("mytrip.insertTripMember",tripMember);
	}

	public List<TripMember> selectTripList(TripMember tripMember) {
		return sqlSession.selectList("mytrip.selectTripList",tripMember);
	}

	
}
