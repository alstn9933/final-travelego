package kr.or.iei.notification.model.vo;

import lombok.Data;

@Data
public class Notification {
	private int notifyNo;
	private String memberId;
	private String notifyContent;
	private int notifyCheck;
}
