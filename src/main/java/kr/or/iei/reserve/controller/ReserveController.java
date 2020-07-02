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
import kr.or.iei.tour.model.vo.ReviewVO;

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
	
	@ResponseBody
	@RequestMapping(value="/checkAndInsert.do", produces = "application/json; charset=utf-8")
	public int checkReserve(int itemNo, String tourDate, String tourTime, int personCount, int maxPerson, HttpSession session) {
		Member m = (Member)session.getAttribute("member");
		String memberId = m.getMemberId();
		ReserveVO r = new ReserveVO();
		r.setMemberId(memberId);
		r.setItemNo(itemNo);
		r.setTourDate(tourDate);
		r.setTourTime(tourTime);
		r.setPersonCount(personCount);
		int result = service.checkAndInsert(r,maxPerson);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/cancelReserve.do", produces = "application/json; charset=utf-8")
	public int cancelResereve(int reserveNo) {
		return service.cancelReserve(reserveNo);
	}
	
	@ResponseBody
	@RequestMapping(value="/modifyPay.do", produces = "application/json; charset=utf-8")
	public int modifyPay(int reserveNo, int totalPay) {
		ReserveVO r = new ReserveVO();
		r.setReserveNo(reserveNo);
		r.setTotalPay(totalPay);
		return service.modifyPayment(r);
	}
	
	@RequestMapping(value="/reserveTour.do")
	public String successPayment(int reserveNo, Model model, HttpSession session) {
		Member m = (Member)session.getAttribute("member");
		if(m!=null) {
			ReserveVO r = service.selectReserveInfo(reserveNo);
			if(r!=null) {
				if(m.getMemberId()!=r.getMemberId()) {
					r.setTourDate(r.getTourDate().substring(0,10));
					model.addAttribute("info",r);
					return "reserve/reserveInfo";
				}
			}
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="/myReservation.do")
	public String memberReserveList(HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("member");
		if(m==null||m.getMemberLevel()!=1) {
			model.addAttribute("msg","개인회원만 접근가능합니다");
			model.addAttribute("loc","/");
			return "common/msg";
		}
		return "reserve/memberReserveList";
	}
	
	@ResponseBody
	@RequestMapping(value="/selectTotalCount.do", produces = "application/json; charset=utf-8")
	public String selectMyReserveTotalCount(HttpSession session, String status) {
		Member m = (Member)session.getAttribute("member");
		int totalCount = service.selectMyReserveTotalCount(m,status);
		return new Gson().toJson(totalCount);
	}
	
	@ResponseBody
	@RequestMapping(value="/moreReserve.do", produces = "application/json; charset=utf-8")
	public String selectMoreReserve(HttpSession session, int start, String status) {
		Member m = (Member)session.getAttribute("member");
		ArrayList<ReserveVO> rList = service.selectMoreReserve(m,start,status);
		return new Gson().toJson(rList);
	}
	
	@ResponseBody
	@RequestMapping(value="/writeReview.do", produces = "application/json; charset=utf-8")
	public String insertReview(HttpSession session, String reviewContent, int itemNo, int reserveNo, int reviewRate) {
		Member m = (Member)session.getAttribute("member");
		ReviewVO r = new ReviewVO();
		r.setItemNo(itemNo);
		r.setMemberId(m.getMemberId());
		r.setReserveNo(reserveNo);
		r.setReviewContent(reviewContent);
		r.setReviewRate(reviewRate);
		int result = service.insertReview(r);
		return new Gson().toJson(result);
	}
}
