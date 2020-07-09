package kr.or.iei.tripboard.model.vo;

import java.util.ArrayList;

import kr.or.iei.together.model.vo.TogetherCommentVO;
import lombok.Data;

@Data
public class TripBoardPageDTO {
	private ArrayList<TripBoardVO> boardList;
	private ArrayList<TogetherCommentVO> commentList;
	private String pageNavi;
	private TripBoardVO board;
}
