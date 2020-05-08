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
	private String lectureJob;
	private String lectureEnd;
	private String lectureStart;
	private String name;
	private String branchName;
	private String phone;
	private String email;
	
	
	public Lecture() {}


	public Lecture(int lectureNo, String lectureRecord, String lectureTitle, String lectureContent, int lectureFee,
			int maxpeople, int attendpeople, Date lectureDate, String lectureTime, String lectureStatus, String id,
			int branchNo, String lectureJob, String lectureEnd, String lectureStart, String name, String branchName,
			String phone, String email) {
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
		this.lectureJob = lectureJob;
		this.lectureEnd = lectureEnd;
		this.lectureStart = lectureStart;
		this.name = name;
		this.branchName = branchName;
		this.phone = phone;
		this.email = email;
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


	public String getLectureJob() {
		return lectureJob;
	}


	public void setLectureJob(String lectureJob) {
		this.lectureJob = lectureJob;
	}


	public String getLectureEnd() {
		return lectureEnd;
	}


	public void setLectureEnd(String lectureEnd) {
		this.lectureEnd = lectureEnd;
	}


	public String getLectureStart() {
		return lectureStart;
	}


	public void setLectureStart(String lectureStart) {
		this.lectureStart = lectureStart;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getBranchName() {
		return branchName;
	}


	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	@Override
	public String toString() {
		return "Lecture [lectureNo=" + lectureNo + ", lectureRecord=" + lectureRecord + ", lectureTitle=" + lectureTitle
				+ ", lectureContent=" + lectureContent + ", lectureFee=" + lectureFee + ", maxpeople=" + maxpeople
				+ ", attendpeople=" + attendpeople + ", lectureDate=" + lectureDate + ", lectureTime=" + lectureTime
				+ ", lectureStatus=" + lectureStatus + ", id=" + id + ", branchNo=" + branchNo + ", lectureJob="
				+ lectureJob + ", lectureEnd=" + lectureEnd + ", lectureStart=" + lectureStart + ", name=" + name
				+ ", branchName=" + branchName + ", phone=" + phone + ", email=" + email + "]";
	}

	
}
