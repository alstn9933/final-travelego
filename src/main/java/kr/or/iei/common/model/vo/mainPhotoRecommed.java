package kr.or.iei.common.model.vo;

import kr.or.iei.recommend.model.vo.Recommend;
import kr.or.iei.tour.model.vo.TourVO;a
import lombok.Data;

@Data
public class mainPhotoRecommed {
	private Recommend recommend;
	private TourVO tour;
	private String filename;
	private String filepath;
	
}
