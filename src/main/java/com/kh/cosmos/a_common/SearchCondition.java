package com.kh.cosmos.a_common;

public class SearchCondition {
	private String writer;
	private String title;
	private String content;
	
	public SearchCondition() {}

	public SearchCondition(String writer, String title, String content) {
		this.writer = writer;
		this.title = title;
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "SearchCondition [writer=" + writer + ", title=" + title + ", content=" + content + "]";
	}
	
}
