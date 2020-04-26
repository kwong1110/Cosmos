package com.kh.cosmos.f_studyGroup.model.vo;

import java.sql.Date;

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
	private String msgRule1;
	private String msgRule2;
	private String msgRule3;
	private int msgMet;
	private String msgMetRule;
	
	private Date finalRecDate;
	
	public StudyGroup() {}
	
	public StudyGroup(int sgNo, String sgName, String sgGoal, String sgContent, String sgStatus, int branchNo,
			String id, int studyNo, String studyName, int msgNum, String msgRule1, String msgRule2, String msgRule3,
			int msgMet, String msgMetRule) {
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
		this.msgRule1 = msgRule1;
		this.msgRule2 = msgRule2;
		this.msgRule3 = msgRule3;
		this.msgMet = msgMet;
		this.msgMetRule = msgMetRule;
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

	public String getMsgRule1() {
		return msgRule1;
	}

	public void setMsgRule1(String msgRule1) {
		this.msgRule1 = msgRule1;
	}

	public String getMsgRule2() {
		return msgRule2;
	}

	public void setMsgRule2(String msgRule2) {
		this.msgRule2 = msgRule2;
	}

	public String getMsgRule3() {
		return msgRule3;
	}

	public void setMsgRule3(String msgRule3) {
		this.msgRule3 = msgRule3;
	}

	public int getMsgMet() {
		return msgMet;
	}

	public void setMsgMet(int msgMet) {
		this.msgMet = msgMet;
	}

	public String getMsgMetRule() {
		return msgMetRule;
	}

	public void setMsgMetRule(String msgMetRule) {
		this.msgMetRule = msgMetRule;
	}

	public Date getFinalRecDate() {
		return finalRecDate;
	}

	public void setFinalRecDate(Date finalRecDate) {
		this.finalRecDate = finalRecDate;
	}

	@Override
	public String toString() {
		return "StudyGroup [sgNo=" + sgNo + ", sgName=" + sgName + ", sgGoal=" + sgGoal + ", sgContent=" + sgContent
				+ ", sgStatus=" + sgStatus + ", branchNo=" + branchNo + ", id=" + id + ", studyNo=" + studyNo
				+ ", studyName=" + studyName + ", msgNum=" + msgNum + ", msgRule1=" + msgRule1 + ", msgRule2="
				+ msgRule2 + ", msgRule3=" + msgRule3 + ", msgMet=" + msgMet + ", msgMetRule=" + msgMetRule + "]";
	}
	
	
}
