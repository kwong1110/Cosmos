package com.kh.cosmos.h_viewBranch.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.Pagination;
import com.kh.cosmos.h_viewBranch.model.exception.ViewBranchException;
import com.kh.cosmos.h_viewBranch.model.service.ViewBranchService;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;
import com.kh.cosmos.h_viewBranch.model.service.ViewBranchService;

@Controller
public class ViewBranchController {
	
	@Autowired
	private ViewBranchService vbService;
	
	@RequestMapping("viewBranchList.vb")
	public ModelAndView branchList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv){
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = vbService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<ViewBranch> vbList = vbService.selectBranchList(pi);
		
		if(vbList != null) {
			mv.addObject("vbList", vbList);
			mv.addObject("pi", pi);
			mv.setViewName("viewBranchList");
		} else {
			throw new ViewBranchException("지점 리스트 조회에 실패하였습니다.");
		}
		return mv;
		
	}
	
	@RequestMapping("viewBranchDetail.vb")
	public ModelAndView branchDetail(@RequestParam("vbNo") int vbNo, @RequestParam("page") int page, ModelAndView mv) {
		
		ViewBranch vBranch = vbService.selectBranch(vbNo);
		System.out.println(vBranch);
		
		if(vBranch != null) {
			
			mv.addObject("vBranch", vBranch)
			  .addObject("page", page)
			  .setViewName("viewBranchDetail");
		} else {
			throw new ViewBranchException("지점 조회에 실패하였습니다.");
		}
		 
		return mv ;
	}
}
