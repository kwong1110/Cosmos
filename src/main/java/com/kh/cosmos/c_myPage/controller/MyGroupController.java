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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.Pagination;
import com.kh.cosmos.a_common.Pagination_five;
import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.c_myPage.model.exception.MyPageException;
import com.kh.cosmos.c_myPage.model.service.MyGroupService;
import com.kh.cosmos.c_myPage.model.vo.Note;
import com.kh.cosmos.f_studyGroup.model.service.StudyGroupService;
import com.kh.cosmos.f_studyGroup.model.vo.MyStudyGroup;
import com.kh.cosmos.f_studyGroup.model.vo.StudyGroup;

@Controller
public class MyGroupController {
	
	@Autowired
	private MyGroupService mgService;
	
	@RequestMapping("myGroup.mp")
	public String myGroupView(HttpServletRequest request, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		return "/myPage/myGroup";
	}
	
	@RequestMapping("groupList.mp")
	public void getMyGroupList(HttpServletResponse response, @RequestParam("userId") String userId, @RequestParam("triger") String triger,
								@RequestParam("category") String category, @RequestParam(value="page", required=false) Integer page,
								@RequestParam(value="searchType", required=false) String searchType, @RequestParam(value="searchText", required=false) String searchText) throws JsonIOException, IOException {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("triger", triger);
		map.put("category", category);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		String type = "";
		String text = "";
		if(searchType != null) {
			type = searchType;
			text = searchText;
		}
		map.put("type", type);
		map.put("text", text);
		
		int listCount = mgService.getMemberListCount(map) + mgService.getBossListCount(map);
		PageInfo pi = Pagination_five.getPageInfo(currentPage, listCount);
		
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
									@RequestParam("category") String category, @RequestParam(value="page", required=false) Integer page,
									@RequestParam(value="searchType", required=false) String searchType, @RequestParam(value="searchText", required=false) String searchText) throws JsonIOException, IOException {

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("triger", triger);
		map.put("category", category);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		String type = "";
		String text = "";
		if(searchType != null) {
			type = searchType;
			text = searchText;
		}
		map.put("type", type);
		map.put("text", text);
		
		int listCount = mgService.getMemberListCount(map) + mgService.getBossListCount(map);
		PageInfo pi = Pagination_five.getPageInfo(currentPage, listCount);
		
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
	
	@RequestMapping("closeRec.mp")
	public void CloseRecruit(HttpServletResponse response, @RequestParam("recno") int recno) throws JsonIOException, IOException {
		int result = mgService.closeRecruit(recno);
		
		if(result > 0) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson("success", response.getWriter());
		} else {
			throw new MyPageException("모집 마감에 실패하였습니다.");
		}
	}
}
