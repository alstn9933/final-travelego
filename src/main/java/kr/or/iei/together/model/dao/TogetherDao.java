package kr.or.iei.together.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.common.model.vo.Region;
import kr.or.iei.together.model.vo.TogetherBoardVO;
import kr.or.iei.together.model.vo.TogetherCommentVO;

@Repository("togetherDao")
public class TogetherDao {
	
	@Autowired
	SqlSessionTemplate session;

	public List selectRegionByKeyword(String keyword) {
		return session.selectList("togetherBoard.selectRegionByKeyword", keyword);
	}

	public int insertBoard(TogetherBoardVO board) {
		return session.insert("togetherBoard.insertBoard",board);
	}

	public List selectBoardList(HashMap<String, Integer> map) {
		return session.selectList("togetherBoard.selectBoardList", map);
	}

	public int selectTotalCount() {
		return session.selectOne("togetherBoard.selectTotalCount");
	}

	public TogetherBoardVO selectOneBoard(int togetherNo) {
		return session.selectOne("togetherBoard.selectOneBoard", togetherNo);
	}

	public int insertComment(TogetherCommentVO comment) {
		return session.insert("togetherBoard.insertComment", comment);
	}

	public List selectCommentList(int boardNo) {
		return session.selectList("togetherBoard.selectCommentList", boardNo);
	}

	public int modifyBoard(TogetherBoardVO vo) {
		return session.update("togetherBoard.updateBoard", vo);
	}

	public int deleteBoard(int boardNo) {
		return session.delete("togetherBoard.deleteBoard", boardNo);
	}

	public List selectRegionList() {
		return session.selectList("togetherBoard.selectRegionList");
	}

	public List selectBoardListByRegion(HashMap<String, Integer> map) {
		return session.selectList("togetherBoard.selectBoardListByRegion", map);
	}

	public int selectTotalCountByRegion(int regionNo) {
		return session.selectOne("togetherBoard.selectTotalCountByRegion", regionNo);
	}

	public int selectTotalCountByKeyword(String keyword) {
		return session.selectOne("togetherBoard.selectTotalCountByKeyword", keyword);
	}

	public List selectBoardListByKeyword(HashMap<String, String> map) {
		return session.selectList("togetherBoard.selectBoardListByKeyword", map);
	}

}
