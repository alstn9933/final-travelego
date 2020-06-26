package kr.or.iei.reserve.controller;

import org.springframework.beans.factory.annotation.Qualifier;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.reserve.model.service.ReserveService;
import kr.or.iei.reserve.model.vo.ReserveVO;

@Controller
public class ReserveController {
	@Autowired
	@Qualifier("reserveService")
	private ReserveService service;
	
	@ResponseBody
	@RequestMapping(value="/checkTourTimes.do", produces = "application/json; charset=utf-8")
	public String checkTourTimes(int itemNo, String tourDate, String tourTimes, int maxPerson) {
		ArrayList<ReserveVO> rvlist = service.checkTourTimes(itemNo,tourDate,tourTimes,maxPerson);
		return new Gson().toJson(rvlist);
	}
	
	@RequestMapping(value="/reserveTour.do")
	public String insertReserve(HttpSession session, Model model, ReserveVO rv) {
		Member m = (Member)session.getAttribute("member");
		String memberId = m.getMemberId();
		rv.setMemberId(memberId);
		model.addAttribute(rv);
		return "reserve/cofirmReserve";
	}
}
