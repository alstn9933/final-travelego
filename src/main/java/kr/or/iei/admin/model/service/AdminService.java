package kr.or.iei.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.iei.admin.model.dao.AdminDao;
import kr.or.iei.member.model.vo.MemberVO;

@Service("adminService")
public class AdminService {
	@Autowired
	@Qualifier("adminDao")
	private AdminDao dao;
	
	public AdminService() {
		super();
		System.out.println("adminService 생성 완료");
	}



	public ArrayList<MemberVO> selectAllMmember() {
	     List<MemberVO> list = dao.selectAllMember();
	     return (ArrayList<MemberVO>)list;
	   }
}
