package kr.or.iei.recommend.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class RecommendPageData {
	private ArrayList<Recommend> rlist;
	private String pageNavi;
}
