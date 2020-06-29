package kr.or.iei.reserve.model.service;

import org.springframework.beans.factory.annotation.Qualifier;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.reserve.model.dao.ReserveDao;
import kr.or.iei.reserve.model.vo.ReserveVO;
import kr.or.iei.tour.model.vo.TourVO;

@Service("reserveService")
public class ReserveService {
	@Autowired
	@Qualifier("reserveDao")
	private ReserveDao dao;

	public ArrayList<ReserveVO> checkTourTimes(int itemNo, String tourDate, String tourTimes, int maxPerson) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("itemNo", String.valueOf(itemNo));
		map.put("tourDate", String.valueOf(tourDate));
		ArrayList<ReserveVO> rlist = (ArrayList<ReserveVO>)dao.checkTourTimes(map);
		String[] tarr = tourTimes.split(",");
		for(int i=0; i<tarr.length; i++) {
			int cnt=0;
			for(ReserveVO rv : rlist) {
				int time1 = Integer.parseInt(tarr[i]);
				int time2 = Integer.parseInt(rv.getTourTime());
				if(time1==time2) {
					cnt++;
					int pcnt = maxPerson-rv.getPersonCount();
					if(pcnt>=0) {
						rv.setPersonCount(pcnt);
					}else {
						rv.setPersonCount(0);
					}
				}
			}
			if(cnt==0) {
				ReserveVO rv = new ReserveVO();
				rv.setTourTime(tarr[i]);
				rv.setPersonCount(maxPerson);
				rlist.add(rv);
			}
		}
		return rlist;
	}

	public int checkAndInsert(ReserveVO r, int maxPerson) {
		ArrayList<ReserveVO> rList = (ArrayList<ReserveVO>)dao.checkReserve(r);
		int result = 0;
		if(rList.size()>0) {//예약내역체크
			if(rList.get(0).getPersonCount()+r.getPersonCount()>maxPerson) {//자리부족 예약불가
				result = -1;
			}else {//자리있음
				result = insertReserve(r);
			}
		}else {//조회 안됨 즉 예약가능
			result = insertReserve(r);
		}
		if(result>0) {
			result = dao.selectOneReserve(r.getMemberId());
		}
		return result;
	}

	public int insertReserve(ReserveVO r) {
		return dao.insertReserve(r);
	}

	public int cancelReserve(int reserveNo) {
		return dao.cancelReserve(reserveNo);
	}

	public int modifyPayment(ReserveVO r) {
		return dao.modifyPayment(r);
	}
	
	public ReserveVO selectReserveInfo(int reserveNo) {
		return dao.selectOneReserve(reserveNo);
	}
	
}
