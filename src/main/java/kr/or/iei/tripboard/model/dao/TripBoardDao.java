package kr.or.iei.tripboard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.common.model.vo.Photo;
import kr.or.iei.mytrip.model.vo.TripDetail;
import kr.or.iei.together.model.vo.TogetherCommentVO;
import kr.or.iei.tripboard.model.vo.TripBoardVO;

@Repository("tripBoardDao")
public class TripBoardDao {
	
	@Autowired
	SqlSessionTemplate session;

	public List selectTrip(String memberId) {
		return session.selectList("tripboard.selectTrip", memberId);
	}

	public List selectTripDetail(int tripNo) {
		return session.selectList("tripboard.selectTripDetail", tripNo);
	}

	public int insertBoard(TripBoardVO board) {
		return session.insert("tripboard.insertBoard", board);
	}

	public int insertPhoto(Photo photo) {
		return session.insert("tripboard.insertPhoto", photo);
	}

	public int countBoard() {
		return session.selectOne("tripboard.countTotal");
	}

	public List selectBoardList(HashMap<String, Integer> map) {
		return session.selectList("tripboard.selectBoardList", map);
	}

	public TripBoardVO selectOneBoard(HashMap<String, String> map) {
		return session.selectOne("tripboard.selectOneBoard", map);
	}

	public int deleteBoard(int boardNum) {
		return session.delete("tripboard.deleteBoard", boardNum);
	}

	public int updateBoard(TripBoardVO board) {
		return session.update("tripboard.updateBoard", board);
	}

	public List selectCommentList(int tripBoardNo) {
		return session.selectList("tripboard.selectCommentList", tripBoardNo);
	}

	public int insertComment(TogetherCommentVO comment) {
		return session.insert("tripboard.insertComment", comment);
	}

	public int checkRef(int commentNo) {
		return session.selectOne("tripboard.checkCommentRef", commentNo);
	}

	public int deleteComment(int commentNo) {
		return session.delete("tripboard.deleteComment", commentNo);
	}

	public int updateComment(TogetherCommentVO comment) {
		return session.update("tripboard.updateComment", comment);
	}

	public int countSearch(HashMap<String, String> map) {
		return session.selectOne("tripboard.countSearch", map);
	}

	public List searchBoardList(HashMap<String, String> map) {
		return session.selectList("tripboard.searchBoard", map);
	}

	public int insertLike(HashMap<String, String> map) {
		return session.insert("tripboard.insertLike", map);
	}

	public int countLike(String boardNum) {
		return session.selectOne("tripboard.countLike", boardNum);
	}

	public int deleteLike(HashMap<String, String> map) {
		return session.delete("tripboard.deleteLike",map);
	}

	public int insertBookmark(HashMap<String, String> map) {
		return session.insert("tripboard.insertBookmark",map);
	}

	public int deleteBookmark(HashMap<String, String> map) {
		return session.delete("tripboard.deleteBookmark", map);
	}

}
