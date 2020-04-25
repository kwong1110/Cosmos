package com.kh.cosmos.b_member.model.vo;

import java.sql.Date;

public class Member {
	private String id;
	private String pwd;
	private String name;
	private String nick;
	private String birth;
	private String email;
	private String phone;
	private Date enroll;
	private int certifyNum;
	private String certifyStatus;
	private String mstatus;
	private int grade;
	private String gender;
	
	public Member() {}
	
	// 전체 생성자
	public Member(String id, String pwd, String name, String nick, String birth, String email, String phone,
			Date enroll, int certifyNum, String certifyStatus, String mstatus, int grade, String gender) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.nick = nick;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
		this.enroll = enroll;
		this.certifyNum = certifyNum;
		this.certifyStatus = certifyStatus;
		this.mstatus = mstatus;
		this.grade = grade;
		this.gender = gender;
	}
	
	// 아이디 찾기 생성자
	public Member(String id, String name, String email) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
	}
	
	// 비밀번호 찾기 생성자
	public Member(String id, String pwd, String name, String email) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
	}
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getEnroll() {
		return enroll;
	}

	public void setEnroll(Date enroll) {
		this.enroll = enroll;
	}

	public int getCertifyNum() {
		return certifyNum;
	}

	public void setCertifyNum(int certifyNum) {
		this.certifyNum = certifyNum;
	}

	public String getCertifyStatus() {
		return certifyStatus;
	}

	public void setCertifyStatus(String certifyStatus) {
		this.certifyStatus = certifyStatus;
	}

	public String getMstatus() {
		return mstatus;
	}

	public void setMstatus(String mstatus) {
		this.mstatus = mstatus;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", nick=" + nick + ", birth=" + birth
				+ ", email=" + email + ", phone=" + phone + ", enroll=" + enroll + ", certifyNum=" + certifyNum
				+ ", certifyStatus=" + certifyStatus + ", mstatus=" + mstatus + ", grade=" + grade + ", gender="
				+ gender + "]";
	}
	
}
