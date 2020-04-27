package com.kh.cosmos.b_member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cosmos.b_member.model.exception.MemberException;
import com.kh.cosmos.b_member.model.service.MemberService;
import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.b_member.model.vo.Preview;
import com.kh.cosmos.b_member.model.vo.StudyCategory;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// 암호화 후 로그인
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public String memberLogin(Member m, Model model) {
		
		Member loginUser = mService.memberLogin(m);
		// 비밀번호에 암호화가 된 상태의 loginUser 반환
		if(loginUser == null) {
			model.addAttribute("msg", "아이디가 존재하지않습니다! 다시 로그인해주세요!");
		} else {
			if(bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
				model.addAttribute("loginUser", loginUser);
			} else if(!bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
				model.addAttribute("msg", "비밀번호가 일치하지 않습니다! 다시 로그인해주세요!");
			} else {
				throw new MemberException("로그인에 실패하였습니다.");
			}
		}
		
		return "redirect:/";
	}
	
	// 로그 아웃
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		status.setComplete();
		
		return "redirect:/";
	}
	
	// 이용약관 페이지 이동
	@RequestMapping("agree.me")
	public String agree() {
		return "memberAgree";
	}
	
	// 회원가입 뷰 페이지 이동
	@RequestMapping("enroll.me")
	public String enroll(@ModelAttribute StudyCategory sc, Model model) {
		
		// 공부 카테고리(StudyCategory) 에서 공부 목록 받아와서 view 에 뿌리기
		ArrayList<StudyCategory> sList = mService.selectStudyCategoryList(sc);
		if(sList != null) {
			model.addAttribute("sList", sList);
		}
		
		return "memberInsertForm";
	}
	
	// 아이디 비밀번호 찾기 페이지 이동_한솔
	@RequestMapping("find.me")
	public String find() {
		return "FindIdPwd";
	}
  
	// 아이디찾기_한솔 
	@RequestMapping("findId.me")
	   public ModelAndView findMemberId(@ModelAttribute Member m, ModelAndView mv) {
		
	      Member result = mService.findMemberId(m);
	      
	      if(result != null) {
	         mv.addObject("findId", result)
	         .addObject("name", m.getName())
	         .addObject("email", m.getEmail());
	      }else {
	         throw new MemberException("정보와 일치하는 아이디가 없습니다.");
	      }
	      return mv;
	   }
	
	
	// 비밀번호 찾기_한솔
	@RequestMapping("findPwd.me")
	public String findPwd() {
		
		
		return "FindPwd";
	}
	
	// 회원가입(int[] chkSname 공부 과목, int[] etcSno 기타 과목 번호, String[] t 공부 했던 기간, String[] etcSname 기타 과목 중 사용자가 직접 입력한 항목)
	@RequestMapping("minsert.me")
	public String memberInsert(@ModelAttribute Member m, 
							   @RequestParam("studyGroupChk") int[] chkSname, @RequestParam("studyEtcNo") int[] etcSno, 
							   @RequestParam("term") String[] t, @RequestParam("studyEtcName") String[] etcSname, Model model) {
		
//		certifyNum
//		certifyStatus : 인증상태

		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
		m.setPwd(encPwd);
		
		// 체크된 과목과 기간을 Preview pList에 담기
		ArrayList<Preview> pList = new ArrayList<Preview>();
		for(int i = 0; i < chkSname.length; i++) {
			Preview p = new Preview();
			
			p.setId(m.getId());
			p.setStudyNo(chkSname[i]);
			
			for(int j = 0; j <= i; j++) {
				p.setSpTerm(t[j]);
			}
			pList.add(p);
		}
		
		// 기타에 추가된 과목과 기간을 Preview pList에 담기
		for(int i = 0; i < etcSname.length; i++) {
			Preview p = new Preview();
			
			p.setId(m.getId());
			p.setStudyNo(etcSno[i]);
			p.setStudyEtc(etcSname[i]);
			
			for(int j = 0; j <= i; j++) {
				p.setSpTerm(t[j]);
			}
			pList.add(p);
		}
		
		int result = mService.insertMember(m, pList);
		/*Member loginUser = mService.memberLogin(m);*/
		
		if(result > 0) {
			int success = 1;
			
			model.addAttribute("msg", "회원가입에 성공했습니다.");
			model.addAttribute("success",  success);
			return "redirect:/";
			
		} else {
			throw new MemberException("회원가입에 실패하였습니다.");
		}
	}
	
	// 아이디 중복 체크
	@RequestMapping("dupId.me")
	public void idDuplicateCheck(HttpServletResponse response, @RequestParam("id") String id) throws IOException {
		boolean isIdUsable = mService.checkIdDup(id) == 0 ? true : false;
		response.getWriter().print(isIdUsable);
	}
	
	// 닉네임 중복 체크
	@RequestMapping("dupNick.me")
	public void pwdDuplicateCheck(HttpServletResponse response, @RequestParam("nick") String nick) throws IOException {
		boolean isNickUsable = mService.checkNickDup(nick) == 0 ? true : false;
		response.getWriter().print(isNickUsable);
	}
	

	
	
}
