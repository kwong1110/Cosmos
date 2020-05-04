package com.kh.cosmos.d_adminPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonIOException;
import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.Pagination;
import com.kh.cosmos.d_adminPage.model.exception.AdminPageException;
import com.kh.cosmos.d_adminPage.model.service.ReportService;
import com.kh.cosmos.d_adminPage.model.vo.Report;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

@Controller
public class ReportController {

	@Autowired
	private ReportService rService;
	
	@RequestMapping("reportApply.ap")
	public String Report() {
		return null;
	}
	
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
		
	
	@ResponseBody
	@RequestMapping("reportInsert.ap")
	public int reportInsert(@ModelAttribute Report rp, HttpServletResponse response,@RequestParam("userId") String userId, @RequestParam("reason") int reason, @RequestParam("targetId") String targetId, @RequestParam("reasonText") String reasonText) throws JsonIOException, IOException {
		
		rp.setMid(userId);
		rp.setReportReason(reason);
		rp.setReportMid(targetId);
		
		int result = rService.reportInsert(rp);
		
		
		return result;
	}
	
}
