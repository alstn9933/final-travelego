package kr.or.iei.tripBoard.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.mytrip.model.vo.TripDetail;
import kr.or.iei.tripboard.model.service.TripBoardService;
import kr.or.iei.tripboard.model.vo.TripBoardMyTripVO;

@Controller
@RequestMapping("/tripboard")
public class TripBoardController {
	
	@Autowired
	@Qualifier("tripBoardService")
	TripBoardService service;

	@ResponseBody
	@RequestMapping(value = "/asyncLoadTripRoute.do", produces = "application/json;charset=utf-8")
	public String loadTripRoute(int tripNo) {		
		ArrayList<TripDetail> list = service.selectTripDetail(tripNo);
		return new Gson().toJson(list);
	}
	
	@RequestMapping("/writeFrm.do")
	public String writeFrm(HttpSession session, Model model) {		
		Member member = (Member)session.getAttribute("member");		
		ArrayList<TripBoardMyTripVO> list = service.selectTrip(member);
		model.addAttribute("list", list);
		
		return "tripboard/write";
	}
	
	@RequestMapping("/main.do")
	public String main() {
		return "tripboard/main";
	}
}
