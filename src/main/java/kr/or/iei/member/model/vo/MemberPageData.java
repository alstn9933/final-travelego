package kr.or.iei.member.model.vo;

import java.util.List;

public class MemberPageData {
	private List<Member> list;
	private String pageNavi;

	public MemberPageData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberPageData(List<Member> list, String pageNavi) {
		super();
		this.list=list;	
		this.pageNavi = pageNavi;
	}

	public List<Member> getList() {
		return list;
	}

	public void setList(List<Member> list) {
		this.list = list;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}

	
}
