package kr.or.iei.mypage.model.service;

import java.util.ArrayList;
import java.util.HashMap;
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
	
	public ArrayList<BoardList> selectBoardList(String memberId, int board) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("board",board);
		List list = dao.selectAllBoard(map);
		return (ArrayList<BoardList>)list;
	}

	public ArrayList<Bookmark> selectBookmarkList(String memberId, int board) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("board",board);
		List list = dao.selectBookmark(map);
		return (ArrayList<Bookmark>)list;
	}

	public int insertQuestion(QNA qna) {
		// TODO Auto-generated method stub
		return dao.insertQuestion(qna);
	}

	public ArrayList<QNA> selectQnaList(String memberId) {
		List list = dao.selectQnaList(memberId);
		return (ArrayList<QNA>)list;
	}
}
