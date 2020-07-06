package kr.or.iei.together.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class TogetherBoardVO {
	private int togetherNo;
	private String togetherTitle;
	private String togetherContent;
	private String togetherWriter;
	private int regionNo;
	private int readCount;
	private String togetherDate;
	private String writeTime;
	private int rnum;
	private String regionCity;
	private String regionCountry;
	private int commentCount;
}
