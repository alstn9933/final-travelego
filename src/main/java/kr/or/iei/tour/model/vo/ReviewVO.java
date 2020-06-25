package kr.or.iei.tour.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private int reviewNo;
	private int itemNo;
	private String memberId;
	private String memberNickname;
	private int reviewRate;
	private String reviewContent;
	private Date reviewDate;
}
