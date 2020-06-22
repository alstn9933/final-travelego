package kr.or.iei.admin.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.member.model.vo.Member;

@Repository("adminDao")
public class AdminDao {
	@Autowired
	SqlSession sqlSession;

	 public List<Member> selectAllMember() {
		 //sqlSession.selectList 
		 /**
		  * 큰 따움표 안에 들어가는게 쿼리문 이름
		  * m이 mapper 가 m이란 객체를 쓸 수 있을 있도록 하는 것
		  */
	     return sqlSession.selectList("selectAllMember");
	   }
		public int totalcount() {
			return sqlSession.selectOne("member.totalCount");
		}

	public List<Member> MmmberList(HashMap<String, Integer> map) {
		return sqlSession.selectList("member.noticeList",map);
		
	}
	
	
}
