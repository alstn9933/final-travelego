package kr.or.iei.message.controller;

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
	
	public String selectMemberMessage(HttpSession session, Model m) {
		
		Member member = (Member)session.getAttribute("member");
		
		if(member != null) {
			List list = service.selectMsgList(member);			
		}
		
		return null;
	}
		
}
