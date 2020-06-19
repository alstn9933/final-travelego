package kr.or.iei.mytrip.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.iei.mytrip.model.dao.MytripDao;
import kr.or.iei.mytrip.model.vo.Mytrip;

@Service("mytripService")
public class MytripService {
	@Autowired
	@Qualifier("mytripDao")
	private MytripDao dao;
	
	public int insertTrip(Mytrip t) {
		return dao.insertTrip(t);
	}
}
