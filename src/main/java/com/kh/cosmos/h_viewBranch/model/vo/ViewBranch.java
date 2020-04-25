package com.kh.cosmos.h_viewBranch.model.vo;

public class ViewBranch {
	
	private int branchNo;
	private String branchName;
	private String branchAddress;
	private String branchTel;
	private String branchContent;
	private String branchTime;
	private String branchRest;
	private String originalFileName;
	private String renameFileName;
	
	public ViewBranch() {}

	public ViewBranch(int branchNo, String branchName, String branchAddress, String branchTel, String branchContent,
			String branchTime, String branchRest, String originalFileName, String renameFileName) {
		super();
		this.branchNo = branchNo;
		this.branchName = branchName;
		this.branchAddress = branchAddress;
		this.branchTel = branchTel;
		this.branchContent = branchContent;
		this.branchTime = branchTime;
		this.branchRest = branchRest;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
	}

	public int getBranchNo() {
		return branchNo;
	}

	public void setBranchNo(int branchNo) {
		this.branchNo = branchNo;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getBranchAddress() {
		return branchAddress;
	}

	public void setBranchAddress(String branchAddress) {
		this.branchAddress = branchAddress;
	}

	public String getBranchTel() {
		return branchTel;
	}

	public void setBranchTel(String branchTel) {
		this.branchTel = branchTel;
	}

	public String getBranchContent() {
		return branchContent;
	}

	public void setBranchContent(String branchContent) {
		this.branchContent = branchContent;
	}

	public String getBranchTime() {
		return branchTime;
	}

	public void setBranchTime(String branchTime) {
		this.branchTime = branchTime;
	}

	public String getBranchRest() {
		return branchRest;
	}

	public void setBranchRest(String branchRest) {
		this.branchRest = branchRest;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	@Override
	public String toString() {
		return "ViewBranch [branchNo=" + branchNo + ", branchName=" + branchName + ", branchAddress=" + branchAddress
				+ ", branchTel=" + branchTel + ", branchContent=" + branchContent + ", branchTime=" + branchTime
				+ ", branchRest=" + branchRest + ", originalFileName=" + originalFileName + ", renameFileName="
				+ renameFileName + "]";
	}

}