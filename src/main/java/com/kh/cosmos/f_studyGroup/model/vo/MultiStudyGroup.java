package com.kh.cosmos.f_studyGroup.model.vo;

public class MultiStudyGroup {
	private int sgNo;
	private int msgNum;
	private String msgRule1;
	private String msgRule2;
	private String msgRule3;
	private int msgMet;
	private int msgMetRule;
	
	public MultiStudyGroup() {}

	public MultiStudyGroup(int sgNo, int msgNum, String msgRule1, String msgRule2, String msgRule3, int msgMet,
			int msgMetRule) {
		super();
		this.sgNo = sgNo;
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

	public int getMsgMetRule() {
		return msgMetRule;
	}

	public void setMsgMetRule(int msgMetRule) {
		this.msgMetRule = msgMetRule;
	}

	@Override
	public String toString() {
		return "MultiStudyGroup [sgNo=" + sgNo + ", msgNum=" + msgNum + ", msgRule1=" + msgRule1 + ", msgRule2="
				+ msgRule2 + ", msgRule3=" + msgRule3 + ", msgMet=" + msgMet + ", msgMetRule=" + msgMetRule + "]";
	}
	
}
