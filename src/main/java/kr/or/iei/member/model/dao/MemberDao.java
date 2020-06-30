package kr.or.iei.member.model.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.member.model.vo.Company;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.notice.model.vo.Notice;

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

	public int companyjoinMember(Member m) {
		return sqlsession.insert("member.companymemberjoin",m);
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

	public Member seleceId(Member m) {
		return sqlsession.selectOne("member.idSearch",m);
	}

	public Member passwordchange(Member m) {
		return sqlsession.selectOne("member.passwordchange",m);
	}

	public int pWModifyMember(Member m) {
		return sqlsession.update("member.pwModifyMember",m);
	}

	public int memberModifiedMember(Member m) {
		System.out.println("3");
		return sqlsession.update("member.memberModified",m);
	}

	public Company checkCompanyId(Member member) {
		return sqlsession.selectOne("company.checkCompanyId",member);
	}

	public int companyModifiedMember(Company cp) {
		return sqlsession.update("company.companyModified",cp);
	}

}
