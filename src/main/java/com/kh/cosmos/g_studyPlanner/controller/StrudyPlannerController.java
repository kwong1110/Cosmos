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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.Pagination;
import com.kh.cosmos.a_common.Reply;
import com.kh.cosmos.a_common.SearchCondition;
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
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String loginUserId = loginUser.getId();
		
		ArrayList<StudyPlanner> pList = spService.selectList(loginUserId);
		// System.out.println("list 확인 : " + list);
		
		// 전체 스터디카테고리 불러오기
		ArrayList<StudyCategory> sList = mService.selectStudyCategoryList(sc);
		// 로그인한 유저의 전체 카테고리 불러오기
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

		String startDate = fullDate[0];
		String endDate = fullDate[1];

		// 끝날짜와 시작날짜를 Date->String으로 바꾼 후 시간 까지 같이 저장.
		//String startTime = fullDate[0].split(" ")[1];
		//String endTime = fullDate[1].split(" ")[1];
		
//		Date startDateSql = Date.valueOf(startDate);
//		Date endDateSql = Date.valueOf(endDate);
//		System.out.println("sql] start : " + startDateSql + " end : " + endDateSql);
		
		sp.setPlanStart(startDate);
		sp.setPlanEnd(endDate);
		
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
			sp.setPlanMemo(URLEncoder.encode(sp.getPlanMemo(), "UTF-8"));
			
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
		
		// System.out.println(sp);
		System.out.println(daterange);
		
		String[] fullDate = daterange.split(" - ");

		String startDate = fullDate[0];
		String endDate = fullDate[1];

		// 끝날짜와 시작날짜를 Date->String으로 바꾼 후 시간 까지 같이 저장.
		//String startTime = fullDate[0].split(" ")[1];
		//String endTime = fullDate[1].split(" ")[1];
		
//		Date startDateSql = Date.valueOf(startDate);
//		Date endDateSql = Date.valueOf(endDate);
//		System.out.println("sql] start : " + startDateSql + " end : " + endDateSql);
		
		sp.setPlanStart(startDate);
		sp.setPlanEnd(endDate);
		
		System.out.println("담긴 후 sp : " + sp);
		
		int result = spService.updatePlan(sp);
		
		if(result > 0){
			ra.addFlashAttribute("successMsg", "플래너 수정 성공");
			
			return "redirect:myPlannerList.sp";
		} else {
			throw new StudyPlannerException("플래너 수정에 실패했습니다");
		}
	}
	
	@RequestMapping("allPlannerList.sp")
	public String allPlannerList(Model model, @ModelAttribute StudyCategory sc, HttpSession session,
								 @RequestParam(value="page", required=false) Integer page) {
		
		// 전체 스터디카테고리 불러오기
		ArrayList<StudyCategory> sList = mService.selectStudyCategoryList(sc);
		
		// 로그인한 유저의 전체 카테고리 불러오기
		if((Member)session.getAttribute("loginUser") != null) {
			
			Member loginUser = (Member)session.getAttribute("loginUser");
			String loginUserId = loginUser.getId();
			
			ArrayList<Preview> userStudyList = mpService.getStudyList(loginUserId);
			
			model.addAttribute("userStudyList", userStudyList);
		}
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = spService.getAllListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<StudyPlanner> pList = spService.selectAllList(pi);
		
		if(pList != null) {
			model.addAttribute("pList", pList);
			model.addAttribute("sList", sList);
			model.addAttribute("pi", pi);
			return "/allPlanner/allPlannerList";
		} else {
			throw new StudyPlannerException("모두의 플래너 전체 조회에 실패하였습니다.");
		}
	}
	
	@RequestMapping("replyList.sp")
	public void getReplyList(HttpServletResponse response, @RequestParam("planNo") String planNo) throws JsonIOException, IOException {
		ArrayList<Reply> rList = spService.selectReplyList(Integer.parseInt(planNo));
		
		for(Reply r : rList) {
			r.setReplyContent(URLEncoder.encode(r.getReplyContent(), "UTF-8"));
			r.setNickName(URLEncoder.encode(r.getNickName(), "UTF-8"));
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(rList, response.getWriter());
	}
	
	@RequestMapping("addReply.sp")
	@ResponseBody
	public String addReply(Reply r, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String Writer = loginUser.getId();
		
		r.setId(Writer);

		int result = spService.insertReply(r);
		
		if(result > 0) {
			return "successReplyInsert";
		} else {
			throw new StudyPlannerException("댓글 등록에 실패하였습니다.");
		}
	}
	
	@RequestMapping("updateReply.sp")
	@ResponseBody
	public String updateReply(Reply r) {
		
		int result = spService.updateReply(r);
		
		if(result > 0) {
			return "successReplyUpdate";
		} else {
			throw new StudyPlannerException("댓글 수정에 실패하였습니다.");
		}
	}
	
	@RequestMapping("deleteReply.sp")
	@ResponseBody
	public String deleteReply(Reply r) {
		
		int result = spService.deleteReply(r);
		
		if(result > 0) {
			return "successReplyDelete";
		} else {
			throw new StudyPlannerException("댓글 수정에 실패하였습니다.");
		}
	}
	
	@RequestMapping("addReReply.sp")
	@ResponseBody
	public String addReReply(Reply r, HttpSession session, @RequestParam("reReplyOn") String reReplyOn) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String Writer = loginUser.getId();
		
		r.setId(Writer);
		
		
		// 만약 답글에 1개의 답글이 더 있을 경우 order(순서)를 바꿔주어야 한다.
		if(r.getReGrpOrder() == 0 && !reReplyOn.equals("reReplyOn")) {
			int orderResult = spService.updateReplyOrder(r);
		}
		
		// 답글에 답글일 경우
		if(reReplyOn.equals("reReplyOn")) {
			// insert시 order를 +1를 해주니까 대댓글에서는 -1을해주어야함
			int reReplyResult = spService.updateReReplyOrder(r);
			r.setReGrpOrder(r.getReGrpOrder()-1);
		}

		int result = spService.insertReReply(r);
		
		if(result > 0) {
			return "successReReplyInsert";
		} else {
			throw new StudyPlannerException("댓글 등록에 실패하였습니다.");
		}
	}
	
	@RequestMapping("searchPlanner.sp")
	public String searchPlanner(@RequestParam("searchType") String searchType, @RequestParam("searchText") String searchText,
								SearchCondition sc, @RequestParam(value="page", required=false) Integer page,  @ModelAttribute StudyCategory studyC,
								Model model) {
		// 전체 스터디카테고리 불러오기
		ArrayList<StudyCategory> sList = mService.selectStudyCategoryList(studyC);
		
		
		if(searchType.equals("writer")) {
			sc.setWriter(searchText);
		} else if(searchType.equals("title")) {
			sc.setTitle(searchText);
		} else if(searchType.equals("content")) {
			sc.setContent(searchText);
		}
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = spService.getSearchResultListCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<StudyPlanner> pList = spService.selectSearchResultList(pi, sc);
		
		System.out.println("검색 후 pList" + pList);
		if(pList != null) {
			model.addAttribute("pList", pList);
			model.addAttribute("sList", sList);
			model.addAttribute("pi", pi);

			model.addAttribute("searchType", searchType);
			model.addAttribute("searchText", searchText);
			
			return "/allPlanner/allPlannerList";
		} else {
			throw new StudyPlannerException("모두의 플래너 검색 조회에 실패하였습니다.");
		}
	}
}
