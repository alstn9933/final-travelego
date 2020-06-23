package kr.or.iei.admin.controller;




import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


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
	
	
}
