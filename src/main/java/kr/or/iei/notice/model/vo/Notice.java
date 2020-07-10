package kr.or.iei.notice.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private int readCount;
	private String strNoticeDate;
}
