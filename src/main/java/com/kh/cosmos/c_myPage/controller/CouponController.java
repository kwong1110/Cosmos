package com.kh.cosmos.c_myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.cosmos.c_myPage.model.service.CouponService;

@Controller
public class CouponController {

	@Autowired
	private CouponService cService;
}
