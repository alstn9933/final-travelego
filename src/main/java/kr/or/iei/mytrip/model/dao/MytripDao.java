package kr.or.iei.mytrip.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.common.model.vo.Region;
import kr.or.iei.mytrip.model.vo.Mytrip;

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
}
