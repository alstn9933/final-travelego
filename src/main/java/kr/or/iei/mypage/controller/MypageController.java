package kr.or.iei.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;

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
		int reqPage = Integer.parseInt(req.getParameter("reqPage"));
		HashMap<String, Object> map = service.selectBoardList(memberId,board,reqPage);
		ArrayList<BoardList> bList = (ArrayList<BoardList>)map.get("list");
		String pageNavi = (String)map.get("pageNavi");
		model.addAttribute("bList", bList);
		model.addAttribute("pageNavi",pageNavi);
		model.addAttribute("board",board);
		return "member_myPage/boardList";
	}
	
	@RequestMapping(value="/bookmark.do")
	public String bookmark(HttpSession session, Model model, HttpServletRequest req) {
		String memberId = ((Member)session.getAttribute("member")).getMemberId();
		int board = Integer.parseInt(req.getParameter("board"));
		int reqPage = Integer.parseInt(req.getParameter("reqPage"));
		HashMap<String, Object> map = service.selectBookmarkList(memberId,board,reqPage);
		ArrayList<Bookmark> mList = (ArrayList<Bookmark>)map.get("list");
		for(Bookmark b : mList) {
			if(b.getBoardClass() == 2) {
				b.setBoardTitle("<a href='/recDetail.do?reqPage=1&recNo="+b.getBoardNo()+"'>"+b.getBoardTitle()+"</a>");
			}else if(b.getBoardClass()==5) {
				/* b.setBoardTitle("<a href='/"); */
			}
		}
		String pageNavi = (String)map.get("pageNavi");
		model.addAttribute("mList", mList);
		model.addAttribute("pageNavi",pageNavi);
		model.addAttribute("board",board);
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
	public String qnaList(HttpSession session, QNA qna, Model model, HttpServletRequest req) {
		String qnaWriter = ((Member)session.getAttribute("member")).getMemberId();
		int reqPage = Integer.parseInt(req.getParameter("reqPage"));
		HashMap<String, Object> map = service.selectQnaList(qnaWriter, reqPage);
		ArrayList<QNA> qlist = (ArrayList<QNA>)map.get("list");
		String pageNavi = (String)map.get("pageNavi");
		System.out.println(qlist.size());
		model.addAttribute("qlist",qlist);
		model.addAttribute("pageNavi",pageNavi);
		return "member_myPage/qnaList";
	}
	
	@RequestMapping(value="/leaveAnswer.do")
	public String leaveAnswer(QNA qna, HttpSession session) {
		String qnaWriter = ((Member)session.getAttribute("member")).getMemberId();
		int result = service.leaveAnswer(qna);
		return "redirect:/qnaList.do?reqPage=1&qnaWriter="+qnaWriter;
	}
}
