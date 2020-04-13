package com.kh.cosmos.b_member.controller;

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

import com.kh.cosmos.b_member.model.exception.MemberException;
import com.kh.cosmos.b_member.model.service.MemberService;
import com.kh.cosmos.b_member.model.vo.Member;

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
	
	// 회원가입 페이지 이동
	@RequestMapping("enroll.me")
	public String enroll() {
		return "memberInsertForm";
	}
	
	// 아이디 비밀번호 찾기 페이지 이동
	@RequestMapping("find.me")
	public String find() {
		return "FindIdPwd";
		
	}
  
	@RequestMapping("minsert.me")
	public String memberInsert(@ModelAttribute Member m, Model model) {
		System.out.println(m);
//		certifyNum
//		certifyStatus : 인증상태

		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
		m.setPwd(encPwd);
	
		int result = mService.insertMember(m);
		Member loginUser = mService.memberLogin(m);
		
		if(result > 0) {
			int success = 1;
			
			model.addAttribute("msg", "회원가입에 성공했습니다.");
			model.addAttribute("success",  success);
			return "redirect:/";
			
		} else {
			throw new MemberException("회원가입에 실패하였습니다.");
		}
		
	}
}
