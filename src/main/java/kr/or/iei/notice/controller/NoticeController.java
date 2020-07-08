package kr.or.iei.notice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.iei.notice.model.service.NoticeService;
import kr.or.iei.notice.model.vo.Notice;
import kr.or.iei.notice.model.vo.NoticePageDate;

@Controller
public class NoticeController {
	@Autowired
	@Qualifier("noticeService")
	private NoticeService service;
	
	@RequestMapping("/noticeList.do")
	public String noticeList(Model model,HttpServletRequest request,String reqPage) {
		NoticePageDate npd = service.noticeList(Integer.parseInt(reqPage));
		model.addAttribute("list",npd.getList());
		model.addAttribute("pageNavi", npd.getPageNavi());
		return "notice/noticeList";
	}
	@RequestMapping("/noticeInsertFrm.do")
	public String noticeInsertFrm(){
		return "notice/noticeInsertFrm";
	}
	@RequestMapping("/noticeView.do")
	public String noticeView(Model model,Notice n) {
		Notice notice = service.noticeView(n);
		model.addAttribute("notice",notice);
		return "notice/noticeView";
	}
	@RequestMapping("/noticeInsert.do")
	public String noticeInsert(Notice n ,Model model) {
		int result = service.noticeInsert(n);
		if(result>0) {
			model.addAttribute("msg","공지사항 작성완료!");
			model.addAttribute("loc","/noticeList.do?reqPage=1");
		}else {
		model.addAttribute("msg","에러 : 공지사항 작성실패 ");
			model.addAttribute("loc","/noticeInsertFrm.do");
		}
		return "common/msg";
	}
	@RequestMapping("/noticemodify.do")
	public String noticeModifyFrm(Notice n,Model model) {
		Notice notice = service.selectOne(n);
		model.addAttribute("m",notice);
		return "notice/noticeModifyFrm";
	}
	@RequestMapping("/noticeModify.do")
	public String noticeModify(Notice n,Model model) {
		int result = service.noticeModify(n);
		if(result>0){
			model.addAttribute("msg","수정 완료 !");
			model.addAttribute("loc", "/noticeList.do?reqPage=1");
		}else {
			model.addAttribute("msg", "에러 : 수정실패");
			model.addAttribute("loc", "/noticeModifyFrm.do?noticeNo="+n.getNoticeNo());
		}
		return "common/msg";
	}
	@RequestMapping("/noticeDelete.do")
	public String noticeDelete(String noticeNo[],Model model) {
		for(String str : noticeNo) {
			int result = service.noticedelete(str);
			if(result>0) {
				model.addAttribute("msg", "게시물 삭제가 완료되었습니다.");
			}else {
				model.addAttribute("msg", "에러 : 게시물 삭제 실패");
			}
		}
		
		model.addAttribute("loc", "/noticeList.do?reqPage=1");
		return "common/msg";
	}

}
