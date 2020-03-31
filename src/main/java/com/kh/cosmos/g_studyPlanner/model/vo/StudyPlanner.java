package com.kh.cosmos.g_studyPlanner.model.vo;

import java.sql.Date;

public class StudyPlanner {
	private int planNo;
	private String planTitle;
	private String planContent;
	private String planMenu;
	private String emphasis;
	private int likeCount;
	private int hit;
	private Date planDate;
	private Date createDate;
	private String planStatus;
	private String openStatus;
	private String id;
	private int studyNo;
	
	public StudyPlanner() {}

	public StudyPlanner(int planNo, String planTitle, String planContent, String planMenu, String emphasis,
			int likeCount, int hit, Date planDate, Date createDate, String planStatus, String openStatus, String id,
			int studyNo) {
		this.planNo = planNo;
		this.planTitle = planTitle;
		this.planContent = planContent;
		this.planMenu = planMenu;
		this.emphasis = emphasis;
		this.likeCount = likeCount;
		this.hit = hit;
		this.planDate = planDate;
		this.createDate = createDate;
		this.planStatus = planStatus;
		this.openStatus = openStatus;
		this.id = id;
		this.studyNo = studyNo;
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

	public String getEmphasis() {
		return emphasis;
	}

	public void setEmphasis(String emphasis) {
		this.emphasis = emphasis;
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

	public Date getPlanDate() {
		return planDate;
	}

	public void setPlanDate(Date planDate) {
		this.planDate = planDate;
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

	@Override
	public String toString() {
		return "StudyPlanner [planNo=" + planNo + ", planTitle=" + planTitle + ", planContent=" + planContent
				+ ", planMenu=" + planMenu + ", emphasis=" + emphasis + ", likeCount=" + likeCount + ", hit=" + hit
				+ ", planDate=" + planDate + ", createDate=" + createDate + ", planStatus=" + planStatus
				+ ", openStatus=" + openStatus + ", id=" + id + ", studyNo=" + studyNo + "]";
	}
	
}
