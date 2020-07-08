package kr.or.iei.tripboard.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.iei.tripboard.model.dao.TripBoardDao;

@Service("tripBoardService")
public class TripBoardService {
	
	@Autowired
	@Qualifier("tripBoardDao")
	TripBoardDao dao;
	

}
