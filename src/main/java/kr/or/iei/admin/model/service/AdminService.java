package kr.or.iei.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.iei.admin.model.dao.AdminDao;
import kr.or.iei.common.model.vo.Region;
import kr.or.iei.member.model.vo.Company;
import kr.or.iei.member.model.vo.Member;

@Service("adminService")
public class AdminService {
	@Autowired
	@Qualifier("adminDao")
	private AdminDao dao;

	public AdminService() {
		super();
		System.out.println("adminService 생성 완료");
	}
	
	public ArrayList<Member> selectCustomerMember() {
		List<Member> mList = dao.selectCustomerMember();
		return (ArrayList<Member>)mList;
	}

	public ArrayList<Company> selectCompanyMember() {
		List<Company> cList = dao.selectCompanyMember();
		return (ArrayList<Company>)cList;
	}
	
	public int confirmUpdateMember(Company cm) {
		return dao.confirmUpdateMember(cm);
	}

	public int modifyMemberLevel(Member m) {
		System.out.println("서비스"+m.getMemberId());
		return dao.modifyMemberLevel(m);
	}

	public int memberRestore(Member m) {
		
		return dao.memberRestore(m);
	}

	public int memberDelete(Member m) {
		// TODO Auto-generated method stub
		return dao.memberDelete(m);
	}

	public int companyStop(Member m) {
		// TODO Auto-generated method stub
		return dao.companyStop(m);
	}



	public ArrayList<Region> regionList() {
		List rList = dao.selectRegionList();
		return (ArrayList<Region>)rList;
	}





	
	
	
}
