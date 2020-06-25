package kr.or.iei.mytrip.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.iei.mytrip.model.service.MytripService;
import kr.or.iei.mytrip.model.vo.Mytrip;

@Controller
public class MytripController {
	@Autowired
	@Qualifier("mytripService")
	private MytripService service;
	
	@RequestMapping(value="/mytripFrm.do")
	public String mytripFrm() {
		return "mytrip/mytripFrm";
	}
	
	@RequestMapping(value="/insertTrip.do")
	public String insertTrip(Mytrip t) {
		int result = service.insertTrip(t);
		if(result>0) {
			
		}else {
			
		}
		return "mytrip/mytripFrm";
	}
	
	@RequestMapping(value="/makePlanFrm.do")
	public String makePlanFrm() {
		return "mytrip/makePlanFrm";
	}
}
