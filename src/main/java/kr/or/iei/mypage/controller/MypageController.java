package kr.or.iei.mypage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.mypage.model.service.MypageService;
import kr.or.iei.mypage.model.vo.BoardList;
import kr.or.iei.mypage.model.vo.Bookmark;
import kr.or.iei.mypage.model.vo.QNA;

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
	public String boardList(HttpSession session, Model model, HttpServletRequest req) {
		String memberId = ((Member)session.getAttribute("member")).getMemberId();
		int board = Integer.parseInt(req.getParameter("board"));
		ArrayList<BoardList> bList = service.selectBoardList(memberId,board);
		model.addAttribute("bList", bList);
		return "member_myPage/boardList";
	}
	
	@RequestMapping(value="/bookmark.do")
	public String bookmark(HttpSession session, Model model, HttpServletRequest req) {
		String memberId = ((Member)session.getAttribute("member")).getMemberId();
		int board = Integer.parseInt(req.getParameter("board"));
		ArrayList<Bookmark> mList = service.selectBookmarkList(memberId,board);
		model.addAttribute("mList", mList);
		return "member_myPage/bookmark";
	}
	
	@RequestMapping(value="/qna.do")
	public String qna() {
		return "member_myPage/qna";
	}
	
	@RequestMapping(value="/leaveQuestion.do")
	public String leaveQuestion(QNA qna) {
		int result = service.insertQuestion(qna);
		
		return "redirect:/myPage.do";
	}
	
	@RequestMapping(value="/qnaList.do")
	public String qnaList(HttpSession session, QNA qna, Model model) {
		String memberId = ((Member)session.getAttribute("member")).getMemberId();
		ArrayList<QNA> qlist = service.selectQnaList(memberId);
		System.out.println("con" + qlist.get(0).getQnaTitle());
		model.addAttribute("qlist",qlist);
		return "member_myPage/qnaList";
	}
}
