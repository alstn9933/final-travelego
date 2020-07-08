package kr.or.iei.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.iei.admin.model.dao.AdminDao;
import kr.or.iei.admin.model.vo.AdminPage;
import kr.or.iei.admin.model.vo.SearchAdmin;
import kr.or.iei.common.model.vo.Photo;
import kr.or.iei.common.model.vo.Region;
import kr.or.iei.common.model.vo.Report;
import kr.or.iei.member.model.vo.Company;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.mypage.model.vo.QNA;

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


	public int memberDelete(Member m) {
		// TODO Auto-generated method stub
		return dao.memberDelete(m);
	}


	public ArrayList<Region> regionList() {
		List rList = dao.selectRegionList();
		return (ArrayList<Region>)rList;
	}

	public ArrayList<QNA> qnaList() {
		List qnaList = dao.selectQnaList();
		return (ArrayList<QNA>)qnaList;
	}

	public QNA qnaView(QNA q) {
		System.out.println("문의글 잘 출력 되는가?");
		return dao.qnaView(q);
	}

	public int qnaAnswer(QNA q) {
		
		return dao.qnaAnswer(q);
	}

	public List middleList(Region rg) {
		return dao.middleList(rg);
	}

	public ArrayList<Report> reList() {
			List<Report> reList=dao.reportList();
		return (ArrayList<Report>)reList;
	}

	public int deletePage(Report rt) {
		
		return dao.deletePage(rt);
	}

	public int insertRegion(Region rg) {
		// TODO Auto-generated method stub
		return dao.insertRegion(rg);
	}

	public int insertPhoto(Photo pt) {
		return dao.insertPhoto(pt);
	}

	public int deleteReg(Region rg) {
		
		return dao.deleteReg(rg);
	}
	public int deletePhoto(Photo pt) {
		
		return dao.deletePhoto(pt);
	}

	public int deleteReport(Report rt) {
		return dao.deleteReport(rt);
	}

	

	public int updateAnswer(QNA q) {
		
		return dao.updateAnswer(q);
	}

	public ArrayList selecMemberList(SearchAdmin searchM) {
		return (ArrayList<Member>)dao.selecMemberList(searchM);
	}
	public int mListCount(SearchAdmin searchM){
		return dao.mListCount(searchM);
	}

	
	


	
}
