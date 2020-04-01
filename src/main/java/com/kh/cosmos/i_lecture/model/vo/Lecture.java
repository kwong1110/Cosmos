package com.kh.cosmos.i_lecture.model.vo;

import java.sql.Date;

public class Lecture {

	private int lectureNo;
	private String lectureRecord;
	private String lectureTitle;
	private String lectureContent;
	private int lectureFee;
	private int maxpeople;
	private int attendpeople;
	private Date lectureDate;
	private String lectureTime;
	private String lectureStatus;
	private String id;
	private int branchNo;
	
	public Lecture() {}

	public Lecture(int lectureNo, String lectureRecord, String lectureTitle, String lectureContent, int lectureFee,
			int maxpeople, int attendpeople, Date lectureDate, String lectureTime, String lectureStatus, String id,
			int branchNo) {
		this.lectureNo = lectureNo;
		this.lectureRecord = lectureRecord;
		this.lectureTitle = lectureTitle;
		this.lectureContent = lectureContent;
		this.lectureFee = lectureFee;
		this.maxpeople = maxpeople;
		this.attendpeople = attendpeople;
		this.lectureDate = lectureDate;
		this.lectureTime = lectureTime;
		this.lectureStatus = lectureStatus;
		this.id = id;
		this.branchNo = branchNo;
	}

	public int getLectureNo() {
		return lectureNo;
	}

	public void setLectureNo(int lectureNo) {
		this.lectureNo = lectureNo;
	}

	public String getLectureRecord() {
		return lectureRecord;
	}

	public void setLectureRecord(String lectureRecord) {
		this.lectureRecord = lectureRecord;
	}

	public String getLectureTitle() {
		return lectureTitle;
	}

	public void setLectureTitle(String lectureTitle) {
		this.lectureTitle = lectureTitle;
	}

	public String getLectureContent() {
		return lectureContent;
	}

	public void setLectureContent(String lectureContent) {
		this.lectureContent = lectureContent;
	}

	public int getLectureFee() {
		return lectureFee;
	}

	public void setLectureFee(int lectureFee) {
		this.lectureFee = lectureFee;
	}

	public int getMaxpeople() {
		return maxpeople;
	}

	public void setMaxpeople(int maxpeople) {
		this.maxpeople = maxpeople;
	}

	public int getAttendpeople() {
		return attendpeople;
	}

	public void setAttendpeople(int attendpeople) {
		this.attendpeople = attendpeople;
	}

	public Date getLectureDate() {
		return lectureDate;
	}

	public void setLectureDate(Date lectureDate) {
		this.lectureDate = lectureDate;
	}

	public String getLectureTime() {
		return lectureTime;
	}

	public void setLectureTime(String lectureTime) {
		this.lectureTime = lectureTime;
	}

	public String getLectureStatus() {
		return lectureStatus;
	}

	public void setLectureStatus(String lectureStatus) {
		this.lectureStatus = lectureStatus;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getBranchNo() {
		return branchNo;
	}

	public void setBranchNo(int branchNo) {
		this.branchNo = branchNo;
	}

	@Override
	public String toString() {
		return "Lecture [lectureNo=" + lectureNo + ", lectureRecord=" + lectureRecord + ", lectureTitle=" + lectureTitle
				+ ", lectureContent=" + lectureContent + ", lectureFee=" + lectureFee + ", maxpeople=" + maxpeople
				+ ", attendpeople=" + attendpeople + ", lectureDate=" + lectureDate + ", lectureTime=" + lectureTime
				+ ", lectureStatus=" + lectureStatus + ", id=" + id + ", branchNo=" + branchNo + "]";
	}
}
