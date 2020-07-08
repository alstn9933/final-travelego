package kr.or.iei.common.model.vo;

import kr.or.iei.mytrip.model.vo.Mytrip;
import kr.or.iei.mytrip.model.vo.TripMember;
import kr.or.iei.recommend.model.vo.Recommend;
import kr.or.iei.tour.model.vo.TourVO;
import lombok.Data;

@Data
public class mainPhotoNotice {
	private Recommend recommend;
	private TourVO tour;
	
}
