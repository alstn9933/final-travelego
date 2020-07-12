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
	
	public HashMap<String, Object> selectBoardList(String memberId, int board, int reqPage) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("board",board);
		
		int numPerPage = 10;
		//총 게시글 수 구하기
		int totalCount = dao.totalBoardCount(map);
		int totalPage = 0;
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		
		
		map.put("reqPage", reqPage);
		map.put("start", start);
		map.put("end", end);
		
		List list = dao.selectAllBoard(map);
		
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo!=1) {
			pageNavi += "<a class='btn' href='/boardList.do?board="+board+"&reqPage="+(pageNo-pageNaviSize)+"'>이전</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage==pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/boardList.do?board="+board+"&reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;		//pageNo은 페이지 시작번호만 나타내기 때문에 페이지네비의 다른 페이지들을 출력하기 위해 ++
			
			//마지막 페이지 만났을 때 더이상 페이지넘버 출력 X
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/boardList.do?board="+board+"&reqPage="+pageNo+"'>다음</a>";
		}
		
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("list", list);
		map2.put("pageNavi", pageNavi);
		return map2;
	}

	public HashMap<String, Object> selectBookmarkList(String memberId, int board, int reqPage) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("board",board);
		
		int numPerPage = 10;
		//총 게시글 수 구하기
		int totalCount = dao.totalBookmarkCount(map);
		int totalPage = 0;
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		
		
		map.put("reqPage", reqPage);
		map.put("start", start);
		map.put("end", end);
		
		List list = dao.selectBookmark(map);
		
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo!=1) {
			pageNavi += "<a class='btn' href='/bookmark.do?board="+board+"&reqPage="+(pageNo-pageNaviSize)+"'>이전</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage==pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/bookmark.do?board="+board+"&reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;		//pageNo은 페이지 시작번호만 나타내기 때문에 페이지네비의 다른 페이지들을 출력하기 위해 ++
			
			//마지막 페이지 만났을 때 더이상 페이지넘버 출력 X
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/bookmark.do?board="+board+"&reqPage="+pageNo+"'>다음</a>";
		}
		
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("list", list);
		map2.put("pageNavi", pageNavi);
		
		return map2;
	}

	public int insertQuestion(QNA qna) {
		// TODO Auto-generated method stub
		return dao.insertQuestion(qna);
	}

	public HashMap<String, Object> selectQnaList(String qnaWriter, int reqPage) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("qnaWriter", qnaWriter);
		
		int numPerPage = 10;
		//총 게시글 수 구하기
		int totalCount = dao.totalQNACount(qnaWriter);
		int totalPage = 0;
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		
		
		map.put("reqPage", reqPage);
		map.put("start", start);
		map.put("end", end);
		
		List list = dao.selectQnaList(map);
		
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo!=1) {
			pageNavi += "<a class='btn' href='/qnaList.do?reqPage="+(pageNo-pageNaviSize)+"'>이전</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage==pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/qnaList.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;		//pageNo은 페이지 시작번호만 나타내기 때문에 페이지네비의 다른 페이지들을 출력하기 위해 ++
			
			//마지막 페이지 만났을 때 더이상 페이지넘버 출력 X
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/qnaList.do?reqPage="+pageNo+"'>다음</a>";
		}
		
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("list", list);
		map2.put("pageNavi", pageNavi);
		
		return map2;
	}

	public int leaveAnswer(QNA qna) {
		// TODO Auto-generated method stub
		return dao.leaveAnswer(qna);
	}
}
