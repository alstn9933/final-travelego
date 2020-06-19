package kr.or.iei.tour.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.iei.tour.model.service.TourService;
import kr.or.iei.tour.model.vo.TourVO;

@Controller
public class TourController {
	@Autowired
	@Qualifier("tourService")
	private TourService service;
	
	@RequestMapping(value="/tourList.do")
	public String selectTourList(Model model) {
		return "tour/tourList";
	}
	
	@RequestMapping(value="/comTourList.do")
	public String goTourList(HttpSession session, Model model) {
		String memberId = "com01";
		int totalCount = service.selectTotalCount(memberId);
		model.addAttribute("totalCount",totalCount);
		return "tour/comTourList";
	}
	
	@RequestMapping(value="/tourView.do")
	public String selectOneTour(int itemNo) {
		return "tour/tourView";
	}
	
	@ResponseBody
	@RequestMapping(value="/moreItem.do", produces = "application/json; charset=utf-8")
	public String selectTourList(int start, HttpSession session) {
		String memberId = "com01";
		ArrayList<TourVO> list = service.moreItemList(start,memberId);
		System.out.println(list.size());
		return new Gson().toJson(list);
	}
}
