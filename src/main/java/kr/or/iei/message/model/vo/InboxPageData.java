package kr.or.iei.message.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class InboxPageData {
	private ArrayList<Message> list;
	private int unchkCount;
	private int msgTotalCount;
}
