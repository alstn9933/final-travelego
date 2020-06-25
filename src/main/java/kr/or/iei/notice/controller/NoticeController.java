package kr.or.iei.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.iei.notice.model.service.NoticeService;
import kr.or.iei.notice.model.vo.NoticePageDate;

@Controller
public class NoticeController {
	@Autowired
	@Qualifier("noticeService")
	private NoticeService service;
	
	@RequestMapping("/noticeList.do")
	public String noticeList(Model model) {
		int reqPage = 1;
		NoticePageDate npd = service.noticeList(reqPage);
		model.addAttribute("list",npd.getList());
		model.addAttribute("pageNavi", npd.getPageNavi());
		return "notice/noticeList";
	}
}
