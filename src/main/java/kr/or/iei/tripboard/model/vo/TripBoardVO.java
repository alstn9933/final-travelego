package kr.or.iei.tripBoard.model.vo;

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
	private String regionName;
	private int commentCount;
	private String likedId;
	private String bookmarkNo;
	private int likeCount;
}
