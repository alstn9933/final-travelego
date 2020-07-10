package kr.or.iei.common.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardComment {
	private int rnum;
	private int commentNo;
	private int commentLevel;
	private int boardClass;
	private int boardNo;
	private String commentWriter;
	private String commentContent;
	private int refComment;
	private Date commentDate;
}
