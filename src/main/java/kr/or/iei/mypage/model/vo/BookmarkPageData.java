package kr.or.iei.mypage.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class BookmarkPageData {
	private ArrayList<Bookmark> mlist;
	private String pageNavi;
}
