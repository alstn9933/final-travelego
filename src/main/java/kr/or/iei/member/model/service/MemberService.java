package kr.or.iei.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.iei.common.model.vo.Photo;
import kr.or.iei.common.model.vo.mainPhotoRecommed;
import kr.or.iei.member.model.dao.MemberDao;
import kr.or.iei.member.model.vo.Company;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.recommend.model.vo.Recommend;
import kr.or.iei.tour.model.vo.TourVO;

@Service("memberService")
public class MemberService {
	@Autowired
	@Qualifier("memberDao")
	private MemberDao dao;

	public Member loginMember(Member m) {
		return dao.loginMember(m);
	}
	@Transactional
	public int joinMember(Member m) {
		return dao.memberjoin(m);
	}

	@Transactional
	public int companyjoinMember(Member m,Company cpy) {
		int result = 0;
		result = dao.companyjoinMember(m);
		cpy.setCompanyId(m.getMemberId());
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

	public int chkid(Member m) {
		int result = dao.chkId(m);
		return result;
	}

	public int chkNickname(Member m) {
		int result = dao.chkNickname(m);
		return result;
	}

	public int chkEmail(Member m) {
		int result = dao.chkEmail(m);
		return result;
	}
	public Member selectId(Member m) {
		return dao.seleceId(m);
	}
	public Member passwordchange(Member m) {
		return dao.passwordchange(m);
	}
	public int pwModifyMember(Member m) {
		return dao.pWModifyMember(m);
	}
	public int memberModifiedMember(Member m) {
		return dao.memberModifiedMember(m);
	}
	public Company checkCompanyId(Member member) {
		return dao.checkCompanyId(member);
	}
	@Transactional
	public int companyModifiedMember( Member m,Company cp) {
		int result = dao.memberModifiedMember(m);
		cp.setCompanyId(m.getMemberId());
		if(result>0) {
			result = dao.companyModifiedMember(cp);
			if(result>0) {
				return result;
			}
		}
		return 0;
	}
	public List<Recommend> mainrecommendList() {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int start = 0;
		int end = 4;
		map.put("start", start);
		map.put("end", end);
		return dao.mainrecommendList(map);
	}
	public List<mainPhotoRecommed> mainTourList() {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int start = 0;
		int end = 4;
		map.put("start", start);
		map.put("end", end);
		return (List<mainPhotoRecommed>) dao.maintourList(map);
		
	}
	public Member sessioncheck(String memberId) {
		return dao.sessioncheck(memberId);
	}
	public Member modifycheckMember(Member m) {
		return dao.modifyMembercheck(m);
	}
	public Company sessionCpMember(Company cp, String memberId) {
		cp.setCompanyId(memberId);
		return dao.sessionCp(cp);
	}

	public Member selectOneMember(Member m) {
		return dao.selectOneMember(m);
	}
	public int memberPwModifiedMember(Member m) {
		return dao.memberPwModifiedMember(m);
	}
	public int companyPwModifiedMember(Member m, Company cp) {
		int result = dao.memberPwModifiedMember(m);
		cp.setCompanyId(m.getMemberId());
		if(result>0) {
			result = dao.companyModifiedMember(cp);
			if(result>0) {
				return result;
			}
		}
		return 0;
	}


}
