package com.kh.cosmos.c_myPage.model.vo;

import java.sql.Date;

public class Note {

	private int noteNo;
	private String noteFromId;
	private String noteToId;
	private String noteContent;
	private Date noteTime;
	private String noteStatus;
	
	public Note() {}

	public Note(int noteNo, String noteFromId, String noteToId, String noteContent, Date noteTime, String noteStatus) {
		super();
		this.noteNo = noteNo;
		this.noteFromId = noteFromId;
		this.noteToId = noteToId;
		this.noteContent = noteContent;
		this.noteTime = noteTime;
		this.noteStatus = noteStatus;
	}

	public int getNoteNo() {
		return noteNo;
	}

	public void setNoteNo(int noteNo) {
		this.noteNo = noteNo;
	}

	public String getNoteFromId() {
		return noteFromId;
	}

	public void setNoteFromId(String noteFromId) {
		this.noteFromId = noteFromId;
	}

	public String getNoteToId() {
		return noteToId;
	}

	public void setNoteToId(String noteToId) {
		this.noteToId = noteToId;
	}

	public String getNoteContent() {
		return noteContent;
	}

	public void setNoteContent(String noteContent) {
		this.noteContent = noteContent;
	}

	public Date getNoteTime() {
		return noteTime;
	}

	public void setNoteTime(Date noteTime) {
		this.noteTime = noteTime;
	}

	public String getNoteStatus() {
		return noteStatus;
	}

	public void setNoteStatus(String noteStatus) {
		this.noteStatus = noteStatus;
	}

	@Override
	public String toString() {
		return "Note [noteNo=" + noteNo + ", noteFromId=" + noteFromId + ", noteToId=" + noteToId + ", noteContent="
				+ noteContent + ", noteTime=" + noteTime + ", noteStatus=" + noteStatus + "]";
	}

}
