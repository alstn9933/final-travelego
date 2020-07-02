package kr.or.iei.mytrip.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kr.or.iei.common.model.vo.Region;
import kr.or.iei.mytrip.model.service.MytripService;
import kr.or.iei.mytrip.model.vo.Mytrip;

@Controller
public class MytripController {
	@Autowired
	@Qualifier("mytripService")
	private MytripService service;

	@RequestMapping(value = "/mytripFrm.do")
	public String mytripFrm() {
		return "mytrip/mytripFrm";
	}

	@RequestMapping(value = "/insertTrip.do")
	public String insertTrip(Mytrip t) {
		int result = service.insertTrip(t);
		if (result > 0) {

		} else {

		}
		return "mytrip/mytripFrm";
	}

	@RequestMapping(value = "/makePlanFrm.do")
	public String makePlanFrm() {
		return "mytrip/makePlanFrm";
	}

	@ResponseBody
	@RequestMapping(value = "/searchRegion.do", produces = "application/json;charset=utf-8")
	public String searchRegion(String regionCity) {
		ArrayList<Region> region = service.searchRegion(regionCity);
		if (region.isEmpty()) {
			return "0";
		} else {
			return new Gson().toJson(region);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/makeMytrip.do")
	//public String makeMytrip(HttpServletRequest request, String[] sendArr) {
	public String makeMytrip(String[] sendArr) {
		for(int i=0; i<sendArr.length; i++) {
			System.out.println(sendArr[i]);
		}
		return "mytrip/makePlanFrm";
	}

}
