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
	public String makePlanFrm(Model model, int tripNoIs) {
		ArrayList<Region> regionList = service.regionList();
		model.addAttribute("regionList",regionList);
		model.addAttribute("tripNoIs",tripNoIs);
		if(tripNoIs==0) {
			System.out.println("0임!!!");
		}else {
			Mytrip mytrip = service.selectMytrip(tripNoIs);
			int regionNoIs = mytrip.getRegionNo();
			String beginDateIs = mytrip.getBtrans();
			String endDateIs = mytrip.getEtrans();
			model.addAttribute("regionNoIs",regionNoIs);
			model.addAttribute("beginDateIs",beginDateIs);
			model.addAttribute("endDateIs",endDateIs);
			
			ArrayList<TripDetail> detailList = service.selectDateList(tripNoIs);
			model.addAttribute("detailList",detailList);
		}
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
	@RequestMapping(value="/addMemo.do", produces = "application/json;charset=utf-8")
	public String addMemo(int tripNo, String tripDate, String tripContent, String tripSpot) {
		System.out.println(tripContent);
		TripDetail tripDetail = new TripDetail();
		tripDetail.setTripNo(tripNo);
		tripDetail.setTripDate(tripDate);
		System.out.println(111);
		System.out.println(tripDate);
		System.out.println(tripContent);
		System.out.println(tripSpot);
		System.out.println(222);
		tripDetail.setTripContent(tripContent);
		tripDetail.setTripSpot(tripSpot);
		TripDetail tdExist = service.ifExist(tripDetail);
		
		if(tripSpot=="" && tripContent=="") {
			
		}else {
			if(tdExist == null) {
				int result = service.addMemoFirst(tripDetail);
			} else {
				int result = service.addMemo(tripDetail);
			}
		}
		
		
		TripDetail tripOrder = service.tripOrderIs(tripDetail);
		if (tripOrder==null) {
			System.out.println("tripOrderIs실패");
			return "0";
		} else {
			System.out.println("tripOrderIs성공");
			return new Gson().toJson(tripOrder);
		}
		
	}
	
	@RequestMapping(value="/mapPopup.do")
	public String mapPopup(Model model, String spotValue) {
		model.addAttribute("spotValue",spotValue);
		return "mytrip/mapPopup";
	}

	@ResponseBody
	@RequestMapping(value="/deleteMemo.do", produces = "application/json;charset=utf-8")
	public String deleteMemo(int tripNo, int tripOrder, String tripDate) {
		TripDetail tripDetail = new TripDetail();
		tripDetail.setTripOrder(tripOrder);
		tripDetail.setTripDate(tripDate);
		tripDetail.setTripNo(tripNo);
		int result = service.deleteMemo(tripDetail);
		if(result>0) {
			System.out.println("메모지우기성공");
			result = service.sortMemo(tripDetail);
		}else {
			System.out.println("메모지우기실패");
		}
		
		ArrayList<TripDetail> orderList = service.selectDateList(tripNo);
		return new Gson().toJson(orderList);
	}
	
	@ResponseBody
	@RequestMapping(value="/changeOrder.do")
	public String changeOrder(int tripNo, String tripDate, int saveValue1, String saveValue2, String saveValue3, String saveValue4, int prevValue1, String prevValue2, String prevValue3, String prevValue4) {
		//0으로 맞춰줄 전에거
		TripDetail tripDetail1 = new TripDetail();
		tripDetail1.setTripNo(tripNo);
		tripDetail1.setTripDate(tripDate);
		tripDetail1.setTripOrder(prevValue1);
		int result = service.changeOrder1(tripDetail1);
		if(result>0) {
			TripDetail tripDetail2 = new TripDetail();
			tripDetail2.setTripNo(tripNo);
			tripDetail2.setTripDate(tripDate);
			tripDetail2.setTripOrder(saveValue1);
			result = service.changeOrder2(tripDetail2);
			if(result>0) {
				System.out.println("정렬거의성공");
				result = service.changeOrder3(tripDetail2);
				if(result>0) {
					System.out.println("정렬성공");
				}
			}
		}
		
		return null;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/changeOrder2.do")
	public String changeOrder2(int tripNo, String tripDate, int saveValue1, String saveValue2, String saveValue3, String saveValue4, int prevValue1, String prevValue2, String prevValue3, String prevValue4) {
		//0으로 맞춰줄 전에거
		TripDetail tripDetail1 = new TripDetail();
		tripDetail1.setTripNo(tripNo);
		tripDetail1.setTripDate(tripDate);
		tripDetail1.setTripOrder(prevValue1);
		int result = service.changeOrder1(tripDetail1);
		if(result>0) {
			TripDetail tripDetail2 = new TripDetail();
			tripDetail2.setTripNo(tripNo);
			tripDetail2.setTripDate(tripDate);
			tripDetail2.setTripOrder(saveValue1);
			result = service.changeOrder4(tripDetail2);
			if(result>0) {
				System.out.println("정렬거의성공");
				result = service.changeOrder3(tripDetail2);
				if(result>0) {
					System.out.println("정렬성공");
				}
			}
		}
		
		return null;
	}
	
	@RequestMapping(value="/invitePopup.do")
	public String invitePopup(Model model, int currValIs) {
		model.addAttribute("currValIs",currValIs);
		return "mytrip/invite";
	}
	
	@ResponseBody
	@RequestMapping(value="/invite.do")
	public String invite(int tripNo, String memberNickname) {
		String memberId = service.selectNickname(memberNickname);
		System.out.println(memberId);
		//System.out.println(tripNo);
		
		return "0";
	}
	
}
