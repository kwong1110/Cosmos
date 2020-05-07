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
	private String planStart;
	private Date createDate;
	private String planStatus;
	private String openStatus;
	private String id;
	private int studyNo;
	private String planEnd;
	private String planMemo;
	private String planAllday;
	private String planColor;
	
	private String nickName;
	private String studyName;
	
	
	public StudyPlanner() {}


	public StudyPlanner(int planNo, String planTitle, String planContent, String planMenu, String todayCheck,
			int likeCount, int hit, String planStart, Date createDate, String planStatus, String openStatus, String id,
			int studyNo, String planEnd, String planMemo, String planAllday, String planColor, String nickName,
			String studyName) {
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
		this.planEnd = planEnd;
		this.planMemo = planMemo;
		this.planAllday = planAllday;
		this.planColor = planColor;
		this.nickName = nickName;
		this.studyName = studyName;
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


	public String getPlanStart() {
		return planStart;
	}


	public void setPlanStart(String planStart) {
		this.planStart = planStart;
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


	public String getPlanEnd() {
		return planEnd;
	}


	public void setPlanEnd(String planEnd) {
		this.planEnd = planEnd;
	}


	public String getPlanMemo() {
		return planMemo;
	}


	public void setPlanMemo(String planMemo) {
		this.planMemo = planMemo;
	}


	public String getPlanAllday() {
		return planAllday;
	}


	public void setPlanAllday(String planAllday) {
		this.planAllday = planAllday;
	}


	public String getPlanColor() {
		return planColor;
	}


	public void setPlanColor(String planColor) {
		this.planColor = planColor;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	public String getStudyName() {
		return studyName;
	}


	public void setStudyName(String studyName) {
		this.studyName = studyName;
	}


	@Override
	public String toString() {
		return "StudyPlanner [planNo=" + planNo + ", planTitle=" + planTitle + ", planContent=" + planContent
				+ ", planMenu=" + planMenu + ", todayCheck=" + todayCheck + ", likeCount=" + likeCount + ", hit=" + hit
				+ ", planStart=" + planStart + ", createDate=" + createDate + ", planStatus=" + planStatus
				+ ", openStatus=" + openStatus + ", id=" + id + ", studyNo=" + studyNo + ", planEnd=" + planEnd
				+ ", planMemo=" + planMemo + ", planAllday=" + planAllday + ", planColor=" + planColor + ", nickName="
				+ nickName + ", studyName=" + studyName + "]";
	}
	
}
