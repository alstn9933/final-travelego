package kr.or.iei.admin.controller;




import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;


import kr.or.iei.admin.model.service.AdminService;
import kr.or.iei.member.model.vo.Company;
import kr.or.iei.member.model.vo.Member;

@Controller
public class AdminController {
	
	@Autowired
	@Qualifier("adminService")
	private AdminService service;

	public AdminController() {
		super();
		System.out.println("AdminController생성완료");
	}

	@RequestMapping(value = "/adminPage.do")
	public String adminPage() {
		return "admin/adminPage";
	}
	@RequestMapping(value = "/memberManagement.do")
	public String management(Model model) {
		 ArrayList<Member> mList = service.selectCustomerMember();
		 ArrayList<Company> cList = service.selectCompanyMember();
		 
		model.addAttribute("mList",mList);
		model.addAttribute("cList",cList);
//		model.addAttribute("list",list);
		return "admin/memberManagement";
		
	}
	/*
	 * MEMBER_LEVEL 1:일반회원 2:법인회원 3:관리자
	 * COFIRM 0:승인전 1:승인후
	 */
	/*
	 * 법인 회원 승인 
	 */
	   @ResponseBody
	   @RequestMapping(value = "/confirmUpdateMember.do", produces = "agpplication/json; charset=utf-8")
	   
	   public String confirmUpdateMember(Company cm,HttpSession session) {
		   System.out.println(cm.getCompanyId());
		   int result = service.confirmUpdateMember(cm);
	     System.out.println(cm.getJoinConfirm());
	     if(result>0) {
	    	 session.setAttribute("joinConfirm",1);
	    	 System.out.println(cm.getJoinConfirm());	     }
	      return new Gson().toJson(1);}
	   
	   
	   @ResponseBody
	   @RequestMapping(value = "/modifyMemberLevel.do", produces = "text/html; charset=utf-8") // 굳이 json으로 보낼 필요가 없습니다.
	   public String modifyMemberLevel(Member m,HttpSession session) {
		  System.out.println(m.getMemberId());
		   int result= service.modifyMemberLevel(m);
		   System.out.println("result : "+result);
		   if(result>0) {
			   // session.setAttribute("memberLevel",-1); // session에 set 해주는 attribute의 키 값 잘못됨 - EL 문법의 사용법에 대해 먼저 숙지 필요
			   // System.out.println("컨트롤러 처리 후"+m.getMemberLevel());
			   // 아로 수정정			   System.out.println("컨트롤러 처리 후"+m.getMemberLevel());
//			   
			   // 이 위의 두 줄 코드를 봅시다
			   // session에 memberLevel이라는 키값으로 -1 이라는걸 설정했어요
			   // 그리고 System.print에서는 매개변수로 받은 Member의 getMemberLevel을 호출합니다
			   // 매개변수인 Member의 memberLevel은 변한적이 없으니 0을 리턴합니다
			   // 여기서 궁금한점이 있나요??el문법은 제가 봐야할듯합니다 그리고 return으로 뭘 줘야할지...고민을 많이 했습니다.
			   // 이번에는 제가 보여드릴게요
			   
			   return String.valueOf(result);
		   } else {
			   return String.valueOf(result);
		   }
		   
		   // return 부정확함 - 성공해도 -1 리턴 실패해도 -1 리턴 , ajax 수신측에서는 성공했는지 실패했는지 알길이 없음
		   // return new Gson().toJson(-1);
	   }
	
}
