package kr.or.iei.mypage.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.mypage.model.dao.MypageDao;
import kr.or.iei.mypage.model.vo.BoardList;
import kr.or.iei.mypage.model.vo.Bookmark;
import kr.or.iei.mypage.model.vo.QNA;

@Service("myPageService")
public class MypageService {

	@Autowired
	@Qualifier("myPageDao")
	private MypageDao dao;
	
	public ArrayList<BoardList> selectBoardList(Member m) {
		List list = dao.selectAllBoard(m);
		return (ArrayList<BoardList>)list;
	}

	public ArrayList<Bookmark> selectBookmarkList(Member m) {
		List list = dao.selectBookmark(m);
		return (ArrayList<Bookmark>)list;
	}

	public int insertQuestion(QNA qna) {
		// TODO Auto-generated method stub
		return dao.insertQuestion(qna);
	}

}
