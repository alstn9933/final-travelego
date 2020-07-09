package kr.or.iei.tour.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.iei.common.model.vo.Photo;
import kr.or.iei.common.model.vo.Region;
import kr.or.iei.tour.model.dao.TourDao;
import kr.or.iei.tour.model.vo.ReviewData;
import kr.or.iei.tour.model.vo.ReviewVO;
import kr.or.iei.tour.model.vo.TourVO;

@Service("tourService")
public class TourService {
	@Autowired
	@Qualifier("tourDao")
	private TourDao dao;

	public int selectTotalCount(TourVO t) {
		return dao.selectTotalCount(t);
	}

	public ArrayList<TourVO> moreItemList(int start,String memberId, TourVO t,String array1, String array2) {
		if(t.getSearchValue()!=null&&t.getSearchValue()!="") {
			t.setSearchValue("%"+t.getSearchValue()+"%");
		}
		int length = 12;
		int end = start+length-1;
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("regionCountry",t.getRegionCountry());
		map.put("regionNo",String.valueOf(t.getRegionNo()));
		map.put("tourDate", t.getTourDate());
		map.put("searchValue",t.getSearchValue());
		map.put("array1", array1);
		map.put("array2", array2);
		ArrayList<TourVO> list = (ArrayList<TourVO>)dao.moreItemList(map);
		for(TourVO tv : list) {
			String beginDate = tv.getBeginDate().substring(0,10);
			String endDate = tv.getEndDate().substring(0,10);
			tv.setBeginDate(beginDate);
			tv.setEndDate(endDate);
		}
		return (ArrayList<TourVO>)list;
	}

	public ArrayList<Region> selectRegionList() {
		return (ArrayList<Region>)dao.selectCountryList();
	}

	public ArrayList<Region> selectRegionCity(String regionCountry) {
		List clist = dao.selectCityList(regionCountry);
		return (ArrayList<Region>)clist;
	}

	@Transactional
	public int insertTour(TourVO tv, Photo p) {
		int result =  dao.insertTour(tv);
		if(result>0) {
			List list =  dao.selectBoardNo(tv.getMemberId());
			TourVO t = (TourVO)list.get(0);
			p.setBoardClass(4);
			p.setBoardNo(t.getItemNo());
			int result2 = dao.insertPhoto(p);
			return result2;
		}else {
			return result;
		}
	}

	public TourVO selectOneTour(int itemNo) {
		TourVO tv =  dao.selectOneTour(itemNo);
		return tv;
	}

	public ReviewData moreReviewList(int reqPage, int itemNo) {
		int totalCount = dao.selectTotalReview(itemNo);
		int numPerPage = 5;
		int totalPage=0;
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int start = ((reqPage-1)*numPerPage)+1;
		int end = reqPage*numPerPage;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("itemNo", String.valueOf(itemNo));
		List list = dao.moreReviewList(map);
		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = 1;
		if(reqPage>3) {
			pageNo = reqPage-2;
		}
		
		pageNavi +="<nav aria-label='Page navigation'><ul class='pagination'>";
		if(pageNo!=1) {
			pageNavi += "<li class='page-item'><a class='page-link' id='rPaging' onclick='moreReview("+(pageNo-1)+");' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
			//pageNavi += "<button type='button' class='btn btn-outline-info' id='rPaging' onclick='moreReview("+(pageNo-1)+");'></button>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(reqPage==pageNo) {
				pageNavi+="<li class='page-item active'><a class='page-link'>"+pageNo+"</a></li>";
				//pageNavi += "<div class='btn curr'>"+pageNo+"</div>";
			}else {
				pageNavi+="<li class='page-item'><a id='rPaging' class='page-link' onclick='moreReview("+pageNo+");'>"+pageNo+"</a></li>";
				//pageNavi += "<button type='button' class='btn btn-outline-info' id='rPaging' onclick='moreReview("+pageNo+");'>"+pageNo+"</button>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'><a class='page-link' id='rPaging' onclick='moreReview("+pageNo+");' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
			//pageNavi += "<button type='button' class='btn btn-outline-info' id='rPaging' onclick='moreReview("+pageNo+");'>></button>";
		}
		pageNavi += "</ul></navi>";
		ReviewData rd = new ReviewData();
		rd.setPageNavi(pageNavi);
		rd.setReviewList((ArrayList<ReviewVO>)list);
		
		return rd;
	}

	@Transactional
	public int tourCloseCheck() {
		return dao.tourCloseCheck();
	}

	@Transactional
	public int deleteTourItem(int itemNo) {
		return dao.deleteTourItem(itemNo);
	}

	@Transactional
	public int closeTourItem(int itemNo) {
		return dao.closeTourItem(itemNo);
	}
}