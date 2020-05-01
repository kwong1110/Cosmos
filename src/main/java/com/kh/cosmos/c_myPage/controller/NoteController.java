package com.kh.cosmos.c_myPage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.Pagination;
import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.c_myPage.model.exception.MyPageException;
import com.kh.cosmos.c_myPage.model.service.NoteService;
import com.kh.cosmos.c_myPage.model.vo.Note;


@SessionAttributes("loginUser")
@Controller
public class NoteController {

	@Autowired
	private NoteService nService;
		
	// 쪽지 리스트
	@RequestMapping("noteList.mp")
	public ModelAndView noteList(@RequestParam(value="page", required=false) Integer page, @RequestParam("userId") String userId, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = nService.getListCount(userId);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Note> nList = nService.selectList(pi, userId);
		
		if(nList != null) {
			mv.addObject("nList", nList);
			mv.addObject("pi", pi);
			mv.setViewName("/messageBox/noteList");
		} else {
			throw new MyPageException("쪽지 전제 조회에 실패하였습니다.");
		}
	
		return mv;
	}
	
	// 쪽지 보내기 뷰(@RequestParam("noteToId") : 받는 사람이 있을 떄
	@RequestMapping("noteInsertView.mp")
	public ModelAndView noteInsertView(@RequestParam("noteToId") String noteToId, ModelAndView mv) {
		
		mv.addObject("noteToId", noteToId);
		mv.setViewName("/messageBox/noteInsert");
		
		return mv;
	}
	
	// 쪽지 보내기 뷰1(@RequestParam("noteToId") : 받는 사람이 없을 때
	@RequestMapping("noteInsertView1.mp")
	public ModelAndView noteInsertView(ModelAndView mv) {
		
		mv.setViewName("/messageBox/noteInsert");
		
		return mv;
	}
	
	// 쪽지 보내기
	@RequestMapping("noteInsert.mp")
	public String noteInsert(@ModelAttribute Note n, RedirectAttributes ra, HttpSession session) {
		
		int result = nService.insertNote(n);
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String loginUserId = loginUser.getId();
		
		if(result > 0) {
			
			ra.addFlashAttribute("successMsg",  "쪽지 보내기에 성공");
			ra.addAttribute("userId", loginUserId);
			
			return "redirect:noteList.mp";
		} else {
			throw new MyPageException("쪽지 입력에 실패하였습니다.");
		}
	}
	
	// 받은 쪽지
	@RequestMapping("noteDetail.mp")
	public ModelAndView noteDetail(@RequestParam("noteNo") int noteNo, @RequestParam("page") int page, ModelAndView mv) {
		
		Note note = nService.selectNote(noteNo);
		
		if(note != null) {
			mv.addObject("note", note)
			  .addObject("page", page)
			  .setViewName("/messageBox/noteView");
		} else {
			throw new MyPageException("쪽지 보기를 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 쪽지 보기 페이지에서 쪽지 삭제
	@RequestMapping("noteDelete.mp")
	public String noteDelete(@RequestParam("noteNo") int noteNo, RedirectAttributes ra, HttpSession session) {
		
		int result = nService.deleteNote(noteNo);
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String loginUserId = loginUser.getId();
		
		if(result > 0) {
			ra.addAttribute("userId", loginUserId);
			return "redirect:noteList.mp";
		} else {
			throw new MyPageException("쪽지 삭제에 실패하였습니다.");
		}
	}
	
	// 쪽지 보기 페이지에서 쪽지 보관함으로 이동
	@RequestMapping("noteStorage.mp")
	public String noteStorage(@RequestParam("noteNo") int noteNo, RedirectAttributes ra, HttpSession session) {
		
		int result = nService.storeNote(noteNo);
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String loginUserId = loginUser.getId();
		
		if(result > 0) {
			
			ra.addFlashAttribute("successMsg", "보관함 보내기에 성공");
			ra.addAttribute("userId", loginUserId);
			
			return "redirect:noteStorageList.mp";
		} else {
			throw new MyPageException("쪽지 보관에 실패하였습니다.");
		}
	}
	
	// 쪽지 보관함 목록
	@RequestMapping("noteStorageList.mp")
	public ModelAndView noteStorageList(@RequestParam(value="page", required=false) Integer page, @RequestParam("userId") String userId, ModelAndView mv) { 
		System.out.println("userId : " + userId);
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = nService.getStoreListCount(userId);
		
		System.out.println("listCount : " + listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Note> nList = nService.selectStoreList(pi, userId);
		
		if(nList != null) {
			mv.addObject("nList", nList)
			  .addObject("pi", pi)
			  .setViewName("/messageBox/noteStoreList");
		} else {
			throw new MyPageException("보관함 목록 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
}
