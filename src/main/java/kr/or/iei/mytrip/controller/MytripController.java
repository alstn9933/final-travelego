package kr.or.iei.mytrip.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import kr.or.iei.common.model.vo.Region;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.mytrip.model.service.MytripService;
import kr.or.iei.mytrip.model.vo.Mytrip;
import kr.or.iei.mytrip.model.vo.TripDetail;
import kr.or.iei.mytrip.model.vo.TripMember;

@Controller
public class MytripController {
	@Autowired
	@Qualifier("mytripService")
	private MytripService service;
	private JsonElement tripNo;

	@RequestMapping(value = "/mytripFrm.do")
	public String mytripFrm(HttpSession session, Model model) {
		Member member = (Member)session.getAttribute("member");
		TripMember tripMember = new TripMember();
		tripMember.setMemberId(member.getMemberId());
		List<TripMember> list = service.selectTripList(tripMember);
		model.addAttribute("list",list);
		return "mytrip/mytripFrm";
	}

	@RequestMapping(value = "/insertTrip.do")
	public String insertTrip(Mytrip t) {
		int result = service.insertTrip(t);
		if (result > 0) {

		} else {

		}
		return "mytrip/mytripFrm";
	}

	@RequestMapping(value = "/makePlanFrm.do")
	public String makePlanFrm(Model model) {
		ArrayList<Region> regionList = service.regionList();
		model.addAttribute("regionList",regionList);
		return "mytrip/makePlanFrm";
	}

	@ResponseBody
	@RequestMapping(value = "/searchRegion.do", produces = "application/json;charset=utf-8")
	public String searchRegion(String regionCity) {
		ArrayList<Region> region = service.searchRegion(regionCity);
		if (region.isEmpty()) {
			return "0";
		} else {
			return new Gson().toJson(region);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/makeMytrip.do", produces = "application/json;charset=utf-8")
	public String makeMytrip(HttpSession session, Model model, Date[] sendArr, int regionNo) {
		Date beginDate = sendArr[0];
		Date endDate = sendArr[sendArr.length-1];
		Mytrip mytrip = new Mytrip();
		mytrip.setRegionNo(regionNo);
		mytrip.setBeginDate(beginDate);
		mytrip.setEndDate(endDate);
		TripMember tripMember = new TripMember();
		Member member = (Member)session.getAttribute("member");
		tripMember.setMemberId(member.getMemberId());
		System.out.println(tripMember.getMemberId());
		int result = service.setMytrip(mytrip);
		if(result>0) {
			//model.addAttribute("msg","생성성공");
			System.out.println("생성성공");
			result = 0;
			result = service.insertTripMember(tripMember);
			if(result>0) {
				System.out.println("추가까지성공"); 
				//currValIs = service.currValIs();
				//mytrip.setTripNo(tripNo);
				//System.out.println(currValIs);
				//model.addAttribute("currValIs",currValIs);
				ArrayList<Mytrip> tripNo = service.currValIs();
				if (tripNo.isEmpty()) {
					return "0";
				} else {
					return new Gson().toJson(tripNo);
				}
			}else { 
				System.out.println("추가는실패"); 
				return null;
			}
		}else {
			System.out.println("생성실패");
			return null;
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/addMemo.do")
	public String addMemo(int tripNo, String tripDate, String tripContent) {
		System.out.println(tripContent);
		TripDetail tripDetail = new TripDetail();
		tripDetail.setTripNo(tripNo);
		tripDetail.setTripDate(tripDate);
		System.out.println(tripDate);
		tripDetail.setTripContent(tripContent);
		
		TripDetail tdExist = service.ifExist(tripDetail);
		if(tdExist == null) {
			System.out.println("널임");
			int result = service.addMemoFirst(tripDetail);
		} else {
			System.out.println("널 아님");
			int result = service.addMemo(tripDetail);
		}
		
		return null;
		
//		System.out.println(111);
//		System.out.println(tripDate);
//		System.out.println(tripNo);
//		System.out.println(2222);
//		TripDetail tripDetail = new TripDetail();
//		//tripDate.format(thisDate);
//		System.out.println(333);
//		System.out.println(tripDate);
//		System.out.println(444);
//		tripDetail.setTripNo(tripNo);
//		tripDetail.setTripDate(tripDate);
//		return null;
	}
	
	@RequestMapping(value="/mapPopup.do")
	public String mapPopup() {
		return "mytrip/mapPopup";
	}

}
