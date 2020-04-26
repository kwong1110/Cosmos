package com.kh.cosmos.e_seat.model.vo;

public class Seat {
	private int reserNo;
	private int reserPeople;
	private int reserDay;
	private String startTime;
	private String endTime;
	private String reserYn;
	private int seatNo;
	private String reserFee;
	private String id;
	private int branchNo;
	
	public Seat() {}

	public Seat(int reserNo, int reserPeople, int reserDay, String startTime, String endTime, String reserYn,
			int seatNo, String reserFee, String id, int branchNo) {
		this.reserNo = reserNo;
		this.reserPeople = reserPeople;
		this.reserDay = reserDay;
		this.startTime = startTime;
		this.endTime = endTime;
		this.reserYn = reserYn;
		this.seatNo = seatNo;
		this.reserFee = reserFee;
		this.id = id;
		this.branchNo = branchNo;
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

	public int getReserDay() {
		return reserDay;
	}

	public void setReserDay(int reserDay) {
		this.reserDay = reserDay;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
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

	public String getReserFee() {
		return reserFee;
	}

	public void setReserFee(String reserFee) {
		this.reserFee = reserFee;
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

	@Override
	public String toString() {
		return "Seat [reserNo=" + reserNo + ", reserPeople=" + reserPeople + ", reserDay=" + reserDay + ", startTime="
				+ startTime + ", endTime=" + endTime + ", reserYn=" + reserYn + ", seatNo=" + seatNo + ", reserFee="
				+ reserFee + ", id=" + id + ", branchNo=" + branchNo + "]";
	}
}
