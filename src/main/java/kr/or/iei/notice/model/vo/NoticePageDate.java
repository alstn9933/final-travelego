package kr.or.iei.notice.model.vo;

import java.util.List;

import lombok.Data;

@Data
public class NoticePageDate {
		// TODO Auto-generated constructor stub
	private List<Notice>list;
	private String pageNavi;
	public NoticePageDate(List<Notice> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
}
