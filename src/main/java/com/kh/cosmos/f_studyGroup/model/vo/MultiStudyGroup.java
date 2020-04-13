package com.kh.cosmos.f_studyGroup.model.vo;

public class MultiStudyGroup {
	private int sgNo;
	private int msgNum;
	private String msgRole1;
	private String msgRole2;
	private String msgRole3;
	private int msgMet;
	
	public MultiStudyGroup() {}
	
	public MultiStudyGroup(int sgNo, int msgNum, String msgRole1, String msgRole2, String msgRole3, int msgMet) {
		super();
		this.sgNo = sgNo;
		this.msgNum = msgNum;
		this.msgRole1 = msgRole1;
		this.msgRole2 = msgRole2;
		this.msgRole3 = msgRole3;
		this.msgMet = msgMet;
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

	@Override
	public String toString() {
		return "MultiStudyGroup [sgNo=" + sgNo + ", msgNum=" + msgNum + ", msgRole1=" + msgRole1 + ", msgRole2="
				+ msgRole2 + ", msgRole3=" + msgRole3 + ", msgMet=" + msgMet + "]";
	}
	
}
