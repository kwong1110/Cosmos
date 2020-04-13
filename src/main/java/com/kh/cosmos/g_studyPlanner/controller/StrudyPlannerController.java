package com.kh.cosmos.g_studyPlanner.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.cosmos.g_studyPlanner.model.service.StudyPlannerService;

@Controller
public class StrudyPlannerController {

	@Autowired
	private StudyPlannerService spService;
	
	
	@RequestMapping("myPlannerList.sp")
	public String myPlannerList() {
		
		return "/myPlanner/myPlannerList";
	}
}
