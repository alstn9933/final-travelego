package kr.or.iei.together.model.vo;

import java.util.ArrayList;

import kr.or.iei.common.model.vo.Region;
import lombok.Data;

@Data
public class MainPageDTO {
	ArrayList<TogetherBoardVO> boardList;
	ArrayList<Region> regionList;
}
