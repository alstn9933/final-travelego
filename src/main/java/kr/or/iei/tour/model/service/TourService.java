package kr.or.iei.tour.model.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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

	public int selectTotalCount(String memberId) {
		return dao.selectTotalCount(memberId);
	}

	public ArrayList<TourVO> moreItemList(int start,String memberId,int memberLevel, String val) {
		int length = 12;
		int end = start+length-1;
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("memberLevel", String.valueOf(memberLevel));
		map.put("val", val);
		ArrayList<TourVO> list = (ArrayList<TourVO>)dao.moreItemList(map);
		for(TourVO tv : list) {
			String beginDate = tv.getBeginDate().substring(0,10);
			String endDate = tv.getEndDate().substring(0,10);
			tv.setBeginDate(beginDate);
			tv.setEndDate(endDate);
			double sum = 0;
			double avg=0;
			ArrayList<ReviewVO> rvList = (ArrayList<ReviewVO>)dao.selectReviewList(tv.getItemNo());
			for(ReviewVO rv : rvList) {
				sum+=rv.getReviewRate();
			}
			if(sum!=0) {
				avg =sum/rvList.size();
			}
			tv.setScore(avg);
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
		if(pageNo!=1) {
			pageNavi += "<button type='button' class='btn btn-outline-info' id='rPaging' onclick='moreReview("+(pageNo-1)+");'><</button>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(reqPage==pageNo) {
				pageNavi += "<div class='btn curr'>"+pageNo+"</div>";
			}else {
				pageNavi += "<button type='button' class='btn btn-outline-info' id='rPaging' onclick='moreReview("+pageNo+");'>"+pageNo+"</button>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<button type='button' class='btn btn-outline-info' id='rPaging' onclick='moreReview("+pageNo+");'>></button>";
		}
		ReviewData rd = new ReviewData();
		rd.setPageNavi(pageNavi);
		rd.setReviewList((ArrayList<ReviewVO>)list);
		
		return rd;
	}

	public void tourCloseCheck() {
		ArrayList<TourVO> tList = (ArrayList<TourVO>)dao.selectAllTour();
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-mm-dd");
		Date nowDate = new Date();
		nowDate.setTime (nowDate.getTime()-((long)1000*60*60*24));
		for(TourVO t : tList) {
			try {
				Date endDate = dateformat.parse(t.getEndDate().substring(0,10));
				int compare = nowDate.compareTo(endDate);
				if(compare>0) {
					int result = dao.tourCloseCheck(t.getItemNo());
					System.out.println(t.getItemNo()+"이 마감되었습니다");
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
