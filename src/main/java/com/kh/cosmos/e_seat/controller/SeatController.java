package com.kh.cosmos.e_seat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.cosmos.e_seat.model.service.SeatService;

@Controller
public class SeatController {
	@Autowired
	private SeatService sService;
	
	@RequestMapping("reservation.se")
	public String ReservationView() {
		return "seatReservation";
	}
	
}
