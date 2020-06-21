package kr.or.iei.message.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.message.model.service.MessageService;
import kr.or.iei.message.model.vo.Message;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Autowired
	@Qualifier("messageService")
	private MessageService service;
	
	@RequestMapping("/write.do")
	public String messageWriteFrm() {
		return "message/write";
	}
	
	@RequestMapping("/inbox.do")
	public String selectMemberMessage(HttpSession session, Model m) {
		
		Member member = (Member)session.getAttribute("member");
		
		if(member != null) {
			List list = service.selectMsgList(member);
			System.out.println(list.size());
			m.addAttribute("list", (ArrayList<Message>)list);
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
	
	
		
}
