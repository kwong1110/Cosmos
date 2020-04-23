package com.kh.cosmos.d_adminPage.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

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
import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.Pagination;
import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.d_adminPage.model.service.LectureManageService;
import com.kh.cosmos.i_lecture.model.exception.LectureException;
import com.kh.cosmos.i_lecture.model.vo.Lecture;

@Controller
public class LectureManageController {
	
	@Autowired
	private LectureManageService lmService;
	
	@RequestMapping("lectureManage.ap")
	public String lectureManageList(Model model, @RequestParam(value="page", required=false) Integer page) {
		// 페이징 및 리스트 불러오기
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = lmService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Lecture> list = lmService.lectureManageList(pi);
		
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			return "lectureManage";
		} else {
			throw new LectureException("강연 전체 조회에 실패하였습니다.");
		}
	}
	
	@RequestMapping("lectureManageDetail.ap")
	@ResponseBody
	public void lectureManageDetail(@RequestParam("lNo") Integer lNo, Member m,
									  HttpServletResponse response) throws IOException {
		
		Lecture l = lmService.selectLecture(lNo);
		
		m.setId(l.getId());
		Member lectureUser = lmService.selectLectureUser(m);
		
		l.setPhone(lectureUser.getPhone());
		l.setEmail(lectureUser.getEmail());
		
		if( l != null && lectureUser != null) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			
			l.setLectureRecord(URLEncoder.encode(l.getLectureRecord(), "UTF-8"));
			l.setLectureTitle(URLEncoder.encode(l.getLectureTitle(), "UTF-8"));
			l.setLectureContent(URLEncoder.encode(l.getLectureContent(), "UTF-8"));
			l.setBranchName(URLEncoder.encode(l.getBranchName(), "UTF-8"));
			l.setLectureJob(URLEncoder.encode(l.getLectureJob(), "UTF-8"));
			l.setName(URLEncoder.encode(l.getName(), "UTF-8"));
			
			gson.toJson(l, response.getWriter());
		} else {
			throw new LectureException("강연 상세 조회에 실패하였습니다.");
		}
	}
	
	@RequestMapping("lectureUpdate.ap")
	public String lectureUpdate(Model model, @RequestParam("lNo") String lNo, 
								@ModelAttribute Lecture l, @RequestParam("returnRoot") String returnRoot,
								RedirectAttributes ra) {
		
		l.setLectureNo(Integer.parseInt(lNo));
		// System.out.println(l.getLectureNo() + l.getLectureStatus());
				
		int result = lmService.updateLecture(l);
		
		if(result > 0) {
			
			String successMsg = "";
			switch(l.getLectureStatus()) {
			case "OPEN": successMsg = "수락"; break;
			case "CLOSE": successMsg = "정원초과"; break;
			case "REJECT": successMsg = "<span style='color:#ff0000'>거절<span>"; break;
			case "DELETE": successMsg = "삭제"; break;
			}
			
			ra.addFlashAttribute("successMsg", successMsg);
			
			return "redirect:" + returnRoot;
		} else {
			throw new LectureException("강연 전체 조회에 실패하였습니다.");
		}
	}
}
