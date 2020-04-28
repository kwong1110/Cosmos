package com.kh.cosmos.c_myPage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.b_member.model.vo.Preview;
import com.kh.cosmos.c_myPage.model.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService mpService;
	
	// 마이페이지 이동
	@RequestMapping("myPage.mp")
	/*public String myPage(@RequestParam("id") String userId, Model model, HttpSession session) {*/
	public String myPage(@RequestParam("id") String userId, Model model, HttpSession session) {
		
		System.out.println("id : " + userId);
		Member loginUser = (Member)session.getAttribute("loginUser");
		String loginUserId = loginUser.getId();
		
		ArrayList<Preview> pList = mpService.getStudyList(loginUserId);
		System.out.println("pList : " + pList);
		
		if(pList != null) {
			model.addAttribute("pList", pList);
		}
		
		return "/myPage/myPage";
	}
	
	
	// 비밀번호 업데이트
	@RequestMapping("memberPwdUpView.mp")
	public String mPwdUpdate() {
		
		return "/myPage/memberPwdUpView";
	}
	
	
}
