package com.kh.cosmos.h_viewBranch.model.vo;

public class SearchCondition {
	private String name;
	private String address;
	
	public SearchCondition() {}

	public SearchCondition(String name, String address) {
		super();
		this.name = name;
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "SearchCondition [name=" + name + ", address=" + address + "]";
	}

	
}
