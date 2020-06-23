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
	private String itemTitle;
	private int regionNo;
	private int maxPerson;
	private String beginDate;
	private String endDate;
	private String itemContent;
	private String filepath;
	private int closeCheck;
	private int itemPrice;
	private String tourTimes;
	private int readCount;
	private ArrayList<ReviewVO> reveiwList;
	private float score;
}
