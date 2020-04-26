package com.kh.cosmos.f_studyGroup.model.vo;

import java.sql.Date;

public class StudyGroupApproach {
	private int no;
	
	private int sgNo; //<- ap_sgroup pk
	private String sgName;
	private String sgStatus;
	private String id; //그룹장아이디
	private String nick; //그룹장닉네임
	private String studyName;

	private String userId; //조회하는 회원의 아이디
	private Date sortDate;
	private String appStatus;
	
	public StudyGroupApproach() {}

	public StudyGroupApproach(int no, int sgNo, String sgName, String sgStatus, String id, String nick,
			String studyName, String userId, Date sortDate, String appStatus) {
		super();
		this.no = no;
		this.sgNo = sgNo;
		this.sgName = sgName;
		this.sgStatus = sgStatus;
		this.id = id;
		this.nick = nick;
		this.studyName = studyName;
		this.userId = userId;
		this.sortDate = sortDate;
		this.appStatus = appStatus;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public String getSgStatus() {
		return sgStatus;
	}

	public void setSgStatus(String sgStatus) {
		this.sgStatus = sgStatus;
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

	public String getStudyName() {
		return studyName;
	}

	public void setStudyName(String studyName) {
		this.studyName = studyName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getSortDate() {
		return sortDate;
	}

	public void setSortDate(Date sortDate) {
		this.sortDate = sortDate;
	}

	public String getAppStatus() {
		return appStatus;
	}

	public void setAppStatus(String appStatus) {
		this.appStatus = appStatus;
	}

	@Override
	public String toString() {
		return "StudyGroupApproach [no=" + no + ", sgNo=" + sgNo + ", sgName=" + sgName + ", sgStatus=" + sgStatus
				+ ", id=" + id + ", nick=" + nick + ", studyName=" + studyName + ", userId=" + userId + ", sortDate="
				+ sortDate + ", appStatus=" + appStatus + "]";
	}
	
	
}
