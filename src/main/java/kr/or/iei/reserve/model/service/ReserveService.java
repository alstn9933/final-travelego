package kr.or.iei.reserve.model.service;

import org.springframework.beans.factory.annotation.Qualifier;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.reserve.model.dao.ReserveDao;
import kr.or.iei.reserve.model.vo.ReserveVO;

@Service("reserveService")
public class ReserveService {
	@Autowired
	@Qualifier("reserveDao")
	private ReserveDao dao;

	public ArrayList<ReserveVO> checkTourTimes(int itemNo, String tourDate) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("itemNo", String.valueOf(itemNo));
		map.put("tourDate", String.valueOf(tourDate));
		return (ArrayList<ReserveVO>)dao.checkTourTimes(map);
	}
}
