package com.kh.cosmos.f_studyGroup.model.vo;

import java.sql.Date;

public class StudyGroupRecruit {
	private int sgNo;
	private int recNo;
	private String sgStatus;
	private String studyName;
	private String sgName;
	private String recTerm;
	private int recNum;
	private String nick;
	private String branchName;
	private String sgGoal;
	private String sgContent;
	private Date rsgMetDate;
	private String msgRule1;
	private String msgRule2;
	private String msgRule3;
	private String msgMetRule;
	private int msgMet;
	private int msgNum;

	private int dCloseDate;

	private int partNum;
	private int partMemNum;
	private String groupType;
	
	public StudyGroupRecruit() {}

	public StudyGroupRecruit(int sgNo, int recNo, String sgStatus, String studyName, String sgName, String recTerm,
			int recNum, String nick, String branchName, String sgGoal, String sgContent, String msgRule1,
			String msgRule2, String msgRule3, String msgMetRule, int msgMet, int msgNum) {
		super();
		this.sgNo = sgNo;
		this.recNo = recNo;
		this.sgStatus = sgStatus;
		this.studyName = studyName;
		this.sgName = sgName;
		this.recTerm = recTerm;
		this.recNum = recNum;
		this.nick = nick;
		this.branchName = branchName;
		this.sgGoal = sgGoal;
		this.sgContent = sgContent;
		this.msgRule1 = msgRule1;
		this.msgRule2 = msgRule2;
		this.msgRule3 = msgRule3;
		this.msgMetRule = msgMetRule;
		this.msgMet = msgMet;
		this.msgNum = msgNum;
	}
	
	

	public int getPartMemNum() {
		return partMemNum;
	}

	public void setPartMemNum(int partMemNum) {
		this.partMemNum = partMemNum;
	}

	public String getGroupType() {
		return groupType;
	}

	public void setGroupType(String groupType) {
		this.groupType = groupType;
	}

	public Date getRsgMetDate() {
		return rsgMetDate;
	}

	public void setRsgMetDate(Date rsgMetDate) {
		this.rsgMetDate = rsgMetDate;
	}

	public int getdCloseDate() {
		return dCloseDate;
	}

	public void setdCloseDate(int dCloseDate) {
		this.dCloseDate = dCloseDate;
	}

	public int getPartNum() {
		return partNum;
	}

	public void setPartNum(int partNum) {
		this.partNum = partNum;
	}

	public int getSgNo() {
		return sgNo;
	}

	public void setSgNo(int sgNo) {
		this.sgNo = sgNo;
	}

	public int getRecNo() {
		return recNo;
	}

	public void setRecNo(int recNo) {
		this.recNo = recNo;
	}

	public String getSgStatus() {
		return sgStatus;
	}

	public void setSgStatus(String sgStatus) {
		this.sgStatus = sgStatus;
	}

	public String getStudyName() {
		return studyName;
	}

	public void setStudyName(String studyName) {
		this.studyName = studyName;
	}

	public String getSgName() {
		return sgName;
	}

	public void setSgName(String sgName) {
		this.sgName = sgName;
	}

	public String getRecTerm() {
		return recTerm;
	}

	public void setRecTerm(String recTerm) {
		this.recTerm = recTerm;
	}

	public int getRecNum() {
		return recNum;
	}

	public void setRecNum(int recNum) {
		this.recNum = recNum;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
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

	public String getMsgMetRule() {
		return msgMetRule;
	}

	public void setMsgMetRule(String msgMetRule) {
		this.msgMetRule = msgMetRule;
	}

	public int getMsgMet() {
		return msgMet;
	}

	public void setMsgMet(int msgMet) {
		this.msgMet = msgMet;
	}

	public int getMsgNum() {
		return msgNum;
	}

	public void setMsgNum(int msgNum) {
		this.msgNum = msgNum;
	}

	@Override
	public String toString() {
		return "StudyGroupRecruit [sgNo=" + sgNo + ", recNo=" + recNo + ", sgStatus=" + sgStatus + ", studyName="
				+ studyName + ", sgName=" + sgName + ", recTerm=" + recTerm + ", recNum=" + recNum + ", nick=" + nick
				+ ", branchName=" + branchName + ", sgGoal=" + sgGoal + ", sgContent=" + sgContent + ", msgRule1="
				+ msgRule1 + ", msgRule2=" + msgRule2 + ", msgRule3=" + msgRule3 + ", msgMetRule=" + msgMetRule
				+ ", msgMet=" + msgMet + ", msgNum=" + msgNum + "]";
	}
	
	
}
