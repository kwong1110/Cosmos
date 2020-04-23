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
	
	@RequestMapping("getRecList.sg")
	public void getRecList(HttpServletResponse response, @RequestParam(value="page", required=false) Integer page) throws JsonIOException, IOException {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = sgService.getRecListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<StudyGroupRecruit> recList = sgService.getRecList(pi);
		
		if(recList != null) {
			for(StudyGroupRecruit r : recList) {
				r.setSgName(URLEncoder.encode(r.getSgName(), "UTF-8"));
				r.setStudyName(URLEncoder.encode(r.getStudyName(), "UTF-8"));
				r.setSgGoal(URLEncoder.encode(r.getSgGoal(), "UTF-8"));
				r.setSgContent(URLEncoder.encode(r.getSgContent(), "UTF-8"));
				r.setNick(URLEncoder.encode(r.getNick(), "UTF-8"));
				r.setBranchName(URLEncoder.encode(r.getBranchName(), "UTF-8"));
				
				int partNum = sgService.getRecCompleteNum(r.getRecNo());
				r.setPartNum(partNum);
			}
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(recList, response.getWriter());
		} else {
			throw new StudyGroupException("그룹 리스트를 불러오지 못했습니다.");
		}
	}
	
	@RequestMapping("getPaging.sg")
	public void getPaging(HttpServletResponse response, @RequestParam(value="page", required=false) Integer page) throws JsonIOException, IOException {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = sgService.getRecListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		if(pi != null) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(pi, response.getWriter());
		} else {
			throw new StudyGroupException("그룹 리스트 페이징을 불러오지 못했습니다.");
		}
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
		
		for(int i = 0; i < sgList.size(); i++) {
			int ingRecCount = sgService.getIngRecCount(sgList.get(i).getSgNo());
			
			if(ingRecCount > 0) {
				sgList.remove(i);
			}
		}
		
		mv.addObject("sgList", sgList);
		mv.setViewName("recruitInsert");
		
		return mv;
	}
	
	@RequestMapping("getStudyGroupInfo.sg")
	public void getStudyGroupInfo(HttpServletResponse response, @RequestParam("sgno") int sgno) throws JsonIOException, IOException {
		
		StudyGroupRecruit info = sgService.getGroupInfoForRec(sgno);
		int partNum = sgService.getPartMemberNum(sgno);
		//System.out.println("partNum : " + partNum);
		
		if(info != null) {
			info.setStudyName(URLEncoder.encode(info.getStudyName(), "UTF-8"));
			info.setBranchName(URLEncoder.encode(info.getBranchName(), "UTF-8"));
			info.setMsgMetRule(URLEncoder.encode(info.getMsgMetRule(), "UTF-8"));
			info.setSgGoal(URLEncoder.encode(info.getSgGoal(), "UTF-8"));
			info.setMsgRule1(URLEncoder.encode(info.getMsgRule1(), "UTF-8"));
			if(info.getMsgRule2() != null) info.setMsgRule2(URLEncoder.encode(info.getMsgRule2(), "UTF-8"));
			if(info.getMsgRule3() != null) info.setMsgRule3(URLEncoder.encode(info.getMsgRule3(), "UTF-8"));
			info.setSgContent(URLEncoder.encode(info.getSgContent(), "UTF-8"));
			
			info.setMsgNum(info.getMsgNum() - partNum);
			//System.out.println("msgNum - partNum : " + info.getMsgNum());
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(info, response.getWriter());
		} else {
			throw new StudyGroupException("그룹 리스트(selectBox)를 불러오지 못했습니다.");
		}
	}
	
	@RequestMapping("insertRecruit.sg")
	public String insertRecruit(@ModelAttribute StudyRecruit info) {
		System.out.println(info);
		
		int result = sgService.insertRecruit(info);
		
		if(result > 0) {
			return "redirect:listView.sg";
		} else {
			throw new StudyGroupException("모집 등록에 실패하였습니다.");
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
	
	@RequestMapping("updateGroupView.sg")
	public ModelAndView UpdateGroupView(@RequestParam("sgno") int sgno, ModelAndView mv) {
		
		StudyGroup group = sgService.getStudyGroupInfo(sgno);
		
		if(group != null) {
			mv.addObject("group", group);
			mv.setViewName("updateGroup");
			return mv;
		} else {
			throw new StudyGroupException("그룹 수정 페이지 호출에 실패하였습니다.");
		}
	}
}
