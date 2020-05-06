package com.kh.cosmos.a_common;

public class SearchConditionSeat {
	private String id;
	private String branchName; 
	
	public SearchConditionSeat() {}

	public SearchConditionSeat(String id, String branchName) {
		super();
		this.id = id;
		this.branchName = branchName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	@Override
	public String toString() {
		return "SearchConditionSeat [id=" + id + ", branchName=" + branchName + "]";
	}
	
}
