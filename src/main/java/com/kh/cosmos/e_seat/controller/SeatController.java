package com.kh.cosmos.e_seat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.Pagination;
import com.kh.cosmos.e_seat.model.service.SeatService;
import com.kh.cosmos.e_seat.model.vo.Seat;

@Controller
public class SeatController {
	@Autowired
	private SeatService sService;
	
	@RequestMapping("reservation.se")
	public String ReservationView(@RequestParam(value="page", required=false) Integer page, ModelAndView mv ) {
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = sService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Seat> list = sService.selectList(pi);
		
		return "seatReservation";
	}
	
	
	
}
