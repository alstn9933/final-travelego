package kr.or.iei.tour.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.or.iei.member.model.vo.Member;
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
		Member m = (Member)session.getAttribute("member");
		if(m!=null && m.getMemberLevel()==2) {
			String memberId = m.getMemberId();
			int totalCount = service.selectTotalCount(memberId);
			model.addAttribute("totalCount",totalCount);
			return "tour/comTourList";
		}else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/tourView.do")
	public String selectOneTour(int itemNo) {
		return "tour/tourView";
	}
	
	@ResponseBody
	@RequestMapping(value="/moreItem.do", produces = "application/json; charset=utf-8")
	public String selectTourList(int start, HttpSession session) {
		Member m = (Member)session.getAttribute("member");
		String memberId = m.getMemberId();
		ArrayList<TourVO> list = service.moreItemList(start,memberId);
		return new Gson().toJson(list);
	}
	
	@RequestMapping(value="/createTourFrm.do")
	public String createTourFrm(HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("member");
		if(m!=null && m.getMemberLevel()==2) {
			model.addAttribute("memberId",m.getMemberId());
			return "tour/createTourFrm";
		}else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/insertTourItem.do")
	public String insertTour(HttpServletRequest request, HttpServletResponse response,MultipartFile upload, TourVO tv, String beginEnd) {
		System.out.println(tv.getFilepath());
		System.out.println(tv.getItemContent());
		System.out.println(tv.getItemPrice());
		System.out.println(tv.getItemTitle());
		System.out.println(tv.getMaxPerson());
		System.out.println(tv.getMemberId());
		System.out.println(tv.getRegionNo());
		System.out.println(tv.getTourTimes());
		System.out.println(beginEnd);
		return "tour/comTourList";
	}
}
