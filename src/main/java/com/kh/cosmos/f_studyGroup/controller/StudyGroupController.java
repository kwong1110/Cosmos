package com.kh.cosmos.f_studyGroup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.cosmos.f_studyGroup.model.service.StudyGroupService;

@Controller
public class StudyGroupController {

	@Autowired
	private StudyGroupService sgService;
	
	@RequestMapping("insertView.sg")
	public String StudyGroupInsertView() {
		return "studyGroupInsert";
	}
}
