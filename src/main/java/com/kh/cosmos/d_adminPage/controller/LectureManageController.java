package com.kh.cosmos.d_adminPage.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.Pagination;
import com.kh.cosmos.b_member.model.service.MemberService;
import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.d_adminPage.model.service.LectureManageService;
import com.kh.cosmos.i_lecture.model.exception.LectureException;
import com.kh.cosmos.i_lecture.model.vo.Lecture;

@Controller
public class LectureManageController {
	
	@Autowired
	private LectureManageService lmService;
	
	@RequestMapping("lectureManage.ap")
	public String lectureManageList(Model model, @RequestParam(value="page", required=false) Integer page,
									   Member m, @RequestParam(value="lNo", required=false) Integer lNo) {
		// 페이징 및 리스트 불러오기
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = lmService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Lecture> list = lmService.lectureManageList(pi);
		
		// 상세보기
		if(lNo != null) {
			Lecture l = lmService.selectLecture(lNo);
			System.out.println(l.getId());
			m.setId(l.getId());
			Member lectureUser = lmService.selectLectureUser(m);
			model.addAttribute("l", l);
			model.addAttribute("lectureUser", lectureUser);
			if( l == null || lectureUser == null) {
				throw new LectureException("강연 상세 조회에 실패하였습니다.");
			}
		} 
		
		
		
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			return "lectureManage";
		} else {
			throw new LectureException("강연 전체 조회에 실패하였습니다.");
		}
	}
	
	@RequestMapping("lectureManageDetail.ap")
	public String lectureManageDetail(@RequestParam("lNo") Integer lNo) {
		return "lectureManage";
	}
}
