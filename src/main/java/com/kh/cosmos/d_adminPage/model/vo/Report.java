package com.kh.cosmos.d_adminPage.model.vo;

import java.sql.Date;

public class Report {

	private int reportNo;
	private String reportStatus;
	private int reportReason;
	private Date reportDate;
	private String mid;
	private String reportMid;
	
	public Report() {}

	public Report(int reportNo, String reportStatus, int reportReason, Date reportDate, String mid,
			String reportMid) {
		this.reportNo = reportNo;
		this.reportStatus = reportStatus;
		this.reportReason = reportReason;
		this.reportDate = reportDate;
		this.mid = mid;
		this.reportMid = reportMid;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getReportStatus() {
		return reportStatus;
	}

	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}

	public int getReportReason() {
		return reportReason;
	}

	public void setReportReason(int reportReason) {
		this.reportReason = reportReason;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getReportMid() {
		return reportMid;
	}

	public void setReportMid(String reportMid) {
		this.reportMid = reportMid;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportStatus=" + reportStatus + ", reportReason=" + reportReason
				+ ", reportDate=" + reportDate + ", mid=" + mid + ", reportMid=" + reportMid + "]";
	}
}
