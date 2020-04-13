package com.kh.cosmos.i_lecture.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;
import com.kh.cosmos.i_lecture.model.exception.LectureException;
import com.kh.cosmos.i_lecture.model.service.LectureService;
import com.kh.cosmos.i_lecture.model.vo.Lecture;

@Controller
public class LectureController {

	@Autowired
	private LectureService lService;
	
	@RequestMapping("lectureCalendar.le")
	public String lectureCalendar(Model model) {
		
		ArrayList<Lecture> list = lService.selectList();
		// System.out.println("list확인 : " + list);
		
		if(list != null) {
			model.addAttribute("list", list);
			return "lectureCalendar";
		} else {
			throw new LectureException("강연 전체 조회에 실패하였습니다.");
		}
	}
	
	@RequestMapping("lectureApplyGuide.le")
	public String lectureApplyGuide() {
		return "lectureApplyGuide";
	}
	
	@RequestMapping("lectureApplyForm.le")
	public String lectureApplyForm(Model model) {
		
		ArrayList<ViewBranch> branchList = lService.selectBranchList();
		
		if(branchList != null) {
			model.addAttribute("branchList", branchList);
			return "lectureApplyForm";
		} else {
			throw new LectureException("지점 전체 조회에 실패하였습니다.");
		}
	}
	
	@RequestMapping("lectureApply.le")
	public String lectureApply(@ModelAttribute Lecture l, @RequestParam("daterange") String daterange) {
	
			// daterangepicker로 받아온 값을 담아준다.
//		System.out.println(daterange);
//		YYYY-MM-DD tt:mm - YYYY-MM-DD tt:mm
		
		String[] fullDate = daterange.split(" - ");

		String startDate = fullDate[0].split(" ")[0];
		String startTime = fullDate[0].split(" ")[1];
		String endDate = fullDate[1].split(" ")[0];
		String endTime = fullDate[1].split(" ")[1];
		
		Date startDateSql = Date.valueOf(startDate);
		Date endDateSql = Date.valueOf(endDate);
		// System.out.println("sql] start : " + startDateSql + " end : " + endDateSql);
		
		l.setLectureStart(startDateSql);
		l.setLectureEnd(endDateSql);
		l.setLectureTime(startTime + "~" + endTime);
		System.out.println(l);
		
		int result = lService.lectureApply(l);
		
		// 마이페이지 강연 조회로 넘어가야함.
		return "";
	}
	
	@RequestMapping("lectureView.le")
	public String lectureView(@RequestParam("lectureNo") String lectureNo) {
		
		System.out.println(lectureNo);
		
		return "lectureCalendar";
	}
}
