package kr.or.iei.reserve.model.service;

import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.reserve.model.dao.ReserveDao;

@Service("reserveService")
public class ReserveService {
	@Autowired
	@Qualifier("reserveDao")
	private ReserveDao dao;
}
