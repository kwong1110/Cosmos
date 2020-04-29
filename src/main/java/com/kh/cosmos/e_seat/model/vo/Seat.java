package com.kh.cosmos.e_seat.model.vo;

import java.sql.Date;

public class Seat {
	private int reserNo;
	private int reserPeople;
	private Date reserDay;
	private int startTime;
	private int endTime;
	private String reserYn;
	private int seatNo;
	private String id;
	private int branchNo;
	private String reserSort;
	private Date finishDay;
	private String reserType;
	private int totalFee;
	 
	
	public Seat() {}


	public Seat(int reserNo, int reserPeople, Date reserDay, int startTime, int endTime, String reserYn, int seatNo,
			String id, int branchNo, String reserSort, Date finishDay, String reserType, int totalFee) {
		super();
		this.reserNo = reserNo;
		this.reserPeople = reserPeople;
		this.reserDay = reserDay;
		this.startTime = startTime;
		this.endTime = endTime;
		this.reserYn = reserYn;
		this.seatNo = seatNo;
		this.id = id;
		this.branchNo = branchNo;
		this.reserSort = reserSort;
		this.finishDay = finishDay;
		this.reserType = reserType;
		this.totalFee = totalFee;
	}


	public int getReserNo() {
		return reserNo;
	}


	public void setReserNo(int reserNo) {
		this.reserNo = reserNo;
	}


	public int getReserPeople() {
		return reserPeople;
	}


	public void setReserPeople(int reserPeople) {
		this.reserPeople = reserPeople;
	}


	public Date getReserDay() {
		return reserDay;
	}


	public void setReserDay(Date reserDay) {
		this.reserDay = reserDay;
	}


	public int getStartTime() {
		return startTime;
	}


	public void setStartTime(int startTime) {
		this.startTime = startTime;
	}


	public int getEndTime() {
		return endTime;
	}


	public void setEndTime(int endTime) {
		this.endTime = endTime;
	}


	public String getReserYn() {
		return reserYn;
	}


	public void setReserYn(String reserYn) {
		this.reserYn = reserYn;
	}


	public int getSeatNo() {
		return seatNo;
	}


	public void setSeatNo(int seatNo) {
		this.seatNo = seatNo;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public int getBranchNo() {
		return branchNo;
	}


	public void setBranchNo(int branchNo) {
		this.branchNo = branchNo;
	}


	public String getReserSort() {
		return reserSort;
	}


	public void setReserSort(String reserSort) {
		this.reserSort = reserSort;
	}


	public Date getFinishDay() {
		return finishDay;
	}


	public void setFinishDay(Date finishDay) {
		this.finishDay = finishDay;
	}


	public String getReserType() {
		return reserType;
	}


	public void setReserType(String reserType) {
		this.reserType = reserType;
	}


	public int getTotalFee() {
		return totalFee;
	}


	public void setTotalFee(int totalFee) {
		this.totalFee = totalFee;
	}


	@Override
	public String toString() {
		return "Seat [reserNo=" + reserNo + ", reserPeople=" + reserPeople + ", reserDay=" + reserDay + ", startTime="
				+ startTime + ", endTime=" + endTime + ", reserYn=" + reserYn + ", seatNo=" + seatNo + ", id=" + id
				+ ", branchNo=" + branchNo + ", reserSort=" + reserSort + ", finishDay=" + finishDay + ", reserType="
				+ reserType + ", totalFee=" + totalFee + "]";
	}
}
