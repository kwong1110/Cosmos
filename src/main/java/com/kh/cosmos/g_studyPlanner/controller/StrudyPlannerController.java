package com.kh.cosmos.g_studyPlanner.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.cosmos.b_member.model.service.MemberService;
import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.b_member.model.vo.Preview;
import com.kh.cosmos.b_member.model.vo.StudyCategory;
import com.kh.cosmos.g_studyPlanner.model.service.StudyPlannerService;
import com.kh.cosmos.g_studyPlanner.model.vo.StudyPlanner;
import com.kh.cosmos.i_lecture.model.exception.LectureException;

@Controller
public class StrudyPlannerController {

	@Autowired
	private StudyPlannerService spService;
	
	@Autowired
	private MemberService mService;
	
	
	@RequestMapping("myPlannerList.sp")
	public String myPlannerList(Model model, @ModelAttribute StudyCategory sc, HttpSession session) {
		
		ArrayList<StudyPlanner> pList = spService.selectList();
		// System.out.println("list 확인 : " + list);
		
		// 전체 스터디카테고리 불러오기
		ArrayList<StudyCategory> sList = mService.selectStudyCategoryList(sc);
		// 로그인한 유저의 전체 카테고리 불러오기
		Member loginUser = (Member)session.getAttribute("loginUser");
		String loginUserId = loginUser.getId();
		ArrayList<Preview> userStudyList = mService.getStudyList(loginUserId);
		
		if(pList != null) {
			model.addAttribute("pList", pList);
			model.addAttribute("sList", sList);
			model.addAttribute("userStudyList", userStudyList);
			return "/myPlanner/myPlannerList";
		} else {
			throw new LectureException("나의 플래너 전체 조회에 실패하였습니다.");
		}
	}
}
