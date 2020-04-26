package com.kh.cosmos.g_studyPlanner.model.vo;

import java.sql.Date;

public class StudyPlanner {
	private int planNo;
	private String planTitle;
	private String planContent;
	private String planMenu;
	private String todayCheck;
	private int likeCount;
	private int hit;
	private Date planStart;
	private Date createDate;
	private String planStatus;
	private String openStatus;
	private String id;
	private int studyNo;
	private Date planEnd;
	
	private String studyName;
	
	public StudyPlanner() {}

	public StudyPlanner(int planNo, String planTitle, String planContent, String planMenu, String todayCheck,
			int likeCount, int hit, Date planStart, Date createDate, String planStatus, String openStatus, String id,
			int studyNo, String studyName, Date planEnd) {
		this.planNo = planNo;
		this.planTitle = planTitle;
		this.planContent = planContent;
		this.planMenu = planMenu;
		this.todayCheck = todayCheck;
		this.likeCount = likeCount;
		this.hit = hit;
		this.planStart = planStart;
		this.createDate = createDate;
		this.planStatus = planStatus;
		this.openStatus = openStatus;
		this.id = id;
		this.studyNo = studyNo;
		this.studyName = studyName;
		this.planEnd = planEnd;
	}

	public int getPlanNo() {
		return planNo;
	}

	public void setPlanNo(int planNo) {
		this.planNo = planNo;
	}

	public String getPlanTitle() {
		return planTitle;
	}

	public void setPlanTitle(String planTitle) {
		this.planTitle = planTitle;
	}

	public String getPlanContent() {
		return planContent;
	}

	public void setPlanContent(String planContent) {
		this.planContent = planContent;
	}

	public String getPlanMenu() {
		return planMenu;
	}

	public void setPlanMenu(String planMenu) {
		this.planMenu = planMenu;
	}

	public String getTodayCheck() {
		return todayCheck;
	}

	public void setTodayCheck(String todayCheck) {
		this.todayCheck = todayCheck;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getPlanStatus() {
		return planStatus;
	}

	public void setPlanStatus(String planStatus) {
		this.planStatus = planStatus;
	}

	public String getOpenStatus() {
		return openStatus;
	}

	public void setOpenStatus(String openStatus) {
		this.openStatus = openStatus;
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

	public String getStudyName() {
		return studyName;
	}

	public void setStudyName(String studyName) {
		this.studyName = studyName;
	}
	
	public Date getPlanStart() {
		return planStart;
	}

	public void setPlanStart(Date planStart) {
		this.planStart = planStart;
	}

	public Date getPlanEnd() {
		return planEnd;
	}

	public void setPlanEnd(Date planEnd) {
		this.planEnd = planEnd;
	}

	@Override
	public String toString() {
		return "StudyPlanner [planNo=" + planNo + ", planTitle=" + planTitle + ", planContent=" + planContent
				+ ", planMenu=" + planMenu + ", todayCheck=" + todayCheck + ", likeCount=" + likeCount + ", hit=" + hit
				+ ", planStart=" + planStart + ", createDate=" + createDate + ", planStatus=" + planStatus
				+ ", openStatus=" + openStatus + ", id=" + id + ", studyNo=" + studyNo + ", planEnd=" + planEnd
				+ ", studyName=" + studyName + "]";
	}

	
	
}
