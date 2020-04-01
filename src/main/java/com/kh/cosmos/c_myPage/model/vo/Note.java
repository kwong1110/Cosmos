package com.kh.cosmos.c_myPage.model.vo;

import java.sql.Date;

public class Note {

	private int noteNo;
	private String noteContent;
	private Date noteCreate;
	private String noteStatus;
	private String noteStorage;
	private String noteSender;
	private String noteReceiter;
	
	public Note() {}

	public Note(int noteNo, String noteContent, Date noteCreate, String noteStatus, String noteStorage,
			String noteSender, String noteReceiter) {
		this.noteNo = noteNo;
		this.noteContent = noteContent;
		this.noteCreate = noteCreate;
		this.noteStatus = noteStatus;
		this.noteStorage = noteStorage;
		this.noteSender = noteSender;
		this.noteReceiter = noteReceiter;
	}

	public int getNoteNo() {
		return noteNo;
	}

	public void setNoteNo(int noteNo) {
		this.noteNo = noteNo;
	}

	public String getNoteContent() {
		return noteContent;
	}

	public void setNoteContent(String noteContent) {
		this.noteContent = noteContent;
	}

	public Date getNoteCreate() {
		return noteCreate;
	}

	public void setNoteCreate(Date noteCreate) {
		this.noteCreate = noteCreate;
	}

	public String getNoteStatus() {
		return noteStatus;
	}

	public void setNoteStatus(String noteStatus) {
		this.noteStatus = noteStatus;
	}

	public String getNoteStorage() {
		return noteStorage;
	}

	public void setNoteStorage(String noteStorage) {
		this.noteStorage = noteStorage;
	}

	public String getNoteSender() {
		return noteSender;
	}

	public void setNoteSender(String noteSender) {
		this.noteSender = noteSender;
	}

	public String getNoteReceiter() {
		return noteReceiter;
	}

	public void setNoteReceiter(String noteReceiter) {
		this.noteReceiter = noteReceiter;
	}

	@Override
	public String toString() {
		return "Note [noteNo=" + noteNo + ", noteContent=" + noteContent + ", noteCreate=" + noteCreate
				+ ", noteStatus=" + noteStatus + ", noteStorage=" + noteStorage + ", noteSender=" + noteSender
				+ ", noteReceiter=" + noteReceiter + "]";
	}
}
