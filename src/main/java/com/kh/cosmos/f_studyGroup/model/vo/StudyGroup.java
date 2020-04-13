package com.kh.cosmos.f_studyGroup.model.vo;

public class StudyGroup {
	private int sgNo;
	private String sgName;
	private String sgGoal;
	private String sgContent;
	private String sgStatus;
	private int branchNo;
	private String id;
	private int studyNo;
	private String studyName;
	
	public StudyGroup() {}
	
	public StudyGroup(int sgNo, String sgName, String sgGoal, String sgContent, String sgStatus, int branchNo,
			String id, int studyNo) {
		this.sgNo = sgNo;
		this.sgName = sgName;
		this.sgGoal = sgGoal;
		this.sgContent = sgContent;
		this.sgStatus = sgStatus;
		this.branchNo = branchNo;
		this.id = id;
		this.studyNo = studyNo;
	}

	public int getSgNo() {
		return sgNo;
	}

	public void setSgNo(int sgNo) {
		this.sgNo = sgNo;
	}

	public String getSgName() {
		return sgName;
	}

	public void setSgName(String sgName) {
		this.sgName = sgName;
	}

	public String getSgGoal() {
		return sgGoal;
	}

	public void setSgGoal(String sgGoal) {
		this.sgGoal = sgGoal;
	}

	public String getSgContent() {
		return sgContent;
	}

	public void setSgContent(String sgContent) {
		this.sgContent = sgContent;
	}

	public String getSgStatus() {
		return sgStatus;
	}

	public void setSgStatus(String sgStatus) {
		this.sgStatus = sgStatus;
	}

	public int getBranchNo() {
		return branchNo;
	}

	public void setBranchNo(int branchNo) {
		this.branchNo = branchNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getStudyNo() {
		return studyNo;
	}

	public void setStudyNo(int studyNo) {
		this.studyNo = studyNo;
	}

	public String getStudyName() {
		return studyName;
	}

	public void setStudyName(String studyName) {
		this.studyName = studyName;
	}

	@Override
	public String toString() {
		return "StudyGroup [sgNo=" + sgNo + ", sgName=" + sgName + ", sgGoal=" + sgGoal + ", sgContent=" + sgContent
				+ ", sgStatus=" + sgStatus + ", branchNo=" + branchNo + ", id=" + id + ", studyNo=" + studyNo
				+ ", studyName=" + studyName + "]";
	}
}
