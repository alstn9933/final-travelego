package kr.or.iei.recommend.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.common.model.vo.BoardComment;
import kr.or.iei.common.model.vo.Liked;
import kr.or.iei.common.model.vo.Region;
import kr.or.iei.mypage.model.vo.Bookmark;
import kr.or.iei.recommend.model.vo.Recommend;
import kr.or.iei.recommend.model.vo.SelectItems;

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

	public List selectAllRec(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("recommend.selectAllRec", map);
	}
	
	public List selectRecList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("recommend.selectRecList",map);
	}

	public int insertRec(HashMap<String, Object> map) {
		return sqlSession.insert("recommend.insertRec",map);
	}

	public Recommend selectOneRec(int recNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recommend.selectOneRec",recNo);
	}

	public List selectComments(HashMap<String,Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("recommend.selectComments",map);
	}

	public int insertComment(BoardComment comment) {
		System.out.println(comment.getRefComment());
		return sqlSession.insert("recommend.insertComment",comment);
	}

	public int insertBookmark(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("recommend.insertBookmark",map);
	}

	public int deleteBookmark(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.delete("recommend.deleteBookmark",map);
	}

	public Bookmark selectBookmark(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recommend.selectBookmark", map);
	}

	public Liked selectLiked(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recommend.selectLiked",map);
	}

	public int insertLike(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("recommend.insertLike",map);
	}

	public int deleteLike(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.delete("recommend.deleteLike",map);
	}

	public int deleteComment(int commentNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("recommend.deleteComment",commentNo);
	}

	public int selectCommentCount(int recNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recommend.selectCommentCount",recNo);
	}

	public int deleteRec(int recNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("recommend.deleteRec",recNo);
	}

	public List selectAllRecPhoto() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("recommend.selectAllRecPhoto");
	}

	public int updateComment(BoardComment c) {
		// TODO Auto-generated method stub
		return sqlSession.update("recommend.updateComment",c);
	}

	public int totalRecCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recommend.totalRecCount");
	}

	public int totalSelectedRecCount(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recommend.totalSelectedRecCount",map);
	}

	public int updateRec(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("recommend.updateRec",map);
	}

	public int updatePhoto(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("recommend.updatePhoto",map);
	}

	public int plusReadCount(int recNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("recommend.plusReadCount",recNo);
	}
	
}
