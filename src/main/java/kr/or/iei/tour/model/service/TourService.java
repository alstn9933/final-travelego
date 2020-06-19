package kr.or.iei.tour.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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
			int sum = 0;
			float avg=0;
			ArrayList<ReviewVO> rvList = (ArrayList<ReviewVO>)dao.selectReviewList(tv.getItemNo());
			System.out.println(rvList.size());
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
}
