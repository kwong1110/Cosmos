package com.kh.cosmos.d_adminPage.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.d_adminPage.model.exception.AdminPageException;
import com.kh.cosmos.d_adminPage.model.service.EnrollBranchService;
import com.kh.cosmos.d_adminPage.model.vo.Master;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

@Controller
public class EnrollBranchController {
	
	@Autowired
	private EnrollBranchService ebService;

	@RequestMapping("enrollBranch.ap")
	public String EnrollBranchView() {
		
		return "EnrollBranchForm";
	}
	
	@RequestMapping("binsert.ap")
	public String MasterInsert(@ModelAttribute ViewBranch vr,@ModelAttribute Master ma, @ModelAttribute Member me,
														 @RequestParam("post") String post,
														 @RequestParam("address1") String address1,
														 @RequestParam("address2") String address2) {
		
		vr.setBranchAddress(post + "/" + address1 + "/" + address2);
		
		System.out.println( "---------------------------------------------");
		System.out.println("vr ----> ");
		System.out.println(vr);
		System.out.println("ma ----> ");
		System.out.println(ma);
		System.out.println("me ----> ");
		System.out.println(me);
		System.out.println( "---------------------------------------------");
		
		int result = ebService.insertMaster(vr);
		
		if(result > 0) {
			return "redirect:home.do";
		} else {
			throw new AdminPageException("지점 등록에 실패하였습니다.");
		}
	}
	

	
	
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
