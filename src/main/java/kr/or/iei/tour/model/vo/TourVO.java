package kr.or.iei.tour.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import lombok.Data;

@Data
public class TourVO {
	private int rnum;
	private int itemNo;
	private String memberId;
	private String memberName;
	private String phone;
	private String email;
	private String itemTitle;
	private int regionNo;
	private String regionCountry;
	private String regionCity;
	private int maxPerson;
	private String beginDate;
	private String endDate;
	private String itemContent;
	private String filename;
	private int closeCheck;
	private int itemPrice;
	private String tourTimes;
	private int readCount;
	private double score;
}
