package com.kh.cosmos.a_common;

import java.sql.Date;

public class Reply {
	
	private int replyNo;
	private String replyContent;
	private Date createDate;
	private Date modifyDate;
	private String replyStatus;
	private String id;
	private int planNo;
	private int reGrpNo;
	private int reGrpOrder;
	private int reGrpDepth;
	
	private String nickName;
	
	public Reply() {}

	public Reply(int replyNo, String replyContent, Date createDate, Date modifyDate, String replyStatus, String id,
			int planNo, int reGrpNo, int reGrpOrder, int reGrpDepth, String nickName) {
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.replyStatus = replyStatus;
		this.id = id;
		this.planNo = planNo;
		this.reGrpNo = reGrpNo;
		this.reGrpOrder = reGrpOrder;
		this.reGrpDepth = reGrpDepth;
		this.nickName = nickName;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPlanNo() {
		return planNo;
	}

	public void setPlanNo(int planNo) {
		this.planNo = planNo;
	}

	public int getReGrpNo() {
		return reGrpNo;
	}

	public void setReGrpNo(int reGrpNo) {
		this.reGrpNo = reGrpNo;
	}

	public int getReGrpOrder() {
		return reGrpOrder;
	}

	public void setReGrpOrder(int reGrpOrder) {
		this.reGrpOrder = reGrpOrder;
	}

	public int getReGrpDepth() {
		return reGrpDepth;
	}

	public void setReGrpDepth(int reGrpDepth) {
		this.reGrpDepth = reGrpDepth;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", createDate=" + createDate
				+ ", modifyDate=" + modifyDate + ", replyStatus=" + replyStatus + ", id=" + id + ", planNo=" + planNo
				+ ", reGrpNo=" + reGrpNo + ", reGrpOrder=" + reGrpOrder + ", reGrpDepth=" + reGrpDepth + ", nickName="
				+ nickName + "]";
	}
	
}
