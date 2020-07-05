package kr.or.iei.mytrip.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Mytrip {
	private int tripNo;
	private int regionNo;
	private Date beginDate;
	private Date endDate;
}
