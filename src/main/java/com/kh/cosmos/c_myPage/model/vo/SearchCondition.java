package com.kh.cosmos.c_myPage.model.vo;

public class SearchCondition {
	private String id;
	private String nick;
	private String content;
	private String userId;
	
	public SearchCondition() {}

	public SearchCondition(String id, String nick, String content, String userId) {
		super();
		this.id = id;
		this.nick = nick;
		this.content = content;
		this.userId = userId;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "SearchCondition [id=" + id + ", nick=" + nick + ", content=" + content + ", userId=" + userId + "]";
	}

}
