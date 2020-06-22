package kr.or.iei.message.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.message.model.service.MessageService;
import kr.or.iei.message.model.vo.Message;
import kr.or.iei.message.model.vo.MessageViewData;
import kr.or.iei.message.model.vo.InboxPageData;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Autowired
	@Qualifier("messageService")
	private MessageService service;
	
	@RequestMapping("/view.do")
	public String messageView(HttpSession session,String messageNo, Model model) {
		
		Member m = (Member)session.getAttribute("member");
		
		if(m != null) {
			MessageViewData mvd = service.selectOneMessage(m.getMemberId(), Integer.parseInt(messageNo));
			model.addAttribute("message", mvd.getMessage());
			model.addAttribute("unchkCount",mvd.getUnchkCount());
			model.addAttribute("msgTotalCount", mvd.getMsgTotalCount());
		}
		
		return "message/messageView";
	}
	
	@RequestMapping("/write.do")
	public String messageWriteFrm() {
		return "message/write";
	}
	
	@RequestMapping("/inbox.do")
	public String selectMemberMessage(HttpSession session, Model m) {
		
		Member member = (Member)session.getAttribute("member");
		
		if(member != null) {
			InboxPageData pd = service.selectMsgList(member);		
			
			m.addAttribute("unchkCount", pd.getUnchkCount());
			m.addAttribute("msgTotalCount", pd.getMsgTotalCount());
			m.addAttribute("list", pd.getList());
		}
		
		return "message/inbox";
	}
	
	@RequestMapping("/send.do")
	public String messageSend(Message m, Model model) {		
		
		int result = service.insertMessage(m);
		
		if(result>0) {
			model.addAttribute("msg", "메세지를 전송하였습니다.");
		} else {
			model.addAttribute("msg", "메세지를 전송에 실패하였습니다.");
		}
		
		model.addAttribute("loc","/message/inbox.do");
		return "common/msg";
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkId.do", produces = "text/html;charset=utf-8")
	public String checkId(String receiver) {
		System.out.println(receiver);
		if(receiver.equals("test01") || receiver.equals("test02")) {
			return "1";
		} else {
			return "0";
		}
	}
		
}
