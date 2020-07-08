package kr.or.iei.common.model.vo;

import kr.or.iei.mytrip.model.vo.Mytrip;
import kr.or.iei.mytrip.model.vo.TripMember;
import kr.or.iei.recommend.model.vo.Recommend;
import kr.or.iei.together.model.vo.TogetherBoardVO;
import kr.or.iei.tour.model.vo.TourVO;
import kr.or.iei.tripBoard.model.vo.TripBoardVO;
import lombok.Data;

@Data
public class mainPhotoRecommed {
	private Recommend recommend;
	private TourVO tour;
	private String filename;
	private String filepath;
	
}
