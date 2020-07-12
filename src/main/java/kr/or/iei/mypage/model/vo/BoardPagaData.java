package kr.or.iei.mypage.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class BoardPagaData {
	private ArrayList<BoardList> blist;
	private String pageNavi;
}
