package kr.or.iei.tripboard.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class TripBoardPageDTO {
	private ArrayList<TripBoardVO> boardList;
	private String pageNavi;
}
