package com.kh.cosmos.f_studyGroup.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.f_studyGroup.model.exception.StudyGroupException;
import com.kh.cosmos.f_studyGroup.model.service.StudyGroupService;
import com.kh.cosmos.f_studyGroup.model.vo.StudyGroup;
import com.kh.cosmos.f_studyGroup.model.vo.StudyRecruit;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

@Controller
public class StudyGroupController {

	@Autowired
	private StudyGroupService sgService;
	
	@RequestMapping("listView.sg")
	public ModelAndView StudyGroupListView(ModelAndView mv) {
		ArrayList studyList = sgService.getStudyList();
		ArrayList<ViewBranch> branchList = sgService.getBranchList();
		
		
		mv.addObject("studyList", studyList);
		mv.addObject("branchList", branchList);
		mv.setViewName("studyGroupList");
		
		return mv;
	}
	
	@RequestMapping("insertGroupView.sg")
	public ModelAndView StudyGroupInsertView(ModelAndView mv) {
		ArrayList studyList = sgService.getStudyList();
		ArrayList<ViewBranch> branchList = sgService.getBranchList();
		
		mv.addObject("studyList", studyList);
		mv.addObject("branchList", branchList);
		mv.setViewName("studyGroupInsert");
		
		return mv;
	}
	
	@RequestMapping("insertGroup.sg")
	public String StudyGroupInsert(@ModelAttribute StudyGroup sg, @ModelAttribute StudyRecruit sr,
								   @RequestParam("studyName") String studyName, @RequestParam("loginUserId") String loginUserId) {
		sg.setStudyName(studyName);
		sg.setId(loginUserId);
		
		int result = sgService.insertGroup(sg);
		
		int result2 = 0;
		if(result > 0) {
			result2 = sgService.insertRecruit(sr);
		}
		
		if(result > 0 && result2 > 0) {
			return "studyGroupList";
		} else {
			throw new StudyGroupException("그룹 생성에 실패하였습니다.");
		}
	}

	@RequestMapping("insertRecView.sg")
	public ModelAndView RecruitInsertView(HttpServletRequest request, ModelAndView mv) {

		HttpSession session = request.getSession();
		String id = ((Member)session.getAttribute("loginUser")).getId();
		
		ArrayList<StudyGroup> sgList = sgService.getStudyGroupList(id);
		mv.addObject("sgList", sgList);
		mv.setViewName("recruitInsert");
		
		return mv;
	}

	@RequestMapping("recruitDetailView.sg")
	public String RecruitDetailView() {
		return "recruitDetail";
	}
}
