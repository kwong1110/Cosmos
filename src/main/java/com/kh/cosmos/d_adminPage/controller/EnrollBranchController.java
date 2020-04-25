package com.kh.cosmos.d_adminPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cosmos.d_adminPage.model.exception.AdminPageException;
import com.kh.cosmos.d_adminPage.model.service.EnrollBranchService;
import com.kh.cosmos.d_adminPage.model.vo.Master;

@Controller
public class EnrollBranchController {
	
	@Autowired
	private EnrollBranchService ebService;

	@RequestMapping("enrollBranch.ap")
	public String EnrollBranchView() {
		
		return "EnrollBranchForm";
	}
	
/*	@RequestMapping("enrollBranch.ap")
	public ModelAndView BranchListView(ModelAndView mv) {
		
		ArrayList <Master> list = ebService.selectlist();
		
		if(list != null) {
		mv.addObject("branchList", branchList);
		mv.setViewName("BranchListView");
		} else {
			throw new AdminPageException("리스트 조회에 실패하였습니다.	");
		}
		return mv;
	}	
		*/
		

	
	
	@RequestMapping("branchList.ap")
	public String branchList() {
		return "BranchListView";
	}
	
	// 0423 지점명 중복 확인
	@RequestMapping("dupName.ap")
	public void nameDuplicateCheck(HttpServletResponse response, @RequestParam("masterName") String masterName) throws IOException {
		
		boolean isUsable =ebService.checkNameDup(masterName) == 0 ? true : false;
		response.getWriter().print(isUsable);
	} 
	
}
