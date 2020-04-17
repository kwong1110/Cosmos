package com.kh.cosmos.e_seat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.Pagination;
import com.kh.cosmos.e_seat.model.exception.SeatException;
import com.kh.cosmos.e_seat.model.service.SeatService;
import com.kh.cosmos.e_seat.model.vo.Seat;
import com.kh.cosmos.e_seat.model.vo.SortTable;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

@Controller
public class SeatController {
	@Autowired
	private SeatService sService;
	
	@RequestMapping("reservation.se")
	public ModelAndView ReservationView(@RequestParam(value="page", required=false) Integer page, ModelAndView mv ) {
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = sService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<ViewBranch> branchList = sService.selectBranchList(pi);
		
		ArrayList<Seat> seatList = sService.selectSeatList();
		
		ArrayList<SortTable> sortList = sService.selectSortList();
		
		if(branchList != null) {
			mv.addObject("branchList", branchList);
			mv.addObject("seatList", seatList);
			mv.addObject("pi", pi);
			mv.addObject("sortList", sortList);
			mv.setViewName("seatReservation");
		} else {
			throw new SeatException("지점리스트 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	
	
}
