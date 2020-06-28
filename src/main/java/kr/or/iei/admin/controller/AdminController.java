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
import kr.or.iei.region.model.vo.Region;

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
	
	@RequestMapping(value="/spot_managenet.do")
	public String spot_managenet(Model model) {
		ArrayList<Region> rList = service.regionList();
		model.addAttribute("rList",rList);
		return "admin/spot_managenet";
	}
//	그러고보니 지엽씨 이거 마스터에서 풀안햇어여? update from master 데스크 탑이요? 아직안했어요 미완성이라..
//			지엽씨 미완성된건 안올리는게 당연한거고 다른사람이 올린건 최신걸로 받아와야죠
//			저희 거의 일주일전에 region객체 common패키지에다가 만들어서 넣어놨다고 했는데 지엽씨만 따로 저렇게 만들어서 쓰면 mabatis-mapper에서도 충돌나고 여러군데 오류날거에여
	//이 부분은 내일 강사님꼐 여쭙고 업뎃하는거 봐주실수 있나요~?네네 이게 작업하기전에 항상 무조건 update from mater를 해줘야되요 그래야 다른사람이 만든거 최신으로 받아와서 자신꺼에도 오류가 안나나 봐줄 수도 있고
	//그사람은 오류안나서 올린건데 혹시나 내가 해보니 오류가 난다? 그럼 알려주기도 해야되요 그런것 땜에 항상 최신걸로 입데이트 해놓는거에여 네네 지우지마세여 ㅎㅎㅎ
	//지금 업데이트 받으면 좀 충돌 많을거같은데...그리고 클래스아예 바꿔서 코드 수정해야되요 네네 사실 어드민만 해놔서 겹치는게 딱히 없는지라...아까 언급하신 부분 말고는 없을 드 ㅅ합니다.
	//또 모르는거라 항상 모르는거니까 그래서 항상 최신화!

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
	      return new Gson().toJson(1);
	      }
	   
	   
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
			   // 여기서 궁금한점이 있나요??
			   // 이번에는 제가 보여드릴게요
			   
			   session.setAttribute("memberLevel",-1);
			   return String.valueOf(result);
		   } else {
			   return String.valueOf(result);
		   }
		   
		   // return 부정확함 - 성공해도 -1 리턴 실패해도 -1 리턴 , ajax 수신측에서는 성공했는지 실패했는지 알길이 없음
		   // return new Gson().toJson(-1);
	   }
	   @ResponseBody
	   @RequestMapping(value = "/memberRestore.do", produces = "text/html; charset=utf-8")
	   public String memberRestore(Member m ,HttpSession session) {
		  
		   
		   
		   int result = service.memberRestore(m);
		   
		   
		   
		   if(result>0) {
			   session.setAttribute("memberLevel",1);
			   return String.valueOf(result);
		   }else {
			   return String.valueOf(result);
		   }
		   
	   }
	   
	   @ResponseBody
	   @RequestMapping(value = "/memberDelete.do", produces = "text/html; charset=utf-8")
	   public String memberDelete(Member m ,HttpSession session) {
		   int result = service.memberDelete(m);
		   if(result>0) {
			  
			   return String.valueOf(result);
		   }else {
			   return String.valueOf(result);
		   }
		   
	   }
	   
	   @ResponseBody
	   @RequestMapping(value = "/companyStop.do", produces = "text/html; charset=utf-8")
	   public String comapanyStop(Member m ,HttpSession session) {
		   int result = service.companyStop(m);
		   if(result>0) {
			   session.setAttribute("memberLevel",-2);
			   return String.valueOf(result);
		   }else {
			   return String.valueOf(result);
		   }
		   
	   }
	   
	   
	  
	   
	   
	   
	
}
