package kr.or.iei.mytrip.model.vo;

import java.util.Date;

public class Mytrip {
	private int tripNo;
	private int regionNo;
	private Date beginDate;
	private Date endDate;
	public Mytrip() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Mytrip(int tripNo, int regionNo, Date beginDate, Date endDate) {
		super();
		this.tripNo = tripNo;
		this.regionNo = regionNo;
		this.beginDate = beginDate;
		this.endDate = endDate;
	}
	public int getTripNo() {
		return tripNo;
	}
	public void setTripNo(int tripNo) {
		this.tripNo = tripNo;
	}
	public int getRegionNo() {
		return regionNo;
	}
	public void setRegionNo(int regionNo) {
		this.regionNo = regionNo;
	}
	public Date getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
}
