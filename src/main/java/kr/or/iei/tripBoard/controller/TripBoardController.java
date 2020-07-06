package kr.or.iei.tripBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.iei.tripBoard.model.service.TripBoardService;

@Controller
public class TripBoardController {
	@Autowired
	@Qualifier("tripBoardService")
	private TripBoardService service;
	public TripBoardController() {
		super();
		System.out.println("TripBoardController 생성완료");
	}
	@RequestMapping(value = "/tripBoardWrite.do")
	public String tripboard() {
		return "tripBoard/tripBoardWrite";
	}
	
	
	
	
}
