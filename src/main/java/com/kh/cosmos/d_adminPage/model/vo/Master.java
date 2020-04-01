package com.kh.cosmos.d_adminPage.model.vo;

public class Master {

	private String masterId;
	private String masterName;
	private String masterPw;
	private int masterTel;
	private int masterClass;
	private int branchNo;
	
	public Master() {}

	public Master(String masterId, String masterName, String masterPw, int masterTel, int masterClass, int branchNo) {
		this.masterId = masterId;
		this.masterName = masterName;
		this.masterPw = masterPw;
		this.masterTel = masterTel;
		this.masterClass = masterClass;
		this.branchNo = branchNo;
	}

	public String getMasterId() {
		return masterId;
	}

	public void setMasterId(String masterId) {
		this.masterId = masterId;
	}

	public String getMasterName() {
		return masterName;
	}

	public void setMasterName(String masterName) {
		this.masterName = masterName;
	}

	public String getMasterPw() {
		return masterPw;
	}

	public void setMasterPw(String masterPw) {
		this.masterPw = masterPw;
	}

	public int getMasterTel() {
		return masterTel;
	}

	public void setMasterTel(int masterTel) {
		this.masterTel = masterTel;
	}

	public int getMasterClass() {
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
		return "Master [masterId=" + masterId + ", masterName=" + masterName + ", masterPw=" + masterPw + ", masterTel="
				+ masterTel + ", masterClass=" + masterClass + ", branchNo=" + branchNo + "]";
	}
	
}
