package com.kh.cosmos;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.cosmos.d_adminPage.model.service.LectureManageService;
import com.kh.cosmos.f_studyGroup.model.service.StudyGroupService;
import com.kh.cosmos.h_viewBranch.model.service.ViewBranchService;
import com.kh.cosmos.i_lecture.model.service.LectureService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private ViewBranchService vbService;
	
	@Autowired
	private LectureService lService;
	
	@Autowired
	private LectureManageService lmService;
	
	@Autowired
	private StudyGroupService sgService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		int allBranch = vbService.getListCount();
		int allSeat = allBranch * 40;
		int allGroup = sgService.getHomeListCount();
		int allLecture = lmService.getListCount();
		
		model.addAttribute("allBranch", allBranch);
		model.addAttribute("allSeat", allSeat);
		model.addAttribute("allGroup", allGroup);
		model.addAttribute("allLecture", allLecture);
		
		return "home";
	}
	
	
}
