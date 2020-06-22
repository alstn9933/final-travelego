package kr.or.iei.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired
	@Qualifier("memberService")
	private MemberService service;
	public  MemberController() {
	 super();
	}
	
	@RequestMapping("/loginFrm.do")
	public String loginFrm() {
		return "member/login";
	}
	@RequestMapping("/loginMember.do")
	public String loginMember(Member m,HttpSession session) {
		
		Member member =  service.loginMember(m);
		if(member != null) {
			session.setAttribute("member",member);
			return "redirect:/";
		}else {
			return "member/login";
		}
	}
}
