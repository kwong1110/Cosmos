package com.kh.cosmos.b_member.model.vo;

public class StudyCategory {
	private int studyNo;
	private String studyName;
	
	public StudyCategory() {}

	public StudyCategory(int studyNo, String studyName) {
		super();
		this.studyNo = studyNo;
		this.studyName = studyName;
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

	@Override
	public String toString() {
		return "StudyCategory [studyNo=" + studyNo + ", studyName=" + studyName + "]";
	}
	
}
