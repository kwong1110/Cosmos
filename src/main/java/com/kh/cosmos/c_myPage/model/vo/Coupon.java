package com.kh.cosmos.c_myPage.model.vo;

public class Coupon {

	private String id;
	private int reserNo;
	private int cStamp;
	
	public Coupon() {}

	public Coupon(String id, int reserNo, int cStamp) {
		this.id = id;
		this.reserNo = reserNo;
		this.cStamp = cStamp;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getReserNo() {
		return reserNo;
	}

	public void setReserNo(int reserNo) {
		this.reserNo = reserNo;
	}

	public int getcStamp() {
		return cStamp;
	}

	public void setcStamp(int cStamp) {
		this.cStamp = cStamp;
	}

	@Override
	public String toString() {
		return "Coupon [id=" + id + ", reserNo=" + reserNo + ", cStamp=" + cStamp + "]";
	}
}
