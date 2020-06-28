package kr.or.iei.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.member.model.vo.Company;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.region.model.vo.Region;

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
	     return sqlSession.selectList("selectCustomerMember");
	   }

	 public List<Company> selectCompanyMember(){
		 return sqlSession.selectList("selectCompanyMember");
	 }



	public int confirmUpdateMember(Company cm) {
		// TODO Auto-generated method stub
		return sqlSession.update("confirmUpdateMember",cm);
	}

	public int modifyMemberLevel(Member m) {
		return sqlSession.update("modifyMemberLevel",m);
	}

	public int memberRestore(Member m) {
		return sqlSession.update("memberRestore",m);
	}

	public int memberDelete(Member m) {
		return sqlSession.delete("memberDelete",m);
	}

	public int companyStop(Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("companyStop",m);
	}


	public List selectRegionList() {
		List rlist = sqlSession.selectList("admin.regionList");
		System.out.println(rlist.size());
		return rlist;
	}


	
}
