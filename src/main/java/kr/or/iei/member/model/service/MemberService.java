package kr.or.iei.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.iei.member.model.dao.MemberDao;
import kr.or.iei.member.model.vo.Company;
import kr.or.iei.member.model.vo.CompanyMember;
import kr.or.iei.member.model.vo.Member;

@Service("memberService")
public class MemberService {
	@Autowired
	@Qualifier("memberDao")
	private MemberDao dao;

	public Member loginMember(Member m) {
		return dao.loginMember(m);
	}

	public int memberjoin(Member m) {
		return dao.memberjoin(m);
	}

	@Transactional
	public int companymemberjoin(Member m,Company cpy) {
		cpy.setCompanyId(m.getMemberId());
		int result = 0;
		result = dao.companymemberjoin(m);
		System.out.println(result);
		if (result > 0) {
			result = dao.companyjoin(cpy);
			System.out.println(result);
			if (result > 0) {
				result = 2;
				if (result == 2) {
					return result;
				}
			}
		}
		return 0;
	}

}
