package com.kh.cosmos.h_viewBranch.model.vo;

public class BranchPhoto {
	private int bpNo;
	private int branchNo;
	private String originalFileName;
	private String renameFileName;
	private String bpPath;
	private int bpLevel;
	private String bpStatus;
	
	public BranchPhoto() {}

	public BranchPhoto(int bpNo, int branchNo, String originalFileName, String renameFileName, String bpPath,
			int bpLevel, String bpStatus) {
		super();
		this.bpNo = bpNo;
		this.branchNo = branchNo;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.bpPath = bpPath;
		this.bpLevel = bpLevel;
		this.bpStatus = bpStatus;
	}

	public int getBpNo() {
		return bpNo;
	}

	public void setBpNo(int bpNo) {
		this.bpNo = bpNo;
	}

	public int getBranchNo() {
		return branchNo;
	}

	public void setBranchNo(int branchNo) {
		this.branchNo = branchNo;
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

	public String getBpPath() {
		return bpPath;
	}

	public void setBpPath(String bpPath) {
		this.bpPath = bpPath;
	}

	public int getBpLevel() {
		return bpLevel;
	}

	public void setBpLevel(int bpLevel) {
		this.bpLevel = bpLevel;
	}

	public String getBpStatus() {
		return bpStatus;
	}

	public void setBpStatus(String bpStatus) {
		this.bpStatus = bpStatus;
	}

	@Override
	public String toString() {
		return "BranchPhoto [bpNo=" + bpNo + ", branchNo=" + branchNo + ", originalFileName=" + originalFileName
				+ ", renameFileName=" + renameFileName + ", bpPath=" + bpPath + ", bpLevel=" + bpLevel + ", bpStatus="
				+ bpStatus + "]";
	}
	
}
