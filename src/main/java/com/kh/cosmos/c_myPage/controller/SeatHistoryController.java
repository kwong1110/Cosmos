package com.kh.cosmos.c_myPage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.c_myPage.model.service.SeatHistoryService;
import com.kh.cosmos.e_seat.model.vo.Seat;
import com.kh.cosmos.g_studyPlanner.model.exception.StudyPlannerException;
import com.kh.cosmos.i_lecture.model.vo.Lecture;

@Controller
public class SeatHistoryController {

	@Autowired
	private SeatHistoryService shService;
	
	@RequestMapping("slHistory.mp")
	public String myPlannerList(Model model, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String loginUserId = loginUser.getId();
		
		ArrayList<Seat> mySeatList = shService.mySeatHistory(loginUserId);
		ArrayList<Lecture> myLectureList = shService.myLectureHistory(loginUserId);
		
		if(mySeatList != null && myLectureList != null) {
			model.addAttribute("mySeatList", mySeatList);
			model.addAttribute("myLectureList", myLectureList);
			return "/myPage/myPayment";
		} else {
			throw new StudyPlannerException("나의 플래너 전체 조회에 실패하였습니다.");
		}
	}
}
