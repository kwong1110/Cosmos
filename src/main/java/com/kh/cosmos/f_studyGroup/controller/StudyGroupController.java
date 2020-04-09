package com.kh.cosmos.f_studyGroup.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cosmos.f_studyGroup.model.service.StudyGroupService;

@Controller
public class StudyGroupController {

	@Autowired
	private StudyGroupService sgService;
	
	@RequestMapping("listView.sg")
	public String StudyGroupListView() {
		return "studyGroupList";
	}
	
	@RequestMapping("insertGroupView.sg")
	public ModelAndView StudyGroupInsertView(ModelAndView mv) {
		ArrayList studyList = sgService.getStudyList();
		ArrayList branchList = sgService.getBranchList();
		
		mv.addObject("studyList", studyList);
		mv.addObject("branchList", branchList);
		mv.setViewName("studyGroupInsert");
		
		return mv;
	}

	@RequestMapping("insertRecView.sg")
	public String RecruitInsertView() {
		return "recruitInsert";
	}

	@RequestMapping("recruitDetailView.sg")
	public String RecruitDetailView() {
		return "recruitDetail";
	}
}
