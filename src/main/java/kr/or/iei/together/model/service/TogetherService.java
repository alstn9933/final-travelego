package kr.or.iei.together.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.iei.together.model.dao.TogetherDao;

@Service("togetherService")
public class TogetherService {
	
	@Autowired
	@Qualifier("togetherDao")
	TogetherDao dao;
	
}
