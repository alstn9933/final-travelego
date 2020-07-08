package kr.or.iei.tripboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/tripboard")
public class TripBoardController {
	
	@RequestMapping("/open.do")
	public String testOpen() {
		
		return "tripboard/main";
	}
	
	@RequestMapping("/writeFrm.do")
	public String writeFrm() {
		return "tripboard/write";
	}
	
}
