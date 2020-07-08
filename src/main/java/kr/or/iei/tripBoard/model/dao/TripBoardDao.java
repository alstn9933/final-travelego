package kr.or.iei.tripBoard.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("tripBoardDao")
public class TripBoardDao {
	@Autowired
	SqlSession sqlSession;
	
	
}
