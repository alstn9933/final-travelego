package kr.or.iei.message.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RequestMapping("/message")
public class MessageController {
	
	
	// 
	@RequestMapping("/test.do")
	public String accessInbox() {
		
		return "message/test";
	}
	
	@RequestMapping("/open.do")
	public String openInbox() {
		return "message/inbox";
	}
	
	@RequestMapping("/write.do")
	public String writeMsg() {
		return "message/messageWrite";
	}
	
	@RequestMapping("/outbox.do")
	public String outbox() {
		return "message/outbox";
	}
	
}
