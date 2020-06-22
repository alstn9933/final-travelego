package kr.or.iei.mypage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.mypage.model.service.MypageService;
import kr.or.iei.mypage.model.vo.BoardList;
import kr.or.iei.mypage.model.vo.Bookmark;

@Controller
public class MypageController {
	@Autowired
	@Qualifier("myPageService")
	private MypageService service;

	@RequestMapping(value="/myPage.do")
	public String mypage(HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("member");
		model.addAttribute("member",m);
		return "member_myPage/myPage";
	}
	
	@RequestMapping(value="/boardList.do")
	public String boardList(HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("member");
		ArrayList<BoardList> bList = service.selectBoardList(m);
		model.addAttribute("bList", bList);
		return "member_myPage/boardList";
	}
	
	@RequestMapping(value="/bookmark.do")
	public String bookmark(HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("member");
		ArrayList<Bookmark> mList = service.selectBookmarkList(m);
		model.addAttribute("mList", mList);
		return "member_myPage/bookmark";
	}
}
