package kr.or.iei.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.admin.model.vo.AdminPage;
import kr.or.iei.admin.model.vo.SearchAdmin;
import kr.or.iei.common.model.vo.Photo;
import kr.or.iei.common.model.vo.Region;
import kr.or.iei.common.model.vo.Report;
import kr.or.iei.member.model.vo.Company;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.mypage.model.vo.QNA;

@Repository("adminDao")
public class AdminDao {
	@Autowired
	SqlSession sqlSession;


	 public List<Member> selectCustomerMember() {
		 return sqlSession.selectList("admin.selectCustomerMember");
	 }

	 public List<Company> selectCompanyMember(){
		 return sqlSession.selectList("admin.selectCompanyMember");
	 }



	public int confirmUpdateMember(Company cm) {
		// TODO Auto-generated method stub
		return sqlSession.update("admin.confirmUpdateMember",cm);
	}

	public int modifyMemberLevel(Member m) {
		return sqlSession.update("admin.modifyMemberLevel",m);
	}

	public int memberDelete(Member m) {
		return sqlSession.delete("admin.memberDelete",m);
	}


	public List selectRegionList() {
		List rlist = sqlSession.selectList("admin.regionList");
		System.out.println(rlist.size());
		return rlist;
	}


	public List selectQnaList() {
		return sqlSession.selectList("admin.selectQnA");
		
	}

	public QNA qnaView(QNA q) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.qnaView",q);
	}

	public int qnaAnswer(QNA q) {
		
		return sqlSession.update("admin.qnaAnswer",q);
	}

	
	

	public List middleList(Region rg) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("admin.middleList",rg);
	}

	public List<Report> reportList() {
		return sqlSession.selectList("admin.reportList");
	}

	public int deletePage(Report rt) {
		return sqlSession.delete("admin.deletePage",rt);
	}

	public int insertRegion(Region rg) {
		// TODO Auto-generated method stub
		return sqlSession.insert("admin.insertRegion",rg);
	}


	public int insertPhoto(Photo pt) {
		// TODO Auto-generated method stub
		return  sqlSession.insert("admin.insertPhoto",pt);
	}

	public int deleteReg(Region rg) {
		
		return sqlSession.delete("admin.deleteReg",rg);
	}

public int deletePhoto(Photo pt) {
		
		return sqlSession.delete("admin.deletePhoto",pt);
	}

public int deleteReport(Report rt) {
	return sqlSession.delete("admin.deleteReport",rt);
}

public int totalcount() {
	return sqlSession.selectOne("admin.totalCount");
}
public int updateAnswer(QNA q) {
	
	return sqlSession.update("admin.updateAnswer",q);
}


public List<Member> selecMemberList(AdminPage apg) {
	
	return sqlSession.selectList("admin.memberPage", apg);
}
public int mListCount(SearchAdmin searchM) {
		
	return sqlSession.selectOne("admin.mListCount",searchM);
}


}
