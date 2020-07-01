package kr.or.iei.together.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.together.model.vo.TogetherBoardVO;

@Controller
@RequestMapping("/together")
public class TogetherController {
	
	@Autowired
	MemberService service;
	
	@RequestMapping("/write.do")
	public String boardWrite(HttpSession session, TogetherBoardVO board) {
		
		
		
		return "common/msg";
	}
	
	@RequestMapping("/open.do")
	public String test(HttpServletRequest request) {
		
		return "together/main";
	}
	
	@RequestMapping("/join.do")
	public String join(String userId) {
		
		Member member = new Member();
		member.setMemberId(userId);
		member.setMemberPw("1234");
		member.setMemberName(userId);
		member.setMemberNickname(userId);
		member.setPhone("0102345678");
		member.setEmail(userId);
		member.setMemberLevel(1);
		member.setGender("M");
		int result = service.joinMember(member);
		
		if(result >0) {
			
			return "together/main";
		}else {
			return null;
		}
	}
}
