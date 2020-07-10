package kr.or.iei.mypage.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class QNAPageData {
	private ArrayList<QNA> qlist;
	private String pageNavi;
}
