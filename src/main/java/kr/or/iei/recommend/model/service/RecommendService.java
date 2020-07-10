package kr.or.iei.recommend.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sun.javafx.collections.MappingChange.Map;

import kr.or.iei.common.model.vo.BoardComment;
import kr.or.iei.common.model.vo.Liked;
import kr.or.iei.common.model.vo.Region;
import kr.or.iei.mypage.model.vo.Bookmark;
import kr.or.iei.recommend.model.dao.RecommendDao;
import kr.or.iei.recommend.model.vo.Recommend;
import kr.or.iei.recommend.model.vo.SelectItems;

@Service("recommendService")
public class RecommendService {
	@Autowired
	@Qualifier("recommendDao")
	private RecommendDao dao;

	public ArrayList<Region> selectAllRegion() {
		
		List list = dao.selectAllRegion();
		return (ArrayList<Region>)list;
	}

	public ArrayList<Region> selectCities(String country) {
		List list = dao.selectCities(country);
		return (ArrayList<Region>)list;
		
	}
	
	public HashMap<String, Object> selectAllRec(int reqPage) {
		int numPerPage = 12;
		//총 게시글 수 구하기
		int totalCount = dao.totalRecCount();
		int totalPage = 0;
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("reqPage", reqPage);
		map.put("start", start);
		map.put("end", end);
		
		List list = dao.selectAllRec(map);
		
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo!=1) {
			pageNavi += "<a class='btn' href='/recommendList.do?reqPage="+(pageNo-pageNaviSize)+"'>이전</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage==pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/recommendList.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;		//pageNo은 페이지 시작번호만 나타내기 때문에 페이지네비의 다른 페이지들을 출력하기 위해 ++
			
			//마지막 페이지 만났을 때 더이상 페이지넘버 출력 X
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/recommendList.do?reqPage="+pageNo+"'>다음</a>";
		}
		
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("list", list);
		map2.put("pageNavi", pageNavi);
		return map2;
	}

	public HashMap<String, Object> selectRecList(HashMap<String, Object> map) {
		int reqPage = (int) map.get("reqPage");
		
		int numPerPage = 12;
		//총 게시글 수 구하기
		int totalCount = dao.totalSelectedRecCount(map);
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
		
		List list = dao.selectRecList(map);
		
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo!=1) {
			pageNavi += "<a class='btn' href='/recommendList.do?reqPage="+(pageNo-pageNaviSize)+"'>이전</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage==pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/recommendList.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;		//pageNo은 페이지 시작번호만 나타내기 때문에 페이지네비의 다른 페이지들을 출력하기 위해 ++
			
			//마지막 페이지 만났을 때 더이상 페이지넘버 출력 X
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/recommendList.do?reqPage="+pageNo+"'>다음</a>";
		}
		
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("list", list);
		map2.put("pageNavi", pageNavi);
		return map2;
	}

	public Recommend selectOneRec(int recNo) {
		// TODO Auto-generated method stub
		return dao.selectOneRec(recNo);
	}
	public HashMap<String, Object> selectComments(int recNo, int reqPage, int cntCom) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("recNo", recNo);
		
		int numPerPage = 5;
		int totalPage = 0;
		if(cntCom%numPerPage==0) {
			totalPage = cntCom/numPerPage;
		}else {
			totalPage = cntCom/numPerPage+1;
		}
		
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		
		map.put("start", start);
		map.put("end", end);
		
		List list = dao.selectComments(map);
		
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo!=1) {
			pageNavi += "<a class='btn' href='/recDetail.do?recNo="+recNo+"&reqPage"+(pageNo-pageNaviSize)+"'>이전</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage==pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/recDetail.do?recNo="+recNo+"&reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;		//pageNo은 페이지 시작번호만 나타내기 때문에 페이지네비의 다른 페이지들을 출력하기 위해 ++
			
			//마지막 페이지 만났을 때 더이상 페이지넘버 출력 X
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/recDetail.do?recNo="+recNo+"&reqPage="+pageNo+"'>다음</a>";
		}
		
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("list", list);
		map2.put("pageNavi", pageNavi);
		return map2;
	}

	public int insertComment(BoardComment comment) {
		// TODO Auto-generated method stub
//		if(comment.getRefComment() == 0) {
//			String st = String.valueOf(comment.getRefComment());
//		}
		return dao.insertComment(comment);
	}

	public int insertRec(Recommend rec, String p) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("recTitle", rec.getRecTitle());
		map.put("recContent", rec.getRecContent());
		map.put("recWriter", rec.getRecWriter());
		map.put("recCategory", rec.getRecCategory());
		map.put("regionNo", rec.getRegionNo());
		map.put("coords", rec.getCoords());
		map.put("place", rec.getPlace());
		map.put("p", p);
		return dao.insertRec(map);
	}

	public int insertBookmark(int recNo, String memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", recNo);
		map.put("memberId", memberId);
		return dao.insertBookmark(map);
	}

	public int deleteBookmark(int recNo, String memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", recNo);
		map.put("memberId", memberId);
		return dao.deleteBookmark(map);
	}

	public Bookmark bookmarkList(String memberId, int recNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", recNo);
		map.put("memberId", memberId);
		return dao.selectBookmark(map);
	}

	public Liked likedList(String memberId, int recNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", recNo);
		map.put("memberId", memberId);
		return dao.selectLiked(map);
	}

	public int insertLike(int recNo, String memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", recNo);
		map.put("memberId", memberId);
		return dao.insertLike(map);
	}

	public int deleteLike(int recNo, String memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", recNo);
		map.put("memberId", memberId);
		return dao.deleteLike(map);
	}

	public int deleteComment(int commentNo) {
		return dao.deleteComment(commentNo);
	}

	public int selectCommentCount(int recNo) {
		// TODO Auto-generated method stub
		return dao.selectCommentCount(recNo);
	}

	public int deleteRec(int recNo) {
		// TODO Auto-generated method stub
		return dao.deleteRec(recNo);
	}

	public ArrayList<Recommend> selectAllRecPhoto() {
		// TODO Auto-generated method stub
		return (ArrayList<Recommend>)dao.selectAllRecPhoto();
	}

	public int updateComment(BoardComment c) {
		// TODO Auto-generated method stub
		return dao.updateComment(c);
	}

	public int updateRec(Recommend rec, String p) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("recNo", rec.getRecNo());
		map.put("recTitle", rec.getRecTitle());
		map.put("recContent", rec.getRecContent());
		map.put("recWriter", rec.getRecWriter());
		map.put("recCategory", rec.getRecCategory());
		map.put("regionNo", rec.getRegionNo());
		map.put("coords", rec.getCoords());
		map.put("place", rec.getPlace());
		System.out.println(rec.getRecNo());
		int result2 = 0;
		int result = dao.updateRec(map);
		if(result > 0) {
			result2 = dao.updatePhoto(map);
		}
		return result2;
	}

	public int plusReadCount(int recNo) {
		// TODO Auto-generated method stub
		return dao.plusReadCount(recNo);
	}

	


	
}
