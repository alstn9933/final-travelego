package kr.or.iei.common.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class CommentPageData {
	private ArrayList<BoardComment> clist;
	private String pageNavi;
}
