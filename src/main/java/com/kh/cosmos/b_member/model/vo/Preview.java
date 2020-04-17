package com.kh.cosmos.b_member.model.vo;

public class Preview {
	private String id;
	private String spTerm;
	private int studyNo;
	
	public Preview() {}

	public Preview(String id, String spTerm, int studyNo) {
		super();
		this.id = id;
		this.spTerm = spTerm;
		this.studyNo = studyNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSpTerm() {
		return spTerm;
	}

	public void setSpTerm(String spTerm) {
		this.spTerm = spTerm;
	}

	public int getStudyNo() {
		return studyNo;
	}

	public void setStudyNo(int studyNo) {
		this.studyNo = studyNo;
	}

	@Override
	public String toString() {
		return "Preview [id=" + id + ", spTerm=" + spTerm + ", studyNo=" + studyNo + "]";
	}
	
}
