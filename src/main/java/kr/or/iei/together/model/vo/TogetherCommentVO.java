package kr.or.iei.together.model.vo;

import lombok.Data;

@Data
public class TogetherCommentVO {
	private int commentNo;
	private int commentLevel;
	private int boardClass;
	private int boardNo;
	private String commentWriter;
	private String commentContent;
	private int refComment;
	private String commentDate;
	private String commentTime;
	private String commentNick;
}
