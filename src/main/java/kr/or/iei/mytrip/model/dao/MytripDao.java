package kr.or.iei.mytrip.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.mytrip.model.vo.Mytrip;

@Repository("mytripDao")
public class MytripDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int insertTrip(Mytrip t) {
		return sqlSession.insert("mytrip.insertTrip",t);
	}
}
