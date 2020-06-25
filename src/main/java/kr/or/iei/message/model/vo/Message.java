package kr.or.iei.message.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Message {
	private int messageNo;
	private String messageSender;
	private String messageReceiver;
	private String messageContent;
	private Date sendDate;
	private int messageCheck;
	private int deleteLevel;
	private String messageTitle;
}
