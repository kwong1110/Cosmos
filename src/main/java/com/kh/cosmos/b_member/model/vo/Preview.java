package com.kh.cosmos.b_member.model.vo;

import java.util.ArrayList;

public class Preview {
	private String id;
	private int studyNo;
	private String spTerm;
	private String studyName;
	private String studyEtc;
	
	public Preview() {}

	public Preview(String id, int studyNo, String spTerm, String studyName, String studyEtc) {
		super();
		this.id = id;
		this.studyNo = studyNo;
		this.spTerm = spTerm;
		this.studyName = studyName;
		this.studyEtc = studyEtc;
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

	public String getSpTerm() {
		return spTerm;
	}

	public void setSpTerm(String spTerm) {
		this.spTerm = spTerm;
	}

	public String getStudyName() {
		return studyName;
	}

	public void setStudyName(String studyName) {
		this.studyName = studyName;
	}

	public String getStudyEtc() {
		return studyEtc;
	}

	public void setStudyEtc(String studyEtc) {
		this.studyEtc = studyEtc;
	}

	@Override
	public String toString() {
		return "Preview [id=" + id + ", studyNo=" + studyNo + ", spTerm=" + spTerm + ", studyName=" + studyName
				+ ", studyEtc=" + studyEtc + "]";
	}

}
