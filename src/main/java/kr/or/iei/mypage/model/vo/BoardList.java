package kr.or.iei.mypage.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardList {
	private int boardNo;
	private String boardTitle;
	private Date date;
	private int readCount;
	
}
