package com.kh.cosmos.f_studyGroup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.cosmos.f_studyGroup.model.service.StudyGroupService;

@Controller
public class StudyGroupController {

	@Autowired
	private StudyGroupService sgService;
}
