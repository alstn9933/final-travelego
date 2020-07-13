package kr.or.iei.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.iei.common.alarmHandler;
import kr.or.iei.common.model.vo.mainPhotoRecommed;
import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.Company;
import kr.or.iei.member.model.vo.MailSend;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.member.model.vo.SendPwMail;
import kr.or.iei.recommend.model.vo.Recommend;
import kr.or.iei.tour.model.vo.TourVO;

@Controller
public class MemberController {
	@Autowired
	@Qualifier("memberService")
	private MemberService service;
	
	@Autowired
	private alarmHandler handler;

	public MemberController() {
		super();
	}

	// test
	
	@RequestMapping("/loginFrm.do")
	public String loginFrm() {
		return "member/loginFrm";
	}

	@RequestMapping("/loginMember.do")
	public String loginMember(Member m, HttpSession session, Model model) {
		Member member = service.loginMember(m);
		if (member != null) {
			Company company = service.checkCompanyId(member);
			System.out.println(member.getMemberLevel());
			if(company != null && company.getJoinConfirm()==1) {
				System.out.println(company.getJoinConfirm());
				session.setAttribute("company", company);
				session.setAttribute("member", member);
				model.addAttribute("loc", "/");
			}else if(company != null && company.getJoinConfirm()==0) {
				model.addAttribute("msg","심사가 끝나지 않았습니다.");
				model.addAttribute("loc","/");
			}else{
				session.setAttribute("member", member);
				model.addAttribute("loc", "/");
			}
		}else {
			model.addAttribute("msg", "회원정보가 일치하지 않습니다.");
			model.addAttribute("loc", "loginFrm.do");
		}
		return "common/msg";
	}

	@RequestMapping("/logout.do")
	public String logoutMember(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		handler.removeMemberSession(member.getMemberId());
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
	public String memberjoin(Member m , Model model) {
		int result = service.joinMember(m);
		if (result > 0) {
			model.addAttribute("msg", "회원가입이 성공적으로 완료되었습니다.");
			model.addAttribute("loc","/loginFrm.do");
		} else {
			model.addAttribute("msg", "회원가입 오류. 관리자와 상의하세요.");
			model.addAttribute("loc","/");
		}
		return "common/msg";	// /WEB-INF/views/common/msg.jsp
	}

	@RequestMapping("/companymemberjoin.do")
	public String companymemberjoin(Member m, Company cpy,Model model) {
		int result = service.companyjoinMember(m, cpy);
		if (result > 0) {
			model.addAttribute("msg", "회원가입이 성공적으로 완료되었습니다.");
			model.addAttribute("loc","/loginFrm.do");
		} else {
			model.addAttribute("msg", "회원가입 오류. 관리자와 상의하세요.");
			model.addAttribute("loc","/");
		}
		return "common/msg";
	}
	// 이메일인증

	@ResponseBody
	@RequestMapping(value = "/sendMail.do", produces = "text/html;charset=utf-8")
	public String sendsMail(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String email = request.getParameter("email");
		String mailCode = new MailSend().mailSend(email);
//		response.getWriter().print(mailCode);
		return mailCode;

	}
	@ResponseBody
	@RequestMapping(value = "/chkId.do")
	public int chkId(Member m) {
		int result = service.chkid(m);
		return result;
	}
	@ResponseBody
	@RequestMapping("/chkNickname.do")
	public int chkNickname(Member m) {
		int result = service.chkNickname(m);
		return result;
		
	}
	@ResponseBody
	@RequestMapping("/chkEmail.do")
	public int chkEamil(Member m) {
		int result = service.chkEmail(m);
		return result;
	}
	@RequestMapping("/memberInformation.do")
	public String memberInformation() {
		return "member/memberInformation";
	}
	@RequestMapping("/idsearch.do")
	public String idSearchFrm(Member m,Model model) {
		Member members = service.selectId(m);
		if(members != null) {
			model.addAttribute("m",members);
			return "member/idSearch";			
		}else {
			return "member/idSearchError";
		}
	}
	@RequestMapping("/passwordchange.do")
	public String passwordchange(Member m,Model model,HttpServletRequest request) {
		long timeDate= System.currentTimeMillis()/1000;
		Member members = service.passwordchange(m);
		if(members != null) {
			new SendPwMail().SendPwMail(m.getMemberId(),m.getEmail(),timeDate);
			model.addAttribute("msg","이메일 발송이 완료 되었습니다.");
			model.addAttribute("loc","/loginFrm.do");
		}else {
			model.addAttribute("msg", "사용자 정보가 존재하지 않습니다.");
			model.addAttribute("loc", "/loginFrm.do");
		}
		return "common/msg";
	}
	@RequestMapping("/pwChange.do")
	public String pwSearch(String memberId,Model model,long timeDate) {
		model.addAttribute("timeDate", timeDate);
		model.addAttribute("memberId", memberId);
		return "member/pwChange";
	}
	@RequestMapping("/pwModify.do")
	public String pwModifyMember(Member m,Model model,long timeDate) {
		long endDate = System.currentTimeMillis()/1000;
		if(endDate-timeDate<300) {
		int result = service.pwModifyMember(m);
		if(result>0) {
			model.addAttribute("msg","비밀번호 변경이 완료되었습니다!");
			model.addAttribute("loc", "/loginFrm.do");
		}else {
			model.addAttribute("msg", "에러 : 관리자에게 문의하세요.");
			model.addAttribute("loc", "/memberInformation.do");
		}
		}else if(endDate-timeDate>300){
			System.out.println("3");
			model.addAttribute("msg","비밀번호변경 시간이 만료되었습니다. 다시 신청해주세요.");
			model.addAttribute("loc", "memberInformation.do");
		}
		return "common/msg";
	}	

	@RequestMapping("/memberModified.do")
	public String memberModified(Member m,Model model,HttpSession session) {
		int result = 0;
		if(m.getMemberPw()==null||m.getMemberPw()=="") {
			 result= service.memberModifiedMember(m);
		}else {
			result = service.memberPwModifiedMember(m);
		}
		if(result>0) {
			Member member = service.sessioncheck(m.getMemberId());
			model.addAttribute("msg", "회원정보 수정완료!");
			model.addAttribute("loc", "/");
			session.setAttribute("member", member);
		}else {
			model.addAttribute("msg", "에러 : 회원정보수정");
			model.addAttribute("loc", "/memberModifiedFrm.do");
		}
		return "common/msg";
	}
	@RequestMapping("/companyModified.do")
	public String companyModified(Member m,Company cp,Model model,HttpSession session) {
		int result =0;
		if(m.getMemberPw()==null||m.getMemberPw()=="") {
			result = service.companyModifiedMember(m,cp);			
		}else {
			result = service.companyPwModifiedMember(m,cp);
		}
		if(result>0) {
			Member member = service.sessioncheck(m.getMemberId());
			Company cpy = service.sessionCpMember(cp,m.getMemberId());
			session.setAttribute("member", member);
			session.setAttribute("company", cpy);
			model.addAttribute("msg", "회원정보 수정완료!");
			model.addAttribute("loc", "/");
		}else {
			model.addAttribute("msg", "에러 : 법인정보수정");
			model.addAttribute("loc", "/companyModifiedFrm.do");
		}
		return "common/msg";
	}
	@ResponseBody
	@RequestMapping(value = "/mainRecommendList.do",produces = "application/json;charset=utf-8")
	public String mainRocommendList() {
		List<Recommend>list = service.mainrecommendList();
		System.out.println(list);
		return new Gson().toJson(list);
	}
	@ResponseBody
	@RequestMapping(value = "/maintourList.do",produces = "application/json;charset=utf-8")
	public String mainTourList() {
		List<mainPhotoRecommed>list = service.mainTourList();
		return new Gson().toJson(list);
	}
	@RequestMapping("/membercheck.do")
	   public String membercheck(Member m, Company cp, Model model) {
		 Member selectM = service.selectOneMember(m);
		 if(selectM!=null) {//입력한 비밀번호 일치
			 if(selectM.getMemberLevel()==1){   //로그인한 회원의 레벨이 1이면
	    		  model.addAttribute("m", selectM) ;
	    		  return "member/memberModiFiedFrm";
	           }else if(selectM.getMemberLevel()==2){ //로그인한 회원의 레벨이2이면
	        	   Company cpy = service.sessionCpMember(cp,selectM.getMemberId()); //company정보 select해오기
	        	   model.addAttribute("m", selectM) ;
	        	   model.addAttribute("cp", cpy) ;
	        	   return "member/companyModifiedFrm";
	           }else {
	        	   return "redirect:/";
	           }
		 }else{ //입력한 비밀번호가 일치하지 않으면
		        model.addAttribute("msg","비밀번호가 맞지않습니다");
		        model.addAttribute("loc","/membercheckFrm.do");
		        return "common/msg";
		   }
	    }
	@RequestMapping("/membercheckFrm.do")
	public String membercheckFrm() {
		return "member/membercheck";
	}
	
	
	
}