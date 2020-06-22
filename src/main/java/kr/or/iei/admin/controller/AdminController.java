package kr.or.iei.admin.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.or.iei.admin.model.service.AdminService;
import kr.or.iei.member.model.vo.MemberPageData;

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
		int reqPage=1;
		MemberPageData mpd = service.memberList(reqPage);
		model.addAttribute("list",mpd.getList());
		model.addAttribute("pageNavi",mpd.getPageNavi());
		//맵? 키
//		ArrayList<Member> list = service.selectAllMmember();
		
		return "admin/memberManagement";

	}
	/*
	 * MEMBER_LEVEL 1:일반회원 2:법인회원 3:관리자
	 * COFIRM 0:승인전 1:승인후
	 */
	
	
}
