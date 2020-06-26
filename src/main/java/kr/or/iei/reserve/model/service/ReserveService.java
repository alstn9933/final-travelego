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
					rv.setPersonCount(maxPerson-rv.getPersonCount());
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

	public int checkReserve(ReserveVO rv) {
		int totalPerson = dao.checkReserve(rv);
		int maxPerson = dao.selectOneTour(rv.getItemNo());
		if(totalPerson+rv.getPersonCount()>maxPerson) {
			return 3;
		}
		int result = dao.insertReserve(rv);
		return result;
	}
}
