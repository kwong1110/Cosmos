package com.kh.cosmos.f_studyGroup.model.vo;

import java.sql.Date;

public class ApproachGroup {
	private int sgNo;
	private String id;
	private String nick;
	private String asgDate;
	private Date asgDlDate;
	private String asgStatus;
	private int rsgNo;
	
	public ApproachGroup() {}

	public ApproachGroup(int sgNo, String id, String nick, String asgDate, Date asgDlDate, String asgStatus, int rsgNo) {
		super();
		this.sgNo = sgNo;
		this.id = id;
		this.nick = nick;
		this.asgDate = asgDate;
		this.asgDlDate = asgDlDate;
		this.asgStatus = asgStatus;
		this.rsgNo = rsgNo;
	}

	public int getSgNo() {
		return sgNo;
	}

	public void setSgNo(int sgNo) {
		this.sgNo = sgNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getAsgDate() {
		return asgDate;
	}

	public void setAsgDate(String asgDate) {
		this.asgDate = asgDate;
	}

	public Date getAsgDlDate() {
		return asgDlDate;
	}

	public void setAsgDlDate(Date asgDlDate) {
		this.asgDlDate = asgDlDate;
	}

	public String getAsgStatus() {
		return asgStatus;
	}

	public void setAsgStatus(String asgStatus) {
		this.asgStatus = asgStatus;
	}

	public int getRsgNo() {
		return rsgNo;
	}

	public void setRsgNo(int rsgNo) {
		this.rsgNo = rsgNo;
	}

	@Override
	public String toString() {
		return "ApproachGroup [sgNo=" + sgNo + ", id=" + id + ", nick=" + nick + ", asgDate=" + asgDate + ", asgDlDate="
				+ asgDlDate + ", asgStatus=" + asgStatus + ", rsgNo=" + rsgNo + "]";
	}
	
	
	
}
