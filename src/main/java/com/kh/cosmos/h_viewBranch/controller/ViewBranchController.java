package com.kh.cosmos.h_viewBranch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.cosmos.h_viewBranch.model.service.ViewBranchService;

@Controller
public class ViewBranchController {
	
	@Autowired
	private ViewBranchService vbService;
}
