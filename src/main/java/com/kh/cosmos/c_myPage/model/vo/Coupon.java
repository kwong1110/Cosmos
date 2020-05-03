package com.kh.cosmos.c_myPage.model.vo;

public class Coupon {

	private int cNo;
	private String cInsertDate;
	private int cStamp;
	private int cTotalStamp;
	private String cContent;
	private String id;
	private int reserNo;
	
	public Coupon() {}

	public Coupon(int cNo, String cInsertDate, int cStamp, int cTotalStamp, String cContent, String id, int reserNo) {
		super();
		this.cNo = cNo;
		this.cInsertDate = cInsertDate;
		this.cStamp = cStamp;
		this.cTotalStamp = cTotalStamp;
		this.cContent = cContent;
		this.id = id;
		this.reserNo = reserNo;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getcInsertDate() {
		return cInsertDate;
	}

	public void setcInsertDate(String cInsertDate) {
		this.cInsertDate = cInsertDate;
	}

	public int getcStamp() {
		return cStamp;
	}

	public void setcStamp(int cStamp) {
		this.cStamp = cStamp;
	}

	public int getcTotalStamp() {
		return cTotalStamp;
	}

	public void setcTotalStamp(int cTotalStamp) {
		this.cTotalStamp = cTotalStamp;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
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

	@Override
	public String toString() {
		return "Coupon [cNo=" + cNo + ", cInsertDate=" + cInsertDate + ", cStamp=" + cStamp + ", cTotalStamp="
				+ cTotalStamp + ", cContent=" + cContent + ", id=" + id + ", reserNo=" + reserNo + "]";
	}

	
	
}
