package kr.or.iei.mypage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.mypage.model.vo.BoardList;
import kr.or.iei.mypage.model.vo.QNA;

@Repository("myPageDao")
public class MypageDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List selectAllBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("myPage.selectAllBoardList",map);
	}

	public int totalBoardCount(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("myPage.selectBoardCount",map);
	}
	
	public List selectBookmark(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("myPage.selectBookmarkList",map);
	}
	
	public int totalBookmarkCount(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("myPage.selectBookmarkCount",map);
	}

	public int insertQuestion(QNA qna) {
		// TODO Auto-generated method stub
		return sqlSession.insert("myPage.insertQuestion", qna);
	}

	public List selectQnaList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("myPage.selectQnaList",map);
	}

	public int totalQNACount(String qnaWriter) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("myPage.selectQNACount",qnaWriter);
	}

	public int leaveAnswer(QNA qna) {
		// TODO Auto-generated method stub
		return sqlSession.update("myPage.leaveAnswer",qna);
	}

}
