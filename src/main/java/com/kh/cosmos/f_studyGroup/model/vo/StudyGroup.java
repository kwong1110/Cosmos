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

	private int msgNum;
	private String msgRole1;
	private String msgRole2;
	private String msgRole3;
	private int msgMet;
	private String msgMetRole;
	
	public StudyGroup() {}
	
	public StudyGroup(int sgNo, String sgName, String sgGoal, String sgContent, String sgStatus, int branchNo,
			String id, int studyNo, String studyName, int msgNum, String msgRole1, String msgRole2, String msgRole3,
			int msgMet, String msgMetRole) {
		super();
		this.sgNo = sgNo;
		this.sgName = sgName;
		this.sgGoal = sgGoal;
		this.sgContent = sgContent;
		this.sgStatus = sgStatus;
		this.branchNo = branchNo;
		this.id = id;
		this.studyNo = studyNo;
		this.studyName = studyName;
		this.msgNum = msgNum;
		this.msgRole1 = msgRole1;
		this.msgRole2 = msgRole2;
		this.msgRole3 = msgRole3;
		this.msgMet = msgMet;
		this.msgMetRole = msgMetRole;
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

	public int getMsgNum() {
		return msgNum;
	}

	public void setMsgNum(int msgNum) {
		this.msgNum = msgNum;
	}

	public String getMsgRole1() {
		return msgRole1;
	}

	public void setMsgRole1(String msgRole1) {
		this.msgRole1 = msgRole1;
	}

	public String getMsgRole2() {
		return msgRole2;
	}

	public void setMsgRole2(String msgRole2) {
		this.msgRole2 = msgRole2;
	}

	public String getMsgRole3() {
		return msgRole3;
	}

	public void setMsgRole3(String msgRole3) {
		this.msgRole3 = msgRole3;
	}

	public int getMsgMet() {
		return msgMet;
	}

	public void setMsgMet(int msgMet) {
		this.msgMet = msgMet;
	}

	public String getMsgMetRole() {
		return msgMetRole;
	}

	public void setMsgMetRole(String msgMetRole) {
		this.msgMetRole = msgMetRole;
	}

	@Override
	public String toString() {
		return "StudyGroup [sgNo=" + sgNo + ", sgName=" + sgName + ", sgGoal=" + sgGoal + ", sgContent=" + sgContent
				+ ", sgStatus=" + sgStatus + ", branchNo=" + branchNo + ", id=" + id + ", studyNo=" + studyNo
				+ ", studyName=" + studyName + ", msgNum=" + msgNum + ", msgRole1=" + msgRole1 + ", msgRole2="
				+ msgRole2 + ", msgRole3=" + msgRole3 + ", msgMet=" + msgMet + ", msgMetRole=" + msgMetRole + "]";
	}
	
	
}
