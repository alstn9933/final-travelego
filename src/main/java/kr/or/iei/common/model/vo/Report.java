package kr.or.iei.common.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Report {
	/*
	 * 신고 리스트 이고
	 * 어떤 게시물이 신고 된건지 찾아가야 하는데 이걸 어케 찾아가지?
	 */
 private int reportNo;
 private String reportCategory;
 private String reportContent;
 private Date reportDate;
 private int boardClass;
 private int boardNo;
 private String reportedMember;//신고당한사람
 private String reportWriter;//신고자
	
}
