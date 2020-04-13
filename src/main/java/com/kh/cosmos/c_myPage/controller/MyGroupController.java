package com.kh.cosmos.c_myPage.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.Pagination;
import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.c_myPage.model.service.MyGroupService;
import com.kh.cosmos.f_studyGroup.model.vo.StudyGroup;

@Controller
public class MyGroupController {
	
	@Autowired
	private MyGroupService mgService;
	
	@RequestMapping("myGroup.mp")
	public String myGroupView(HttpServletRequest request, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		HttpSession session = request.getSession();
		String id = ((Member)session.getAttribute("loginUser")).getId();
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = mgService.getMemberListCount(id) + mgService.getBossListCount(id);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
//		ArrayList<StudyGroup> groupList = mgService.getMyGroup(id);
//		
//		if(groupList != null) {
//			LinkedHashMap<StudyGroup, String> groupMap = null;
//			for(int i = 0; i < groupList.size(); i++) {
//				int 
//				groupMap.keySet(groupList.get(i));                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
//			}
//		}
		
		return "/myPage/myGroup";
	}
}
