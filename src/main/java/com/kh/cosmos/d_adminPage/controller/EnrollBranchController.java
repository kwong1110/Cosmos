package com.kh.cosmos.d_adminPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.cosmos.d_adminPage.model.service.EnrollBranchService;

@Controller
public class EnrollBranchController {
	
	@Autowired
	private EnrollBranchService ebService;
}
