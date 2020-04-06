package com.kh.cosmos.f_studyGroup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String StudyGroupInsertView() {
		return "studyGroupInsert";
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
