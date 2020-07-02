package kr.or.iei.tour.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class ReviewData {
	private ArrayList<ReviewVO> reviewList;
	private String pageNavi;
}
