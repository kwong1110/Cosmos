package com.kh.cosmos.f_studyGroup.model.vo;

public class StudyGroupRecruit {
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
	private int msgMet;
	private int msgNum;
	
	public StudyGroupRecruit() {}

	public StudyGroupRecruit(int recNo, String sgStatus, String studyName, String sgName, String recTerm, int recNum,
			String nick, String branchName, String sgGoal, String sgContent, int msgMet, int msgNum) {
		super();
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
		this.msgMet = msgMet;
		this.msgNum = msgNum;
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
		return "StudyGroupRecruit [recNo=" + recNo + ", sgStatus=" + sgStatus + ", studyName=" + studyName + ", sgName="
				+ sgName + ", recTerm=" + recTerm + ", recNum=" + recNum + ", nick=" + nick + ", branchName="
				+ branchName + ", sgGoal=" + sgGoal + ", sgContent=" + sgContent + ", msgMet=" + msgMet + ", msgNum="
				+ msgNum + "]";
	}
	
}
