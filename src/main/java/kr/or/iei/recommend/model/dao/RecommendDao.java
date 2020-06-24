package kr.or.iei.recommend.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.trip.model.vo.Region;

@Repository("recommendDao")
public class RecommendDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List selectAllRegion() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("recommend.selectAllRegion");
	}
}
