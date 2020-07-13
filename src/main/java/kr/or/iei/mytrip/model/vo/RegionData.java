package kr.or.iei.mytrip.model.vo;

import lombok.Data;

@Data
public class RegionData {
	private int regionNo;
	private String regionCountry;
	private String regionCity;
	private String filename;
	private String filepath;
	private int tripNo;
}
