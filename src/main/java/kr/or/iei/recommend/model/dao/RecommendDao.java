package kr.or.iei.recommend.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.common.model.vo.BoardComment;
import kr.or.iei.common.model.vo.Region;
import kr.or.iei.recommend.model.vo.Recommend;
import kr.or.iei.recommend.model.vo.SelectItems;
import kr.or.iei.tour.model.vo.Photo;

@Repository("recommendDao")
public class RecommendDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List selectAllRegion() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("recommend.selectAllRegion");
	}

	public List selectCities(String country) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("recommend.selectCities", country);
	}

	public List selectAllRec() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("recommend.selectAllRec");
	}
	
	public List selectRecList(SelectItems items) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("recommend.selectRecList",items);
	}

	public int insertRec(HashMap<String, Object> map) {
		return sqlSession.insert("recommend.insertRec",map);
	}

	public Recommend selectOneRec(int recNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recommend.selectOneRec",recNo);
	}

	public List selectComments(int recNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("recommend.selectComments",recNo);
	}

	public int insertComment(BoardComment comment) {
		System.out.println(comment.getRefComment());
		return sqlSession.insert("recommend.insertComment",comment);
	}

	
}
