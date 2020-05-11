package com.kh.cosmos.c_myPage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.Pagination;
import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.c_myPage.model.service.LectureHistoryService;
import com.kh.cosmos.i_lecture.model.exception.LectureException;
import com.kh.cosmos.i_lecture.model.vo.Lecture;

@Controller
public class LectureHistoryController {

	@Autowired
	private LectureHistoryService lhService;
	
	@RequestMapping("lectureHistory.mp")
	public String lectureApplyGuide(Model model, @RequestParam(value="page", required=false) Integer page, 
									HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String loginUserId = loginUser.getId();

		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = lhService.getListCount(loginUserId);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);


		ArrayList<Lecture> list = lhService.selectList(pi, loginUserId);
		//System.out.println(list);
		if(list != null) {
			model.addAttribute("lList", list);
			model.addAttribute("pi", pi);
			return "myPage/lectureHistory";
		} else {
			throw new LectureException("나의 강연 전체 조회에 실패하였습니다.");
		}
	}
}
