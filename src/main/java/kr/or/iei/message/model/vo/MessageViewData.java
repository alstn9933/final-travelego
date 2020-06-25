package kr.or.iei.message.model.vo;

import lombok.Data;

@Data
public class MessageViewData {
	private Message message;
	private int msgTotalCount;
	private int unchkCount;
	private int sendCount;
}
