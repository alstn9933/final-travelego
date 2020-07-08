package kr.or.iei.tripboard.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("tripBoardDao")
public class TripBoardDao {
	
	@Autowired
	SqlSessionTemplate session;
	
	
	
}
