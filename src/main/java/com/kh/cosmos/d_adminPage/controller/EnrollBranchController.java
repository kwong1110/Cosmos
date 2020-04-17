package com.kh.cosmos.d_adminPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.cosmos.d_adminPage.model.service.EnrollBranchService;

@Controller
public class EnrollBranchController {
	
	@Autowired
	private EnrollBranchService ebService;
	
	@RequestMapping("enrollBranch.ap")
	public String EnrollBranchView() {
		return "EnrollBranchForm";
	}
	
	@RequestMapping("branchList.ap")
	public String branchList() {
		return "BranchList";
	}
}
