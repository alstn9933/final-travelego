package kr.or.iei.together.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.iei.common.model.vo.Region;
import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.together.model.service.TogetherService;
import kr.or.iei.together.model.vo.TogetherBoardVO;
import kr.or.iei.together.model.vo.TogetherCommentVO;

@Controller
@RequestMapping("/together")
public class TogetherController {
	
	@Autowired
	TogetherService service;
	
	@Autowired
	MemberService memberService;
	
	@ResponseBody
	@RequestMapping(value = "/modifyFrm.do", produces = "application/json;charset=utf-8")
	public String modifyFrm(int boardNo) {
		TogetherBoardVO vo = service.selectOneBoard(boardNo);
		return new Gson().toJson(vo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/asyncCommentLoad.do", produces = "application/json;charset=utf-8")
	public String asyncCommentLoad(int boardNo) {
		ArrayList<TogetherCommentVO> list = service.selectCommentList(boardNo);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value = "/writeComment.do", produces = "text/html;charset=utf-8")
	public String writeComment(TogetherCommentVO comment) {
		int result = service.insertComment(comment);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/asyncLoad.do", produces = "application/json;charset=utf-8")
	public String asyncLoad(int lastNum) {
		ArrayList<TogetherBoardVO> list = service.selectBoardList(lastNum);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value = "/view.do", produces = "application/json;charset=utf-8")
	public String asyncView(int togetherNo) {
		TogetherBoardVO vo = service.selectOneBoard(togetherNo);
		return new Gson().toJson(vo);
	}
		
	@RequestMapping("/main.do")
	public String main(Model model) {
		
		ArrayList<TogetherBoardVO> list = service.selectBoardList();
		model.addAttribute("list",list);
		return "together/main";
	}
	
	@ResponseBody
	@RequestMapping(value = "/write.do", produces = "text/html;charset=utf-8")
	public String boardWrite(HttpSession session, TogetherBoardVO board) {
		System.out.println(board.getTogetherContent());
		int result = service.insertBoard(board);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/searchRegion.do", produces = "application/json;charset=utf-8")
	public String searchRegion(String keyword) {
		ArrayList<Region> list = service.selectRegionByKeyword(keyword);
		
		for(Region r : list) {
			System.out.println(r.getRegionCity());			
		}
		
		return new Gson().toJson(list);
	}
	
	@RequestMapping("/open.do")
	public String test(HttpServletRequest request) {
		
		return "together/main";
	}
	
	@RequestMapping("/join.do")
	public String join(String userId) {
		
		Member member = new Member();
		member.setMemberId(userId);
		member.setMemberPw("1234");
		member.setMemberName(userId);
		member.setMemberNickname(userId);
		member.setPhone("0102345678");
		member.setEmail(userId);
		member.setMemberLevel(1);
		member.setGender("M");
		int result = memberService.joinMember(member);
		
		if(result >0) {			
			return "together/main";
		}else {
			return null;
		}
	}
}
