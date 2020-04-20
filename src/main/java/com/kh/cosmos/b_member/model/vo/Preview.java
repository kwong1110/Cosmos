package com.kh.cosmos.b_member.model.vo;

public class Preview {
	private String id;
	private int studyNo;
	private String spTerm;
	
	public Preview() {}

	public Preview(String id, int studyNo, String spTerm) {
		super();
		this.id = id;
		this.studyNo = studyNo;
		this.spTerm = spTerm;
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

	@Override
	public String toString() {
		return "Preview [id=" + id + ", studyNo=" + studyNo + ", spTerm=" + spTerm + "]";
	}

}
