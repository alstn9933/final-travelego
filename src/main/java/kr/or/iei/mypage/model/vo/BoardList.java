package kr.or.iei.mypage.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardList {
	private int rnum;
	private int boardClass;
	private String boardTitle;
	private Date boardDate;
	private int readCount;
	
}
