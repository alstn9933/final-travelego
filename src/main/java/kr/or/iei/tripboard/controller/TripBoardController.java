package kr.or.iei.tripBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tripboard")
public class TripBoardController {

	@RequestMapping("/writeFrm.do")
	public String writeFrm() {
		return "tripboard/write";
	}
	
	@RequestMapping("/main.do")
	public String main() {
		return "tripboard/main";
	}
}
