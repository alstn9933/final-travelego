package kr.or.iei.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.iei.member.model.service.AdminService;

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

}
