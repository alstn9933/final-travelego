package kr.or.iei.reserve.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ReserveVO {
	private int reserveNo;
	private int itemNo;
	private String itemTitle;
	private String memberId;
	private String memberName;
	private String tourDate;
	private String tourTime;
	private int personCount;
	private String payDate;
	private int totalPay;
	private int status;
	private int checkReview;
}
