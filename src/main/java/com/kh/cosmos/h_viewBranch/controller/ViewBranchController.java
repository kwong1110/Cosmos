package com.kh.cosmos.h_viewBranch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.Pagination;
import com.kh.cosmos.h_viewBranch.model.service.ViewBranchService;

@Controller
public class ViewBranchController {
	
	@Autowired
	private ViewBranchService vbService;
	
	@RequestMapping("branchList.vb")
	public ModelAndView branchList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv){
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = vbService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		mv.setViewName("viewBranchList");
		return mv;
		
	}
	
	
	
	@RequestMapping("branchForm.vb")
	public String branchForm() {
		
		return "viewBranchForm";
	}
}
