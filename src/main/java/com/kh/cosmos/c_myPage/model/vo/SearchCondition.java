package com.kh.cosmos.c_myPage.model.vo;

public class SearchCondition {
	private String id;
	private String nick;
	private String content;
	
	public SearchCondition() {}

	public SearchCondition(String id, String nick, String content) {
		super();
		this.id = id;
		this.nick = nick;
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "SearchCondition [id=" + id + ", nick=" + nick + ", content=" + content + "]";
	}
	
}
