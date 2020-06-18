package kr.or.iei.tour.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class TourVO {
	private int itemNo;
	private String memberId;
	private String itemTitle;
	private int regionNo;
	private int maxPerson;
	private Date beginDate;
	private Date endDate;
	private String itemContent;
	private int closeCheck;
	private int itemPrice;
	private String tourTimes;
}
