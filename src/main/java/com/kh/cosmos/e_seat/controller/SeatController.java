package com.kh.cosmos.e_seat.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.Pagination;
import com.kh.cosmos.a_common.Pagination_seat;
import com.kh.cosmos.a_common.SearchConditionSeat;
import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.c_myPage.model.service.NoteService;
import com.kh.cosmos.c_myPage.model.vo.Note;
import com.kh.cosmos.e_seat.model.exception.SeatException;
import com.kh.cosmos.e_seat.model.service.SeatService;
import com.kh.cosmos.e_seat.model.vo.Seat;
import com.kh.cosmos.e_seat.model.vo.SortTable;
import com.kh.cosmos.f_studyGroup.model.service.StudyGroupService;
import com.kh.cosmos.f_studyGroup.model.vo.StudyGroup;
import com.kh.cosmos.g_studyPlanner.model.exception.StudyPlannerException;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

@Controller
public class SeatController {
	@Autowired
	private SeatService sService;
	
	@Autowired
	private StudyGroupService sgService;

	@Autowired
	private NoteService nService;
	
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
		
		ArrayList<StudyGroup> sgList = sgService.getIngStudyGroupList(id);
		
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
	public int seatBuyView( @ModelAttribute Seat s, @RequestParam("reserDate") String reserDate, @RequestParam("chooseSeat") String chooseSeat,
							@RequestParam("totalFeeStr") String totalFeeStr, @RequestParam(value="group", required=false, defaultValue="99999") int group,
							@RequestParam(value="groupname", required=false) String groupname) {
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

		//쿠폰 등록 시작
		if(result > 0) {
			String branchName = sService.getBranchName(s.getBranchNo());
			
			HashMap<String, String> map = new HashMap<String, String>();
			int cResult = 0;
			if(s.getEndTime() - s.getStartTime() >= 3 && s.getReserType().equals("시간권")) { // 3시간 이상 좌석예약했을 때 도장 부여
				int totalStamp = sService.getTotalStamp(s.getId())+1;
				
				map.put("id", s.getId());
				map.put("totalStamp", totalStamp+"");
				map.put("stampContent", branchName + " " + s.getReserPeople() + "인 좌석예약");
				
				cResult = sService.insertOneStamp(map);
				
				if(totalStamp == 10) {
					map.put("id", s.getId());
					map.put("stampContent", "쿠폰 발급");
					
					cResult = sService.insertCoupon(map);

					Random rnd = new Random();
					String couponStr = "";
					for(int i = 0; i < 11; i++) {
						couponStr = couponStr + String.valueOf((char) ((int) (rnd.nextInt(26)) + 65));
					}
					
					Note n = new Note();
					n.setNoteFromId("admin00");
					n.setNoteToId(s.getId());
					n.setNoteContent("♥쿠폰♥ 도장 10개가 적립되어 코스모스 전 지점에서 사용할 수 있는 1시간 이용권이 지급되었습니다! <label style='color:blue;'>" + couponStr + "</label>");
					int messageResult = nService.insertNote(n);
				}
				
				if(s.getReserPeople() != 1 && group != 99999 && (s.getReserSort().equals("B") || s.getReserSort().equals("C") || s.getReserSort().equals("D") || s.getReserSort().equals("E"))) { // 그룹 예약 했을 때 그룹원 전체 도장 부여
					String sgStatus = sgService.getSgStatus(group);
					if(sgStatus.equals("Y")) cResult = sgService.updateMsgCount(group); // 그룹 만남 횟수 증가
					
					ArrayList<String> memberList = sgService.getMemList(group);
					for(String memId : memberList) {
						totalStamp = 0;
						totalStamp = sService.getTotalStamp(memId)+1;
						
						map.put("id", memId);
						map.put("totalStamp", totalStamp+"");
						map.put("stampContent", branchName + " " + s.getReserPeople() + "인 스터디 그룹 예약");
						
						cResult = sService.insertOneStamp(map);
						
						if(totalStamp == 10) {
							map.put("id", s.getId());
							map.put("stampContent", "쿠폰 발급");
							
							cResult = sService.insertCoupon(map);
							
							Random rnd = new Random();
							String couponStr = "";
							for(int i = 0; i < 11; i++) {
								couponStr = couponStr + String.valueOf((char) ((int) (rnd.nextInt(26)) + 65));
							}
							
							Note n = new Note();
							n.setNoteFromId("admin00");
							n.setNoteToId(memId);
							n.setNoteContent("♥쿠폰♥ 도장 10개가 적립되어 코스모스 전 지점에서 사용할 수 있는 1시간 이용권이 지급되었습니다! <label style='color:blue;'>" + couponStr + "</label>");
							int messageResult = nService.insertNote(n);
						}
						
						Note n = new Note();
						n.setNoteFromId("admin00");
						n.setNoteToId(memId);
						n.setNoteContent(branchName + " " + s.getReserDay() + " " + s.getStartTime() + ":00 ~ " + s.getEndTime() + ":00에 " + "'" + groupname + "' 그룹의 스터디 룸이 예약되었습니다.");
						int messageResult = nService.insertNote(n);
					}
				}
			}
			
		}
		//쿠폰 등록 끝
		
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
	
	@RequestMapping("allSeat.se")
	public String allSeat(Model model, @ModelAttribute Seat s,  @RequestParam(value="page", required=false) Integer page) {
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = sService.getAllListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Seat> allList = sService.selectAllList(pi);
		
		if(allList != null) {
			model.addAttribute("allList", allList);
			model.addAttribute("pi", pi);
			return "/seatStatus";
		}else {
			throw new SeatException("예약현황 전체 조회에 실패하였습니다.");
		}
		
	}
	
	
	
	@RequestMapping("seatStatus.se")
	public String seatStatusView(@RequestParam(value="page", required=false) Integer page, @ModelAttribute Seat s,
							     @RequestParam("searchType") String searchType,@RequestParam("searchText") String searchText, Model model,
								 SearchConditionSeat scs) {
		
		if(searchType.equals("id")) {
			scs.setId(searchText);
		} else if(searchType.equals("branchName")) {
			scs.setBranchName(searchText);
		}
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = sService.getSeatStatusListCount(scs);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Seat> seatStatusList = sService.seatStatusList(pi, scs);
		
		if(seatStatusList != null) {
			model.addAttribute("allList", seatStatusList);
			model.addAttribute("pi", pi);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchText", searchText);
			
			return "/seatStatus";
		} else {
			throw new SeatException("예약현황 전체 조회에 실패하였습니다.");
		}
	} 
}
