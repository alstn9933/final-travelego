package kr.or.iei.member.controller;

import org.apache.catalina.tribes.MembershipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

@Controller
public class MemberController {
	@Autowired
	@Qualifier("memberService")
	private MembershipService service;
	public  MemberController() {
	 super();
	}
	
	@RequestMapping("/login.do")
	public String loginMember() {
		return "Login";
	}
}
