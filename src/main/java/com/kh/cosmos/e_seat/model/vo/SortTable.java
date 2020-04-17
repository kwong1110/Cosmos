package com.kh.cosmos.e_seat.model.vo;

public class SortTable {
	private String reserSort;
	private int reserFee;
	
	public SortTable() {}

	public SortTable(String reserSort, int reserFee) {
		super();
		this.reserSort = reserSort;
		this.reserFee = reserFee;
	}

	public String getReserSort() {
		return reserSort;
	}

	public void setReserSort(String reserSort) {
		this.reserSort = reserSort;
	}

	public int getReserFee() {
		return reserFee;
	}

	public void setReserFee(int reserFee) {
		this.reserFee = reserFee;
	}

	@Override
	public String toString() {
		return "SortTable [reserSort=" + reserSort + ", reserFee=" + reserFee + "]";
	}
	
	
	
	
}
