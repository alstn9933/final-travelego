package kr.or.iei.tripBoard.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class TripBoardVO {
	private int tripBoardNo;
	private String tripBoardTitle;
	private long tripBoardContent;
	private String tripRoute;
	private String tripBoardWriter;
	private Date tripBoardDate;
	private int readCount;
	private int regionNo;
	
	
}
