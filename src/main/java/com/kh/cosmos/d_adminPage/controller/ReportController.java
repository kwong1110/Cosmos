package com.kh.cosmos.d_adminPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonIOException;
import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.Pagination;
import com.kh.cosmos.b_member.model.service.MemberService;
import com.kh.cosmos.d_adminPage.model.exception.AdminPageException;
import com.kh.cosmos.d_adminPage.model.service.ReportService;
import com.kh.cosmos.d_adminPage.model.vo.Report;

@Controller
public class ReportController {

	@Autowired
	private ReportService rService;
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("reportApply.ap")
	public String Report() {
		return null;
	}
	// 신고목록 조회
	@RequestMapping("reportList.ap")
	public ModelAndView ReportList(ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = rService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Report> list = rService.reportList(pi);
		
		if(list != null) {	
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("listCount", listCount);
			mv.setViewName("reportList");
		} else {
			throw new AdminPageException("신고목록 조회에 실패하였습니다.");
		}
		return mv;
	}
		
	// 신고등록
	@ResponseBody
	@RequestMapping("reportInsert.ap")
	public int reportInsert(@ModelAttribute Report rp, HttpServletResponse response) throws JsonIOException, IOException {
		
		// @RequestParam("userId") String userId, @RequestParam("reason") int reason, @RequestParam("targetId") String targetId, @RequestParam("reasonText") String reasonText
		//rp.setMid(userId);
		//rp.setReportReason(reason);
		//rp.setReportMid(targetId);
	
		// System.out.println("rp확인 : " + rp);
		
		int result = rService.reportInsert(rp);
		
		
		return result;
	}
	// 신고삭제
	@RequestMapping("reportDelete.rp")
	public String reportDelete(@RequestParam ("no") int no) {
		
		System.out.println("no임" + no);
		
		int result = rService.delete(no);
				
		
		
		return "redirect:reportList.ap";
	}
	
	// 금지회원
	@RequestMapping("ban.rp")
	public String ban(@RequestParam ("no") int no, @RequestParam("memberId") String reportMid){
		
		
		int result = rService.ban(no);

		int res = mService.ban(reportMid);
		
		return "redirect:reportList.ap";
	}
}
