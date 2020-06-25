package kr.or.iei.reserve.controller;

import org.springframework.beans.factory.annotation.Qualifier;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.iei.reserve.model.service.ReserveService;
import kr.or.iei.reserve.model.vo.ReserveVO;

@Controller
public class ReserveController {
	@Autowired
	@Qualifier("reserveService")
	private ReserveService service;
	
	@ResponseBody
	@RequestMapping(value="checkTourTimes.do", produces = "application/json; charset=utf-8")
	public String checkTourTimes(int itemNo, String tourDate) {
		ArrayList<ReserveVO> rvlist = service.checkTourTimes(itemNo,tourDate);
		return new Gson().toJson(rvlist);
	}
}
