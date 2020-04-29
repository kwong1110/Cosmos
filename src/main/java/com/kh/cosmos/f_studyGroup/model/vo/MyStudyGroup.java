package com.kh.cosmos.f_studyGroup.model.vo;

import java.sql.Date;

public class MyStudyGroup {
	private int no;
	
	private int sgNo; //<- ap_sgroup pk
	private String sgName;
	private String sgStatus;
	private String id; //그룹장아이디
	private String nick; //그룹장닉네임 //그룹 멤버 닉네임
	private String studyName;

	private String userId; //조회하는 회원의 아이디
	private Date sortDate;
	private String appStatus;
	private Date appDlDate;

	private int recNo;
	private Date recEnrollDate;
	private String recTerm;
	private int recNum;
	
	public MyStudyGroup() {}
	
	public MyStudyGroup(int no, int sgNo, String sgName, String sgStatus, String id, String nick, String studyName,
			String userId, Date sortDate, String appStatus, Date appDlDate, Date recEnrollDate, String recTerm,
			int recNum) {
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
		this.appDlDate = appDlDate;
		this.recEnrollDate = recEnrollDate;
		this.recTerm = recTerm;
		this.recNum = recNum;
	}

	

	public int getRecNo() {
		return recNo;
	}

	public void setRecNo(int recNo) {
		this.recNo = recNo;
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

	public Date getAppDlDate() {
		return appDlDate;
	}

	public void setAppDlDate(Date appDlDate) {
		this.appDlDate = appDlDate;
	}

	public Date getRecEnrollDate() {
		return recEnrollDate;
	}

	public void setRecEnrollDate(Date recEnrollDate) {
		this.recEnrollDate = recEnrollDate;
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

	@Override
	public String toString() {
		return "MyStudyGroup [no=" + no + ", sgNo=" + sgNo + ", sgName=" + sgName + ", sgStatus=" + sgStatus + ", id="
				+ id + ", nick=" + nick + ", studyName=" + studyName + ", userId=" + userId + ", sortDate=" + sortDate
				+ ", appStatus=" + appStatus + ", appDlDate=" + appDlDate + ", recNo=" + recNo + ", recEnrollDate="
				+ recEnrollDate + ", recTerm=" + recTerm + ", recNum=" + recNum + ", getRecNo()=" + getRecNo()
				+ ", getNo()=" + getNo() + ", getSgNo()=" + getSgNo() + ", getSgName()=" + getSgName()
				+ ", getSgStatus()=" + getSgStatus() + ", getId()=" + getId() + ", getNick()=" + getNick()
				+ ", getStudyName()=" + getStudyName() + ", getUserId()=" + getUserId() + ", getSortDate()="
				+ getSortDate() + ", getAppStatus()=" + getAppStatus() + ", getAppDlDate()=" + getAppDlDate()
				+ ", getRecEnrollDate()=" + getRecEnrollDate() + ", getRecTerm()=" + getRecTerm() + ", getRecNum()="
				+ getRecNum() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
}
