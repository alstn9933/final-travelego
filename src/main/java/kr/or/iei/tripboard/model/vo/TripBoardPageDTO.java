package kr.or.iei.tripBoard.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class TripBoardPageDTO {
	private ArrayList<TripBoardVO> boardList;
	private String pageNavi;
}
