package kr.or.iei.notice.model.vo;

import java.util.List;

import lombok.Data;

@Data
public class NoticePageDate {
	private List<Notice>list;
	private String pageNavi;
}
