package kr.or.iei.together.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.common.model.vo.Region;
import kr.or.iei.together.model.vo.TogetherBoardVO;

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

}
