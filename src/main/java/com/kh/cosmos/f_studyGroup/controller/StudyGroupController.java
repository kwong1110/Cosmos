package com.kh.cosmos.f_studyGroup.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.Pagination;
import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.c_myPage.model.exception.MyPageException;
import com.kh.cosmos.f_studyGroup.model.exception.StudyGroupException;
import com.kh.cosmos.f_studyGroup.model.service.StudyGroupService;
import com.kh.cosmos.f_studyGroup.model.vo.MyStudyGroup;
import com.kh.cosmos.f_studyGroup.model.vo.StudyGroup;
import com.kh.cosmos.f_studyGroup.model.vo.StudyGroupRecruit;
import com.kh.cosmos.f_studyGroup.model.vo.StudyRecruit;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

@Controller
public class StudyGroupController {

	@Autowired
	private StudyGroupService sgService;
	
	@RequestMapping("listView.sg")
	public ModelAndView StudyGroupListView(ModelAndView mv) {
		ArrayList studyList = sgService.getStudyList();
		ArrayList<ViewBranch> branchList = sgService.getBranchList();
		
		
		mv.addObject("studyList", studyList);
		mv.addObject("branchList", branchList);
		mv.setViewName("studyGroupList");
		
		return mv;
	}
	
	@RequestMapping("insertGroupView.sg")
	public ModelAndView StudyGroupInsertView(ModelAndView mv) {
		ArrayList studyList = sgService.getStudyList();
		ArrayList<ViewBranch> branchList = sgService.getBranchList();
		
		mv.addObject("studyList", studyList);
		mv.addObject("branchList", branchList);
		mv.setViewName("studyGroupInsert");
		
		return mv;
	}
	
	@RequestMapping("insertGroup.sg")
	public String StudyGroupInsert(@ModelAttribute StudyGroup sg, @ModelAttribute StudyRecruit sr,
								   @RequestParam("studyName") String studyName, @RequestParam("loginUserId") String loginUserId) {
		sg.setStudyName(studyName);
		sg.setId(loginUserId);
		
		int result = sgService.insertGroup(sg);
		
		int result2 = 0;
		if(result > 0) {
			result2 = sgService.insertRecruit(sr);
		}
		
		if(result > 0 && result2 > 0) {
			return "studyGroupList";
		} else {
			throw new StudyGroupException("그룹 생성에 실패하였습니다.");
		}
	}

	@RequestMapping("insertRecView.sg")
	public ModelAndView RecruitInsertView(HttpServletRequest request, ModelAndView mv) {

		HttpSession session = request.getSession();
		String id = ((Member)session.getAttribute("loginUser")).getId();
		
		ArrayList<StudyGroup> sgList = sgService.getStudyGroupList(id);
		
		mv.addObject("sgList", sgList);
		mv.setViewName("recruitInsert");
		
		return mv;
	}
	
	@RequestMapping("getStudyGroupInfo.sg")
	public void getStudyGroupInfo(HttpServletResponse response, @RequestParam("sgno") int sgno) throws JsonIOException, IOException {
		
		StudyGroupRecruit info = sgService.getGroupInfoForRec(sgno);
		
		if(info != null) {
			info.setStudyName(URLEncoder.encode(info.getStudyName(), "UTF-8"));
			info.setBranchName(URLEncoder.encode(info.getBranchName(), "UTF-8"));
			info.setMsgMetRule(URLEncoder.encode(info.getMsgMetRule(), "UTF-8"));
			info.setSgGoal(URLEncoder.encode(info.getSgGoal(), "UTF-8"));
			info.setMsgRule1(URLEncoder.encode(info.getMsgRule1(), "UTF-8"));
			if(info.getMsgRule2() != null) info.setMsgRule2(URLEncoder.encode(info.getMsgRule2(), "UTF-8"));
			if(info.getMsgRule3() != null) info.setMsgRule3(URLEncoder.encode(info.getMsgRule3(), "UTF-8"));
			info.setSgContent(URLEncoder.encode(info.getSgContent(), "UTF-8"));
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(info, response.getWriter());
		} else {
			throw new StudyGroupException("마이그룹의 모달 정보(그룹원)를 불러오지 못했습니다.");
		}
	}

	@RequestMapping("recruitDetailView.sg")
	public ModelAndView RecruitDetailView(@RequestParam("sgno") int sgno, ModelAndView mv) {
		/*System.out.println(sgno);
		
		StudyGroupRecruit info = sgService.getStudyGroupRecruit(sgno);
		
		if(info != null) {
			mv.addObject("info", info);
			mv.setViewName("recruitDetail");
		} else {
			throw new StudyGroupException("그룹 조회에 실패하였습니다.");
		}*/

		mv.setViewName("recruitDetail");
		return mv;
	}
}
