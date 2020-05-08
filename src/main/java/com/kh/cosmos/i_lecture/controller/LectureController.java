package com.kh.cosmos.i_lecture.controller;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;
import com.kh.cosmos.i_lecture.model.exception.LectureException;
import com.kh.cosmos.i_lecture.model.service.LectureService;
import com.kh.cosmos.i_lecture.model.vo.Lecture;

@Controller
public class LectureController {

	@Autowired
	private LectureService lService;
	
	@RequestMapping("lectureCalendar.le")
	public String lectureCalendar(Model model, HttpSession session) {
		
		ArrayList<Lecture> list = lService.selectList();
		// System.out.println("list확인 : " + list);
		
		// 해당 로그인 유저의 강연 신청 내역을 받아와 신청 버튼 비활성화.
		if((Member)session.getAttribute("loginUser") != null) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			String loginUserId = loginUser.getId();
			ArrayList<Lecture> lectureList = lService.selectLectureAttendList(loginUserId);
			model.addAttribute("lectureList", lectureList);
		}
		
		
		if(list != null) {
			for(Lecture l : list) {
				// Fullcalander를 쓰게되면 바로 <textarea>로 값이 들어가는게 아니라 치환을 해주어야 정상적으로 출력된다.
				l.setLectureRecord(l.getLectureRecord().replaceAll("\r\n", "<br>"));
			}
			model.addAttribute("llist", list);
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
	public String lectureApply(@ModelAttribute Lecture l, @RequestParam("daterange") String daterange, 
								Model model, RedirectAttributes ra) {
	
			// daterangepicker로 받아온 값을 담아준다.
//		System.out.println(daterange);
//		YYYY-MM-DD tt:mm - YYYY-MM-DD tt:mm
		
		String[] fullDate = daterange.split(" - ");

		String startDate = fullDate[0];
		String endDate = fullDate[1];
		
//		String startTime = fullDate[0].split(" ")[1];
//		String endTime = fullDate[1].split(" ")[1];		
//		Date startDateSql = Date.valueOf(startDate);
//		Date endDateSql = Date.valueOf(endDate);
		// System.out.println("sql] start : " + startDateSql + " end : " + endDateSql);
		
		l.setLectureStart(startDate);
		l.setLectureEnd(endDate);
//		l.setLectureTime(startTime + "~" + endTime);
		// System.out.println(l);
		
//		// textarea의 띄어쓰기, 공백을 치환한다. -> 받아올떄도 똑같이 치환하여 받아와주어야함.
//		l.setLectureRecord(l.getLectureRecord().replaceAll("\n", "<br/>"));
		int result = lService.lectureApply(l);
		
		// alert창을 위해 1번만 보내주는 메소드(addFlashAttribute) 사용.
		ra.addFlashAttribute("successMsg", "강연 신청");
		
		return "redirect:lectureHistory.mp";
	}
	
	@ResponseBody
	@RequestMapping("lectureBuy.le")
	public int lectureBuy(@ModelAttribute Lecture l) {
		
		int result = lService.lectureBuy(l);
		int attendPlus = lService.lectureAttendPlus(l);
		
		if(result > 0 && attendPlus > 0) {
			return result;
		} else {
			throw new LectureException("지점 전체 조회에 실패하였습니다.");
		}
		
	}
}
