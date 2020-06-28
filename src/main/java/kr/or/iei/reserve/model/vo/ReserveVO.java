package kr.or.iei.reserve.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ReserveVO {
	private int reserveNo;
	private int itemNo;
	private String memberId;
	private Date tourDate;
	private String tourTime;
	private int personCount;
	private Date payDate;
	private int totalPay;
	private int status;
}
