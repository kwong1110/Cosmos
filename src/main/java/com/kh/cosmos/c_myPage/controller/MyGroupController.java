package com.kh.cosmos.c_myPage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
import com.kh.cosmos.c_myPage.model.service.MyGroupService;
import com.kh.cosmos.f_studyGroup.model.vo.MyStudyGroup;

@Controller
public class MyGroupController {
	
	@Autowired
	private MyGroupService mgService;
	
	@RequestMapping("myGroup.mp")
	public String myGroupView(HttpServletRequest request, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
//		HttpSession session = request.getSession();
//		String id = ((Member)session.getAttribute("loginUser")).getId();
//		
//		int currentPage = 1;
//		if(page != null) {
//			currentPage = page;
//		}
//		int listCount = mgService.getMemberListCount(id) + mgService.getBossListCount(id);
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
//		
//		ArrayList<StudyGroup> groupList = mgService.getMyGroup(id);
//		
//		if(groupList != null) {
//			LinkedHashMap<StudyGroup, String> groupMap = null;
//			for(int i = 0; i < groupList.size(); i++) {
//				int 
//				groupMap.keySet(groupList.get(i));                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
//			}
//		}
		
		//참가신청한 그룹 먼저 가져오고 맞춰서 그룹 정보를 가져와야될 듯

//		ArrayList<String> approachGroupList = mgService.getApproachGroupList();
//		ArrayList<StudyGroup/*그룹,그룹참가 섞인 vo*/> GroupList = mgService.getGroupList();
		//-> 조인한 vo를 가져오니까 모든정보가 있을거니까 순서는 그룹참가테이블의 기본키를 기준으로하면 모두 순서대로 나오겠찌
		//   그리고 옵션을 선택하면 그룹참가의 상태가 수락인 걸 기준으로 보여주기.
		//   -> 그럼 페이지 리스트도 에이작스로 짤지 파라미터로 짤지..
		//      에이작스로 짜면 페이징도 에이작스로 해야돼 에이작스 데이터속성으로 요청페이지같은 받아야될 데이터 보내면 되긴할텐데
		
		
		return "/myPage/myGroup";
	}
	
	@RequestMapping("groupList.mp")
	public void getMyGroupList(HttpServletResponse response, @RequestParam("userId") String userId, @RequestParam("triger") String triger,
								@RequestParam("category") String category, @RequestParam(value="page", required=false) Integer page) throws JsonIOException, IOException {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("triger", triger);
		map.put("category", category);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mgService.getMemberListCount(map) + mgService.getBossListCount(map);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<MyStudyGroup/*그룹,그룹참가 섞인 vo*/> groupList = mgService.getGroupList(map, pi);
		
		for(MyStudyGroup g : groupList) {
			g.setSgName(URLEncoder.encode(g.getSgName(), "UTF-8"));
			g.setSgStatus(URLEncoder.encode(g.getSgStatus(), "UTF-8"));
			g.setStudyName(URLEncoder.encode(g.getStudyName(), "UTF-8"));
			if(g.getUserId() != null) g.setUserId(URLEncoder.encode(g.getUserId(), "UTF-8"));
			g.setId(URLEncoder.encode(g.getId(), "UTF-8"));
			g.setNick(URLEncoder.encode(g.getNick(), "UTF-8"));
		}
		
		if(groupList != null) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(groupList, response.getWriter());
		} else {
			throw new MyPageException("마이 그룹 리스트를 불러오지 못했습니다.");
		}
	}

	@RequestMapping("groupListPage.mp")
	public void getMyGroupListPage(HttpServletResponse response, @RequestParam("userId") String userId, @RequestParam("triger") String triger,
									@RequestParam("category") String category, @RequestParam(value="page", required=false) Integer page) throws JsonIOException, IOException {

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("triger", triger);
		map.put("category", category);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mgService.getMemberListCount(map) + mgService.getBossListCount(map);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		if(pi != null) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(pi, response.getWriter());
		} else {
			throw new MyPageException("마이 그룹 리스트의 페이지 정보를 불러오지 못했습니다.");
		}
	}
	
	@RequestMapping("getGroupMember.mp")
	public void getGroupModal(HttpServletResponse response, @RequestParam("sgno") int sgno) throws JsonIOException, IOException {
		ArrayList<MyStudyGroup> memberList = mgService.getMemberList(sgno);

		for(MyStudyGroup g : memberList) {
			g.setNick(URLEncoder.encode(g.getNick(), "UTF-8"));
		}
		
		if(memberList != null) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(memberList, response.getWriter());
		} else {
			throw new MyPageException("마이그룹의 모달 정보(그룹원)를 불러오지 못했습니다.");
		}
	}
	
	@RequestMapping("getGroupRec.mp")
	public void getBossGroupModal(HttpServletResponse response, @RequestParam("sgno") int sgno) throws JsonIOException, IOException {
		ArrayList<MyStudyGroup> recList = mgService.getRecList(sgno);
		
		if(recList != null) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(recList, response.getWriter());
		} else {
			throw new MyPageException("마이그룹의 모달 정보(모집)를 불러오지 못했습니다.");
		}
	}
	
	@RequestMapping("deleteMember.mp")
	public void deleteMember(HttpServletResponse response, @RequestParam("sgno") String sgno, @RequestParam("id") String id) throws JsonIOException, IOException {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sgno", sgno);
		map.put("id", id);
		
		int result = mgService.deleteMember(map);
		
		if(result > 0) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson("success", response.getWriter());
		} else {
			throw new MyPageException("그룹원 강퇴에 실패하였습니다.");
		}
	}
}
