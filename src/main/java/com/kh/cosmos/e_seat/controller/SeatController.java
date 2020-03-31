package com.kh.cosmos.e_seat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.cosmos.e_seat.model.service.SeatService;

@Controller
public class SeatController {
	@Autowired
	private SeatService sService;
	
}
