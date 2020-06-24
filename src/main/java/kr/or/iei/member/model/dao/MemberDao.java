package kr.or.iei.member.model.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.member.model.vo.Company;
import kr.or.iei.member.model.vo.Member;

@Repository("memberDao")
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlsession;

	public Member loginMember(Member m) {
		return sqlsession.selectOne("member.loginMember",m);
	}

	public int memberjoin(Member m) {
		return sqlsession.insert("member.memberjoin",m);
	}

	public int companyjoin(Company company) {
		return sqlsession.insert("company.companyjoin",company);
	}

	public int companymemberjoin(Member member) {
		return sqlsession.insert("member.companymemberjoin",member);
	}

	public int chkId(Member m) {
		return sqlsession.selectOne("member.memberchkId",m);
	}

	public int chkNickname(Member m) {
		return sqlsession.selectOne("member.memberchkNickname",m);
	}

	public int chkEmail(Member m) {
		return sqlsession.selectOne("member.memberchkEmail",m);
		
	}
}
