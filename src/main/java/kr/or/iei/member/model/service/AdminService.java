package kr.or.iei.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.iei.admin.model.dao.AdminDao;

@Service("adminService")
public class AdminService {
	@Autowired
	@Qualifier("adminDao")
	private AdminDao dao;
	
	public AdminService() {
		super();
		System.out.println("adminService 생성 완료");
	}
	
}
