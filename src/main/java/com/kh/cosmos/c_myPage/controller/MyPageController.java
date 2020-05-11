package com.kh.cosmos.c_myPage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.b_member.model.service.MemberService;
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
	
	@Autowired
	private MemberService mService;
	
	// 마이페이지 이동
	@RequestMapping("myPage.mp")
	public String myPage(@ModelAttribute Member m, Model model) {
		
		System.out.println("myPage : " + m);
		
		Member loginUser = (Member)model.getAttribute("loginUser");
		String loginUserId = loginUser.getId();
		
		ArrayList<Preview> pList = mpService.getStudyList(loginUserId);
		
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
	public ModelAndView updateMember(@ModelAttribute Member m, 
							   @RequestParam("studyGroupChk") int[] chkSname, @RequestParam(value="studyEtcNo", required=false) int[] etcSno, 
							   @RequestParam("term") String[] t, @RequestParam(value="etcTerm", required=false) String[] etcT,
							   @RequestParam(value="studyEtcName", required=false) String[] etcSname, 
							   HttpSession session, RedirectAttributes ra, ModelAndView mv, Model model) {
		
		// System.out.println("controller : " + m);
		
		// 체크된 과목과 기간을 Preview pList에 담기
		ArrayList<Preview> pList = new ArrayList<Preview>();
		
		
		// 기타가 아닌 경우
		for(int i = 0; i < t.length; i++) {
			
			Preview p = new Preview();
			p.setId(m.getId());
			
			p.setStudyNo(chkSname[i]);
			p.setSpTerm(t[i]);
				
			pList.add(p);
		}
			
			
		// 기타의 경우
		if(etcT != null)
			
			for(int i = 0; i < etcT.length; i++) {
				
				Preview p = new Preview();
				p.setId(m.getId());
				
				p.setStudyNo(etcSno[i]);
				p.setStudyEtc(etcSname[i]);
				p.setSpTerm(etcT[i]);
			
				pList.add(p);
		}
		
		// System.out.println("마지막 전송 전 확인 : " + pList);
		
		int result = mpService.updateMember(m, pList);
		
		Member updateloginUser = mService.memberLogin(m);
		
		if(result > 0) {

			model.addAttribute("loginUser", updateloginUser);
			System.out.println("memberUp : " + m);
			ra.addFlashAttribute("successMsg",  "회원 수정");
			mv.setViewName("redirect:myPage.mp");
			
		} else {
			throw new MyPageException("회원 정보 수정에 실패했습니다.");
		}
		
		return mv;
	}
	
	// 회원탈퇴
	@RequestMapping("memberDelete.mp")
	public String deleteMember(SessionStatus status, RedirectAttributes ra, Model model) {
		
		Member loginUser = (Member)model.getAttribute("loginUser");
		String loginUserId = loginUser.getId();
		
		int result  = mpService.deleteMember(loginUserId);
		
		if(result > 0 ) {
			
			ra.addFlashAttribute("successMsg",  "회원 탈퇴");
			status.setComplete();
			return "redirect:/";
			
		} else {
			throw new MyPageException("회원 탈퇴에 실패하였습니다.");
		}
	}
	
}
