package com.kh.cosmos.d_adminPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.cosmos.d_adminPage.model.service.ReportService;

@Controller
public class ReportController {

	@Autowired
	private ReportService rService;
}