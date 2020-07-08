package kr.or.iei.mytrip.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class TripDetail {
	private int tripNo;
	private String tripDate;
	private int tripOrder;
	private String tripSpot;
	private String tripContent;
	private String coords;
	
}
