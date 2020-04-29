package com.kh.cosmos.g_studyPlanner.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.cosmos.b_member.model.service.MemberService;
import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.b_member.model.vo.Preview;
import com.kh.cosmos.b_member.model.vo.StudyCategory;
import com.kh.cosmos.c_myPage.model.service.MyPageService;
import com.kh.cosmos.g_studyPlanner.model.exception.StudyPlannerException;
import com.kh.cosmos.g_studyPlanner.model.service.StudyPlannerService;
import com.kh.cosmos.g_studyPlanner.model.vo.StudyPlanner;

@Controller
public class StrudyPlannerController {

	@Autowired
	private StudyPlannerService spService;
	
	@Autowired
	private MyPageService mpService;
	
	@Autowired
	private MemberService mService;
	
	
	@RequestMapping("myPlannerList.sp")
	public String myPlannerList(Model model, @ModelAttribute StudyCategory sc, HttpSession session) {
		
		ArrayList<StudyPlanner> pList = spService.selectList();
		// System.out.println("list 확인 : " + list);
		
		// 전체 스터디카테고리 불러오기
		ArrayList<StudyCategory> sList = mService.selectStudyCategoryList(sc);
		// 로그인한 유저의 전체 카테고리 불러오기
		Member loginUser = (Member)session.getAttribute("loginUser");
		String loginUserId = loginUser.getId();
		ArrayList<Preview> userStudyList = mpService.getStudyList(loginUserId);
		
		if(pList != null) {
			model.addAttribute("pList", pList);
			model.addAttribute("sList", sList);
			model.addAttribute("userStudyList", userStudyList);
			return "/myPlanner/myPlannerList";
		} else {
			throw new StudyPlannerException("나의 플래너 전체 조회에 실패하였습니다.");
		}
	}
	
	@RequestMapping("todayCheck.sp")
	public void todayCheck(HttpServletResponse response, @ModelAttribute StudyPlanner sp) {
		//System.out.println(sp);
		int result = spService.todayCheck(sp);
		
		if(result <= 0) {
			throw new StudyPlannerException("오늘의 할일 체크에 실패했습니다");
		}
	}
	
	@RequestMapping("planInsert.sp")
	public String planInsert(@ModelAttribute StudyPlanner sp, @RequestParam("daterange") String daterange, 
							Model model, RedirectAttributes ra) {
		// System.out.println("sp확인 : " + sp);
		
		String[] fullDate = daterange.split(" - ");

		String startDate = fullDate[0].split(" ")[0];
		String startTime = fullDate[0].split(" ")[1];
		String endDate = fullDate[1].split(" ")[0];
		String endTime = fullDate[1].split(" ")[1];
		
		Date startDateSql = Date.valueOf(startDate);
		Date endDateSql = Date.valueOf(endDate);
		// System.out.println("sql] start : " + startDateSql + " end : " + endDateSql);
		
		sp.setPlanStart(startDateSql);
		sp.setPlanEnd(endDateSql);
		//sp.setTime(startTime + "~" + endTime);
		
		// System.out.println("날짜 담긴 후 sp 확인 : " + sp);
		int result = spService.insertPlan(sp);
		
		ra.addFlashAttribute("successMsg", "플래너 등록 성공");
		
		if(result > 0) {
			return "redirect:myPlannerList.sp";
		} else {
			throw new StudyPlannerException("플래너 등록에 실패했습니다");
		}
	}
	
	@RequestMapping("planDetail.sp")
	public void planDetail(@RequestParam("planNo") String planNo, HttpServletResponse response) throws JsonIOException, IOException {
		
		StudyPlanner sp = spService.selectPlan(Integer.parseInt(planNo));
		
		if(sp != null) {
			
			sp.setPlanTitle(URLEncoder.encode(sp.getPlanTitle(), "UTF-8"));
			sp.setPlanContent(URLEncoder.encode(sp.getPlanContent(), "UTF-8"));
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(sp, response.getWriter());
		} else {
			throw new StudyPlannerException("플래너 상세조회에 실패했습니다");
		}
	}
	
	@RequestMapping("deletePlan.sp")
	public void deletePlan(@RequestParam("planNo") String planNo, HttpServletResponse response) throws JsonIOException, IOException {
		
		int result = spService.deletePlan(Integer.parseInt(planNo));
		
		if(result > 0) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(result, response.getWriter());
		} else {
			throw new StudyPlannerException("플래너 삭제에 실패했습니다");
		}
	}
	
	@RequestMapping("updatePlan.sp")
	public String updatePlan(@ModelAttribute StudyPlanner sp, Model model, 
							 RedirectAttributes ra, @RequestParam("daterange") String daterange) {
		
		System.out.println(sp);
		System.out.println(daterange);
		
		String[] fullDate = daterange.split(" - ");

		String startDate = fullDate[0].split(" ")[0];
		String startTime = fullDate[0].split(" ")[1];
		String endDate = fullDate[1].split(" ")[0];
		String endTime = fullDate[1].split(" ")[1];
		
		Date startDateSql = Date.valueOf(startDate);
		Date endDateSql = Date.valueOf(endDate);
		System.out.println("sql] start : " + startDateSql + " end : " + endDateSql);
		
		sp.setPlanStart(startDateSql);
		sp.setPlanEnd(endDateSql);
		
		System.out.println("담긴 후 sp : " + sp);
		
		int result = spService.updatePlan(sp);
		
		if(result > 0){
			ra.addFlashAttribute("successMsg", "플래너 수정 성공");
			
			return "redirect:myPlannerList.sp";
		} else {
			throw new StudyPlannerException("플래너 수정에 실패했습니다");
		}
	}
}
