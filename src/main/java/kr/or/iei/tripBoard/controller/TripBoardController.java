package kr.or.iei.tripboard.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.iei.tripboard.model.service.TripBoardService;

@Controller
@RequestMapping("/tripboard")
public class TripBoardController {
	
	@Autowired
	@Qualifier("tripBoardService")
	TripBoardService service;

	@RequestMapping("/writeFrm.do")
	public String writeFrm() {
		return "tripboard/write";
	}
	
	@RequestMapping("/main.do")
	public String main(HttpSession session, Model model) {
		
		return "tripboard/main";
	}
}
