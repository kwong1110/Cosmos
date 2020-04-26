package com.kh.cosmos.d_adminPage.model.vo;

public class Master {

	private String masterId;
	private int masterClass;
	private int branchNo;
	
	public Master() {}

	public Master(String masterId, int masterClass, int branchNo) {
		this.masterId = masterId;
		this.masterClass = masterClass;
		this.branchNo = branchNo;
	}

	public String getMasterId() {
		return masterId;
	}

	public void setMasterId(String masterId) {
		this.masterId = masterId;
	}

	public int getMasterClass(int masterClass) {
		return masterClass;
	}

	public void setMasterClass(int masterClass) {
		this.masterClass = masterClass;
	}

	public int getBranchNo() {
		return branchNo;
	}

	public void setBranchNo(int branchNo) {
		this.branchNo = branchNo;
	}

	@Override
	public String toString() {
		return "Master [masterId=" + masterId + ", masterClass=" + masterClass + ", branchNo=" + branchNo + "]";
	}

	
	
}
