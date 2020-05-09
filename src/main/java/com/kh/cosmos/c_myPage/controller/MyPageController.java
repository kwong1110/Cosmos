package com.kh.cosmos.c_myPage.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.b_member.model.vo.Preview;
import com.kh.cosmos.b_member.model.vo.StudyCategory;
import com.kh.cosmos.c_myPage.model.exception.MyPageException;
import com.kh.cosmos.c_myPage.model.service.MyPageService;

@SessionAttributes("loginUser")
@Controller
public class MyPageController {
	
	@Autowired
		private MyPageService mpService;
	
	@Autowired
		private BCryptPasswordEncoder bcryptPasswordEncoder;
		
		// 마이페이지 이동
		@RequestMapping("myPage.mp")
		public String myPage(Model model) {
			
			Member loginUser = (Member)model.getAttribute("loginUser");
			String loginUserId = loginUser.getId();
			
			ArrayList<Preview> pList = mpService.getStudyList(loginUserId);
			System.out.println("pList : " + pList);
			// [Preview [id=user03, studyNo=97, spTerm=1년 이상 ~ 2년 이하, studyName=기타1, studyEtc=토플], Preview [id=user03, studyNo=1, spTerm=1년 이상 ~ 2년 이하, studyName=대학생 학점 관리, studyEtc=null]]
			
			if(pList != null) {
				model.addAttribute("pList", pList);
			}
			
			return "/myPage/myPage";
		}
		
		
		// 비밀번호 업데이트
		@RequestMapping("memberPwdUp.mp")
		public String mPwdUpdate(@ModelAttribute Member m, 
								 @RequestParam("newPwd1") String newPwd1, @RequestParam("newPwd2") String newPwd2, SessionStatus status, Model model) {
			
			Member loginUser = (Member)model.getAttribute("loginUser");
			
			if(bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())){
				
				String encPwd1 = bcryptPasswordEncoder.encode(newPwd1);
				
				if(bcryptPasswordEncoder.matches(newPwd2,  encPwd1)) {
					
					loginUser.setPwd(encPwd1);
					int result = mpService.updatePwd(loginUser);
					
					if(result > 0) {
						model.addAttribute("loginUser", loginUser);
						
						status.setComplete();
						
						return "redirect:/";
					} else {
						throw new MyPageException("비밀번호 수정에 실패했습니다.");
					}
				} else {
					throw new MyPageException("새 비밀번호를 다시 확인하세요.");
				}
			} else {
				throw new MyPageException("현재 비밀번호와 일치하지 않습니다.");
			}
		}
		
		// 회원정보 수정 뷰 이동
		@RequestMapping("memberUpView.mp")
		public String updateFormView(@ModelAttribute StudyCategory sc, Model model) {
			Member loginUser = (Member)model.getAttribute("loginUser"); // 로그인한 회원정보
			String loginUserId = loginUser.getId(); // 로그인한 회원의 아이디
			
			ArrayList<Preview> loginUserList = mpService.getStudyList(loginUserId); // 로그인한 회원의 공부 정보
			ArrayList<StudyCategory> sList = mpService.selectStudyCategoryList(sc); // 공부 카테고리
			if(sList != null) {
				model.addAttribute("sList", sList);
			}
			
			model.addAttribute("loginUserList", loginUserList);
	
			return "/myPage/memberUpView";
		}
		
		// 회원정보 수정
		// 회원가입(int[] chkSname 공부 과목 번호, int[] etcSno 기타 과목 번호, String[] t 공부 했던 기간, String[] etcSname 기타 과목 중 사용자가 직접 입력한 항목)
		@RequestMapping("memberUp.mp")
		public String updateMember(@ModelAttribute Member m, @RequestParam("studyGroupChk") int[] chkSname, @RequestParam("studyEtcNo") int[] etcSno, 
				   				   @RequestParam("studyEtcName") String[] etcSname, @RequestParam("term") String[] t, Model model) {
			
		System.out.println("controller : " + m);
		// 체크된 과목과 기간을 Preview pList에 담기
			
		ArrayList<Preview> pList = new ArrayList<Preview>();
				
		for(int i = 0; i < chkSname.length; i++) {
			Preview p = new Preview();
				
			p.setStudyNo(chkSname[i]); // 공부 과목 번호 크기만큼
				
			for(int j = 0; j <= i; j++) {
				p.setSpTerm(t[j]); // 기간 설정하기
			}
			pList.add(p);
		}
			
			
		// 기타에 추가된 과목과 기간을 Preview pList에 담기
		for(int i = 0; i < etcSname.length; i++) {
			Preview p = new Preview();
			
			p.setStudyNo(etcSno[i]);
			p.setStudyEtc(etcSname[i]);
			
			for(int j = 0; j <= i; j++) {
				p.setSpTerm(t[j]);
			}
			pList.add(p);
		}
		
		int result = mpService.updateMember(m, pList);
		
		if(result > 0) {
			model.addAttribute("loginUser", m);
			return "/myPage/myPage";
		} else {
			throw new MyPageException("회원 정보 수정에 실패했습니다.");
		}
	}
	
}
