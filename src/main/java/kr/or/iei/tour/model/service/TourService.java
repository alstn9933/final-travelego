package kr.or.iei.tour.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.iei.common.model.vo.Photo;
import kr.or.iei.common.model.vo.Region;
import kr.or.iei.tour.model.dao.TourDao;
import kr.or.iei.tour.model.vo.MoreTourVal;
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

	public ArrayList<TourVO> moreItemList(int start,String memberId) {
		int length = 12;
		int end = start+length-1;
		MoreTourVal mtv = new MoreTourVal();
		mtv.setMemberId(memberId);
		mtv.setStart(start);
		mtv.setEnd(end);
		ArrayList<TourVO> list = (ArrayList<TourVO>)dao.moreItemList(mtv);
		for(TourVO tv : list) {
			String beginDate = tv.getBeginDate().substring(0,10);
			String endDate = tv.getEndDate().substring(0,10);
			tv.setBeginDate(beginDate);
			tv.setEndDate(endDate);
			int sum = 0;
			float avg=0;
			ArrayList<ReviewVO> rvList = (ArrayList<ReviewVO>)dao.selectReviewList(tv.getItemNo());
			for(ReviewVO rv : rvList) {
				sum+=rv.getReviewRate();
			}
			if(sum!=0) {
				avg =sum/rvList.size();
			}
			tv.setReveiwList(rvList);
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
		tv.setReveiwList((ArrayList<ReviewVO>)dao.selectReviewList(itemNo));
		return tv;
	}
}
