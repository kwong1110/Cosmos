package com.kh.cosmos.d_adminPage.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.cosmos.b_member.model.service.MemberService;
import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.d_adminPage.model.exception.AdminPageException;
import com.kh.cosmos.d_adminPage.model.service.EnrollBranchService;
import com.kh.cosmos.d_adminPage.model.vo.Master;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

@Controller
public class EnrollBranchController {
	
	@Autowired
	private EnrollBranchService ebService;

	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@RequestMapping("enrollBranch.ap")
	public String EnrollBranchView() {
		
		return "EnrollBranchForm";
	}
	
	@RequestMapping("binsert.ap")
	public String MasterInsert(@ModelAttribute ViewBranch vr,@ModelAttribute Master m, @ModelAttribute Member me,
														 @RequestParam("post") String post,
														 @RequestParam("address1") String address1,
														 @RequestParam("address2") String address2,
														 @RequestParam("tel1") String tel1,
														 @RequestParam("tel2") String tel2,
														 @RequestParam("tel3") String tel3) {
		
		vr.setBranchAddress( address1  + address2);
		vr.setBranchTel( tel1 + tel2 + tel3);
		
		
		ebService.insertBranch(vr); // 먼저 view branch먼저 insert 해주기
		ebService.insertMaster(m);  // 그다음으로 Master insert
		
		int result = ebService.insertMember(me);  // 그다음으로 기본키가 있는 member를 insert 하고 result 에 담아서 , 	
												  // result 가 0 보다 클 때 
		if(result > 0) {
			Member member = mService.findMember();
			System.out.println(member);
			String lastPwd = bcryptPasswordEncoder.encode(member.getPwd());
			System.out.println("-------------------------------------");
			System.out.println(lastPwd);
			System.out.println("-------------------------------------");
			
			member.setPwd(lastPwd);
			
			int res = mService.fakePwd(member);
			
			System.out.println("branch : " + vr);
			System.out.println("member : " + member);
			System.out.println("master :" + m);
			
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
