package kr.or.iei.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.Company;
import kr.or.iei.member.model.vo.MailSend;
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
		return "member/loginFrm";
	}
	@RequestMapping("/loginMember.do")
	public String loginMember(Member m,HttpSession session) {
		Member member =  service.loginMember(m);

		if(member != null) {
			session.setAttribute("member",member);
			return "redirect:/";
		}else {
			return "member/loginFrm";
		}
	}
	@RequestMapping("/logout.do")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
		
	}
	@RequestMapping("/joinFrm.do")
	public String joinFrm() {
		return "member/joinFrm";
	}
	@RequestMapping("/memberjoinFrm.do")
	public String memberjoinFrm() {
		return "member/memberjoinFrm";
	}
	@RequestMapping("/companyjoinFrm.do")
	public String companyjoinFrm() {
		return "member/companyjoinFrm";
	}
	@RequestMapping("/memberTerms.do")
	public String memberTerms() {
		return "member/memberTerms";
	}
	@RequestMapping("/memberjoin.do")
	public String memberjoin(Member m) {
		int result = service.memberjoin(m);
		if(result>0) {
			return "member/loginFrm";
		}else {
			return "redirect:/";
		}
	}
	@RequestMapping("/companymemberjoin.do")
	public String companymemberjoin(Member m,Company cpy) {
		int result = service.companymemberjoin(m,cpy);
		if(result>0) {
			return "member/loginFrm";
		}else {
			return "redirect:/";
		}
	}
	//이메일인증
	
	@ResponseBody	
	@RequestMapping("/sendMail.do")
 public String sendsMail(HttpServletResponse response,HttpServletRequest request) throws IOException {
		String email = request.getParameter("email");
		String mailCode = new MailSend().mailSend(email);
		response.getWriter().print(mailCode);
		return mailCode;
		
		
	}
}