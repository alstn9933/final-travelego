package kr.or.iei.tripBoard.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.iei.tripBoard.model.dao.TripBoardDao;


@Service("tripBoardService")
public class TripBoardService {
	@Autowired
	@Qualifier("tripBoardDao")
	
	private TripBoardDao dao;

	public TripBoardService() {
		super();
		System.out.println("TripBoardService 생성 완료");
	}
}
