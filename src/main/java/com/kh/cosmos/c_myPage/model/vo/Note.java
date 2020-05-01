package com.kh.cosmos.c_myPage.model.vo;

import java.sql.Date;

public class Note {

	private int noteNo;
	private String noteFromId;
	private String noteToId;
	private String noteContent;
	private Date noteTime;
	private String noteFromStatus;
	private String noteAlarm;
	private String noteStorage;
	private String noteToStatus;
	
	public Note() {}

	public Note(int noteNo, String noteFromId, String noteToId, String noteContent, Date noteTime,
			String noteFromStatus, String noteAlarm, String noteStorage, String noteToStatus) {
		super();
		this.noteNo = noteNo;
		this.noteFromId = noteFromId;
		this.noteToId = noteToId;
		this.noteContent = noteContent;
		this.noteTime = noteTime;
		this.noteFromStatus = noteFromStatus;
		this.noteAlarm = noteAlarm;
		this.noteStorage = noteStorage;
		this.noteToStatus = noteToStatus;
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

	public String getNoteFromStatus() {
		return noteFromStatus;
	}

	public void setNoteFromStatus(String noteFromStatus) {
		this.noteFromStatus = noteFromStatus;
	}

	public String getNoteAlarm() {
		return noteAlarm;
	}

	public void setNoteAlarm(String noteAlarm) {
		this.noteAlarm = noteAlarm;
	}

	public String getNoteStorage() {
		return noteStorage;
	}

	public void setNoteStorage(String noteStorage) {
		this.noteStorage = noteStorage;
	}

	public String getNoteToStatus() {
		return noteToStatus;
	}

	public void setNoteToStatus(String noteToStatus) {
		this.noteToStatus = noteToStatus;
	}

	@Override
	public String toString() {
		return "Note [noteNo=" + noteNo + ", noteFromId=" + noteFromId + ", noteToId=" + noteToId + ", noteContent="
				+ noteContent + ", noteTime=" + noteTime + ", noteFromStatus=" + noteFromStatus + ", noteAlarm="
				+ noteAlarm + ", noteStorage=" + noteStorage + ", noteToStatus=" + noteToStatus + "]";
	}

}
