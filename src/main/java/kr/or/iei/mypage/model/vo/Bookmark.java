package kr.or.iei.mypage.model.vo;

import lombok.Data;

@Data
public class Bookmark {
	private int rnum;
	private int bookmarkNo;
	private int boardClass;
	private int boardNo;
	private String boardTitle;
	private String boardWriter;
	private String memberId;
}
