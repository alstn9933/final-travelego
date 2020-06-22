package kr.or.iei.mypage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.mypage.model.vo.BoardList;

@Repository("myPageDao")
public class MypageDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List selectAllBoard(Member m) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("myPage.selectAllBoardList",m);
	}

	public List selectBookmark(Member m) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("myPage.selectBookmarkList",m);
	}

}
