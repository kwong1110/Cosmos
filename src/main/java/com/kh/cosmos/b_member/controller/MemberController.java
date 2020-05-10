package com.kh.cosmos.b_member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String memberLogin(Member m, Model model, RedirectAttributes ra) {
		
		Member loginUser = mService.memberLogin(m);
		// 비밀번호에 암호화가 된 상태의 loginUser 반환
		if(loginUser == null) {
			ra.addFlashAttribute("wrongMsg", "아이디가 존재하지않습니다!");
		} else {
			
			// System.out.println(loginUser.getMstatus());
			if (loginUser.getMstatus().equals("R")) {
		
				ra.addFlashAttribute("wrongMsg","금지된 회원입니다.<br>관리자에게 문의하세요!");
				
				return "redirect:/";
			}
			
			if(bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
				model.addAttribute("loginUser", loginUser);
			} else if(!bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
				ra.addFlashAttribute("wrongMsg", "비밀번호가 일치하지 않습니다!");
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
		      
//			  System.out.println(m);
		    
		      Member result = mService.findMemberId(m);
//		      System.out.println("결과"+result);
//		      System.out.println("mv"+ mv);
		     
		      if(result != null) {
		    	  // 이렇게 하면 삽질함 내가 findMemberId 코드를 돌려서  result에 담아놨는데
		    	  // 계속 m.getName으로 받아오니까 null값이 떠서 조회할 수 없었던것.
		    	  
		         /*mv.addObject("findId", result)
		         .addObject("name", m.getName())
		         .addObject("email", m.getEmail())
		         .addObject("id", m.getId())
		         .setViewName("FindResult");
		          */	 
		    	  
		    	 mv.addObject("id",result.getId())
		    	 /*.setViewName("FindResult");*/
		    	 .setViewName("FindResult");
		      }else {
		         throw new MemberException("정보와 일치하는 아이디가 없습니다.");
		      }
		      return mv;
		   }
	
	
	// 비밀번호 찾기_한솔
		@RequestMapping("findPwd.me")
		public ModelAndView findPwd(@ModelAttribute Member m, ModelAndView mv, @RequestParam("id") String id, @RequestParam("email") String email) {
			
//			System.out.println(m); //m Member 찍어보기
			
			Member member = mService.findMemberPwd(m);
			
//			System.out.println(member);
			if(member != null) {
				
				// 메일 보내기 전에 발송도었따는  넘어갈 수 있으니까 if문 안에다가 메일 보내는 함수를 작성해준다..
				
				String host = "smtp.naver.com";
				final String admin = "mac90004@naver.com";
				final String password = "jhs120206+";
			
				String userEmail = member.getEmail();
				int port = 465;
				Properties props = new Properties();
				props.put("mail.smtp.host", host);
				props.put("mail.smtp.port", port);
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.ssl.enable", "true");
				props.put("mail.smtp.ssl.trust", host);
				
				Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(admin,password);
					}
				});

				try {
					// 이메일 내용 구성
					MimeMessage message = new MimeMessage(session);
					message.setFrom(new InternetAddress(admin));
					message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
					
					//제목
					message.setSubject("▶▶COSMOS◀ ◀ 비밀번호 찾기 결과 이메일입니다.");
					//내용
					
					// --------- 임시 비밀번호 생성 
					// 처음 문자는 영어로
					char pwSet1[] = new char[] {
		                      'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
		                      'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'
					};
					
					char pwSet2[] = new char[] {
							'1','2','3','4','5','6','7','8','9','0',
		                    'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
		                    'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'
					};
					
					int firstRan = (int)(Math.random()*(pwSet1.length));
					char firstPw = pwSet1[firstRan];
					String ranPw = "";
					for(int i = 0; i < 10; i++) {
						int ranIndex = (int)(Math.random()*(pwSet2.length));
						ranPw += pwSet2[ranIndex];
					}
					
					// bcryptPasswordEncoder.encode(m.getPwd());
			
					String lastPw = firstPw + ranPw + "!"; // 비밀번호를 새로 생성해준
					String lastPwd = bcryptPasswordEncoder.encode(lastPw);
					member.setPwd(lastPwd); // 회원비밀번호 임시비밀번호로 변경 lastPwd는  lastPw 를 암호화해서 lastPwd에 담아줬음
					System.out.println("---멤버--- : " + member);
					int result = mService.fakePwd(member);
					
					/*String content ="<h2>안녕하세요  회원님</h2><br><br>" 
							+ "<img alt=\"COSMOS\" src=\"https://postfiles.pstatic.net/MjAyMDA1MDdfMjM3/MDAxNTg4ODEzNjAwMTg5.MgjKkxaAG7HDpa8oCH4hI7x85pWG_kPJewLKFDrozUMg.0SodG8fbenNvDX6hFVf0eATWuRP1Y-2A4zxsByW9ERIg.PNG.dksdud94/KakaoTalk_Moim_9C9pCpO1SP6lkSFs0gz6goaxUjDLrj.png?type=w773\">"
							+ "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>"
							+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + lastPw +"'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
							+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";*/
					/*String content ="";
						content += "<div align='center' sytle='background:#fffcda'>";
						content += "<img src='http://localhost:9280/cosmos/resources/image/FindPwdEmail01.png'>";
						content += "<div sytle='background:#fffcda'><h1>회원님의 임시 비밀번호는" + lastPw + "입니다.</h1></div>"; 			
						content += "<img src='http://localhost:9280/cosmos/resources/image/FindPwdEmail02.png'>";
						content += "</div>";*/
					String content = "<div align='center' sytle='background:#fffcda'>"
									+ "<img src='http://localhost:9280/cosmos/resources/image/FindPwdEmail01.png'>"
									+ "<h2>회원님의 임시 비밀번호는'" + lastPw +"'입니다.</h2>"
									+ "<img src='http://localhost:9280/cosmos/resources/image/FindPwdEmail02.png'>";
					if(result > 0) {
						System.out.println("임시비밀번호로 변경");
					} else {
						System.out.println("임시비밀번호로 변경실패");
					}
					/*message.setText("회원님의 임시비밀번호는 " + lastPw + "입니다.\n 임시비밀번호로 로그인하고 비밀번호를 변경해주세요.");*/
					message.setText(content, "utf-8", "html");
					
					//이메일 보내기
					Transport.send(message);
					System.out.println("성공적으로 메일을 보냈습니다.");
					
				} catch (AddressException e) {
					e.printStackTrace();
				} catch (MessagingException e) {
					e.printStackTrace();
				}
				
				
				String maskEmail = member.getEmail().toString();
				System.out.println("email가져와보기 :" + maskEmail);
				
				String[] emailArr = maskEmail.split("@");
				System.out.println(emailArr[0]);		
								
				String test = emailArr[0].substring(0, emailArr[0].length() - 3);
				System.out.println("test1:" + test);
				
				test = test + "***@" + emailArr[1];
				System.out.println("test2: " + test);
				mv.addObject("email",test)
		    	 .setViewName("FindPwResult");
		      }else {
		         throw new MemberException("정보와 일치하는 아이디가 없습니다.");
		      }
		      return mv;
		   }
	
	// 회원가입(int[] chkSname 공부 과목, int[] etcSno 기타 과목 번호, String[] t 공부 했던 기간, String[] etcSname 기타 과목 중 사용자가 직접 입력한 항목)
	@RequestMapping("minsert.me")
	public String memberInsert(@ModelAttribute Member m, 
							   @RequestParam("studyGroupChk") int[] chkSname, @RequestParam(value="studyEtcNo", required=false) int[] etcSno, 
							   @RequestParam("term") String[] t, @RequestParam(value="etcTerm", required=false) String[] etcT,
							   @RequestParam(value="studyEtcName", required=false) String[] etcSname, Model model) {
		
		
//		System.out.println("배열 존재 확인 : " + etcSno +""+ chkSname +""+ t +""+ etcSname + "" + etcT );
//		System.out.println(m);
		
		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
		m.setPwd(encPwd);
		
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
		if(etcT != null) {
			for(int i = 0; i < etcT.length; i++) {
				
				Preview p = new Preview();
				p.setId(m.getId());
				
				p.setStudyNo(etcSno[i]);
				p.setStudyEtc(etcSname[i]);
				p.setSpTerm(etcT[i]);
				
				pList.add(p);
			}
		}
	
		//System.out.println("마지막 전송 전 확인 : " + pList);
		
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
