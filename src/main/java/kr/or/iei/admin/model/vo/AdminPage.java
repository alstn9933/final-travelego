package kr.or.iei.admin.model.vo;

import java.util.List;

import kr.or.iei.member.model.vo.Member;


public class AdminPage {
	private List<Member>list;
	private String pageNavi;

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
	public AdminPage(List<Member> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}

}
