package com.kh.cosmos.d_adminPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.cosmos.b_member.model.service.MemberService;
import com.kh.cosmos.d_adminPage.model.service.MemberManageService;

@Controller
public class MemberManageController {

	@Autowired
	private MemberManageService mmService;
	private MemberService mService;


	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// 관리자 페이지이동
	@RequestMapping("adminPage.ap")
	public String adminPage() {
		
		return "adminPage";
	}

}
