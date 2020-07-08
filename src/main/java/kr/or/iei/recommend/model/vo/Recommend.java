package kr.or.iei.recommend.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Recommend {
	private int recNo;
	private String recTitle;
	private String recContent;
	private String recWriter;
	private int readCount;
	private Date recDate;
	private int recCategory;
	private int regionNo;
	private String regionCity;
	private String coords;
	private String place;
	private int cnt;
	private String regionCountry;
	private String filename;
	private String filepath;
}
