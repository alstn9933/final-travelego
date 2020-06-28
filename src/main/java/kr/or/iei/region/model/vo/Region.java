package kr.or.iei.region.model.vo;

import lombok.Data;

@Data
public class Region {
	private int regionNo;
	private String regionCountry;
	private String regionCity;
	//지역사진
	private String filename;
}
