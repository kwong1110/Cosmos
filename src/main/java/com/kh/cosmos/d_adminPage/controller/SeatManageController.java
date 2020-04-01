package com.kh.cosmos.d_adminPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.cosmos.d_adminPage.model.service.SeatManageService;

@Controller
public class SeatManageController {
	
	@Autowired
	private SeatManageService smService;
}
