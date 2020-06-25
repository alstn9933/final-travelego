package kr.or.iei.reserve.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("reserveDao")
public class ReserveDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List checkTourTimes(HashMap<String, String> map) {
		return sqlSession.selectList("reserve.checkTimePerson",map);
	}
}
