package kr.or.iei.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.common.model.vo.Region;
import kr.or.iei.member.model.vo.Company;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.mypage.model.vo.QNA;

@Repository("adminDao")
public class AdminDao {
	@Autowired
	SqlSession sqlSession;

	 public List<Member> selectCustomerMember() {
		 //sqlSession.selectList 
		 /**
		  * 큰 따움표 안에 들어가는게 쿼리문 이름
		  * m이 mapper 가 m이란 객체를 쓸 수 있을 있도록 하는 것
		  */
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

	public int memberRestore(Member m) {
		return sqlSession.update("admin.memberRestore",m);
	}

	public int memberDelete(Member m) {
		return sqlSession.delete("admin.memberDelete",m);
	}

	public int companyStop(Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("admin.companyStop",m);
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
	
}
