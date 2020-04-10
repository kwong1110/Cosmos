package com.kh.cosmos.f_studyGroup.model.vo;

import java.sql.Date;

public class StudyRecruit {
	private int recNo;
	private String recTerm;
	private int recNum;
	private Date recInsertDate;
	private Date recMettingDate;
	private int sgNo;
	
	public StudyRecruit() {}

	public StudyRecruit(int recNo, String recTerm, int recNum, Date recInsertDate, Date recMettingDate, int sgNo) {
		super();
		this.recNo = recNo;
		this.recTerm = recTerm;
		this.recNum = recNum;
		this.recInsertDate = recInsertDate;
		this.recMettingDate = recMettingDate;
		this.sgNo = sgNo;
	}

	public int getRecNo() {
		return recNo;
	}

	public void setRecNo(int recNo) {
		this.recNo = recNo;
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

	public Date getRecInsertDate() {
		return recInsertDate;
	}

	public void setRecInsertDate(Date recInsertDate) {
		this.recInsertDate = recInsertDate;
	}

	public Date getRecMettingDate() {
		return recMettingDate;
	}

	public void setRecMettingDate(Date recMettingDate) {
		this.recMettingDate = recMettingDate;
	}

	public int getSgNo() {
		return sgNo;
	}

	public void setSgNo(int sgNo) {
		this.sgNo = sgNo;
	}

	@Override
	public String toString() {
		return "StudyRecruit [recNo=" + recNo + ", recTerm=" + recTerm + ", recNum=" + recNum + ", recInsertDate="
				+ recInsertDate + ", recMettingDate=" + recMettingDate + ", sgNo=" + sgNo + "]";
	}
	
}
