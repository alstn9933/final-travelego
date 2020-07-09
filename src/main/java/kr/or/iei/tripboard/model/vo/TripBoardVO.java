package kr.or.iei.tripboard.model.vo;

import lombok.Data;

@Data
public class TripBoardVO {
	private int tripBoardNo;
	private String tripBoardTitle;
	private String tripBoardContent;
	private String tripRoute;
	private String tripBoardWriter;
	private String tripBoardDate;
	private String tripBoardTime;
	private int readCount;
	private int regionNo;
	private String tripDays;
	private String filepath;
}
