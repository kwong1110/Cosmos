package com.kh.cosmos.e_seat.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.Pagination;
import com.kh.cosmos.a_common.Pagination_seat;
import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.e_seat.model.exception.SeatException;
import com.kh.cosmos.e_seat.model.service.SeatService;
import com.kh.cosmos.e_seat.model.vo.Seat;
import com.kh.cosmos.e_seat.model.vo.SortTable;
import com.kh.cosmos.f_studyGroup.model.service.StudyGroupService;
import com.kh.cosmos.f_studyGroup.model.vo.StudyGroup;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

@Controller
public class SeatController {
	@Autowired
	private SeatService sService;
	
	@Autowired
	private StudyGroupService sgService;
	
	@RequestMapping("reservation.se")
	public ModelAndView ReservationView(@RequestParam(value="page", required=false) Integer page, ModelAndView mv, HttpServletRequest request ) {
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = sService.getListCount();
		
		PageInfo pi = Pagination_seat.getPageInfo(currentPage, listCount);
		
		ArrayList<ViewBranch> branchList = sService.selectBranchList(pi);
		
		ArrayList<SortTable> sortList = sService.selectSortList();
		
		HttpSession session = request.getSession();
		String id = ((Member)session.getAttribute("loginUser")).getId();
		
		ArrayList<StudyGroup> sgList = sgService.getStudyGroupList(id);
		
		if(branchList != null) {
			mv.addObject("branchList", branchList);
			mv.addObject("pi", pi);
			mv.addObject("sortList", sortList);
			mv.addObject("sgList", sgList);
			mv.setViewName("seatReservation");
		} else {
			throw new SeatException("지점리스트 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("seatBuy.se")
	public int seatBuyView( @ModelAttribute Seat s, @RequestParam("reserDate") String reserDate, @RequestParam("chooseSeat") String chooseSeat,@RequestParam("totalFeeStr") String totalFeeStr ) {
		String startDate = "";
		String startTime = "";
		String endDate = "";
		String endTime = "";
		
		if(reserDate.length() > 20) {
			String[] fullDate = reserDate.split(" - ");
			
			startDate = fullDate[0].split(" ")[0];
			startTime = fullDate[0].split(" ")[1].split(":")[0];
			endDate = fullDate[1].split(" ")[0];
			endTime = fullDate[1].split(" ")[1].split(":")[0]; 
		} else if(reserDate.length() < 20) {
			String[] singleDate = reserDate.split(" ");
			
			startDate = singleDate[0];
			startTime = singleDate[1];
			endDate = singleDate[0];
			endTime = "24:00";
		}
		
		Date reserDay = Date.valueOf(startDate);
		Date finishDay = Date.valueOf(endDate);
		
		String[] seatChoose = chooseSeat.split("-");
		
		String reserSort = seatChoose[0];
		String seatNo = seatChoose[1];
		
		s.setReserDay(reserDay);
		s.setFinishDay(finishDay);
		s.setStartTime(Integer.parseInt(startTime));
		s.setEndTime(Integer.parseInt(endTime));
		s.setReserSort(reserSort);
		s.setSeatNo(Integer.parseInt(seatNo));
		s.setTotalFee(Integer.parseInt(totalFeeStr));
		int result = sService.seatBuy(s);
		
		return result;	
	}
	
	
	@RequestMapping("overlap.se")
	public void overlapView(@RequestParam("reserDate") String reserDate, @ModelAttribute Seat s, HttpServletResponse response) throws JsonIOException, IOException {
		
		String startDate = "";
		String startTime = "";
		String endDate = "";
		String endTime = "";
		
		if(reserDate.length() > 20) {
			String[] fullDate = reserDate.split(" - ");
			
			startDate = fullDate[0].split(" ")[0];
			startTime = fullDate[0].split(" ")[1].split(":")[0];
			endDate = fullDate[1].split(" ")[0];
			endTime = fullDate[1].split(" ")[1].split(":")[0]; 
		} else if(reserDate.length() < 20) {
			String[] singleDate = reserDate.split(" ");
			
			startDate = singleDate[0];
			startTime = singleDate[1].split(":")[0];
			endDate = singleDate[0];
			endTime = "24";
		}
		
		Date reserDay = Date.valueOf(startDate);
		Date finishDay = Date.valueOf(endDate);
		
		s.setReserDay(reserDay);
		s.setFinishDay(finishDay);
		s.setStartTime(Integer.parseInt(startTime));
		s.setEndTime(Integer.parseInt(endTime));
		
		ArrayList<Seat> seatList = sService.selectSeatList(s);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(seatList, response.getWriter());
		
	}
	
	@RequestMapping("seatStatus.se")
	public ModelAndView seatStatusView(@RequestParam(value="page", required=false) Integer page, ModelAndView mv, @ModelAttribute Seat s, HttpServletRequest request,
									@RequestParam("searchCondition") String searchCondition, @RequestParam("searchValue") String searchValue,
									@RequestParam("id") String id, @RequestParam("branchName") String branchName) {
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		if(searchCondition.equals("id")) {
			s.setId(searchValue);
		} else if(searchCondition.equals("branchName")) {
			s.setBranchName(searchValue);
		}
		
		int listCount = sService.getSeatStatusListCount();
		
		int searchListCount = sService.getSearchListCount(s);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, searchListCount);
		
		ArrayList<Seat> seatStatusList = sService.seatStatusList(s, pi);
		
		if(seatStatusList != null) {
			mv.addObject("seatStatusList", seatStatusList);
			mv.addObject("listCount", listCount);
			mv.addObject("searchListCount", searchListCount);
			mv.addObject("pi", pi);
			mv.addObject("searchCondition",searchCondition);
			mv.addObject("searchValue",searchValue);
			mv.setViewName("seatStatus");
		} else {
			throw new SeatException("예약현황 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	} 
}
