package com.kh.cosmos.c_myPage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.Pagination_three;
import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.c_myPage.model.exception.MyPageException;
import com.kh.cosmos.c_myPage.model.service.NoteService;
import com.kh.cosmos.c_myPage.model.vo.Note;
import com.kh.cosmos.c_myPage.model.vo.SearchCondition;


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
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		PageInfo pi = Pagination_three.getPageInfo(currentPage, listCount);
		
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
	
	// 쪽지 보내기 뷰1(@RequestParam("noteToId") : 받는 사람이 있을 떄
	@RequestMapping("noteInsertView1.mp")
	public ModelAndView noteInsertView(@RequestParam("toNick") String toNick, ModelAndView mv) {
		
		mv.addObject("toNick", toNick);
		mv.setViewName("/messageBox/noteInsert");
		
		return mv;
	}
	
	// 쪽지 보내기 뷰(@RequestParam("noteToId") : 받는 사람이 없을 때
	@RequestMapping("noteInsertView.mp")
	public ModelAndView noteInsertView(ModelAndView mv) {
		mv.setViewName("/messageBox/noteInsert");
		
		return mv;
	}
	
	// 쪽지 보내기
	@RequestMapping("noteInsert.mp")
	public String noteInsert(@ModelAttribute Note n, @RequestParam("toNick") String toNick, RedirectAttributes ra, HttpSession session) {
		
		if(toNick != null) {
			Member toM = nService.selectMatchId(toNick);
			String noteToId = toM.getId();
			n.setNoteToId(noteToId);
		}
		
		/*
		 * String noteToId = nService.selectMatchId(toNick);
		 * 이렇게 했더니 Casting Error
		 * mapper에서 resultType="String"으로 하거나 
		 * 이렇게 하는 방식으로 오류 해결
		 * 
		 * */
		
		int result = nService.insertNote(n);
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String loginUserId = loginUser.getId();
		
		if(result > 0) {
			
			ra.addFlashAttribute("successMsg",  "쪽지 보내기에 성공");
			ra.addAttribute("userId", loginUserId);
			
			return "redirect:noteList.mp";
		} else {
			throw new MyPageException("쪽지 보내기를 실패하였습니다.");
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
	
	// 쪽지 목록에서 쪽지 삭제
	@RequestMapping("noteDelete2.mp")
	public String noteDelete(@RequestParam(value="noteNos", required=false) int noteNos[], RedirectAttributes ra, HttpSession session) {
		
		int result = 0;
		
		if(noteNos != null) {
			for(int i = 0; i<noteNos.length; i++) {
				result = nService.deleteNote(noteNos[i]);
			}
		} 
		
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
	
	// 쪽지 목록에서 쪽지 보관함으로 이동
	@RequestMapping("noteStorage2.mp")
	public String noteStorage(@RequestParam(value="noteNos", required=false) int noteNos[], RedirectAttributes ra, HttpSession session) {
		
		int result = 0;
		
		if(noteNos != null) {
			for(int i = 0; i<noteNos.length; i++) {
				result = nService.storeNote(noteNos[i]);
			}
		} 
		
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
	public ModelAndView noteStorageList(@RequestParam(value="page", required=false) Integer page, 
										@RequestParam("userId") String userId, ModelAndView mv) { 
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = nService.getStoreListCount(userId);
		
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		PageInfo pi = Pagination_three.getPageInfo(currentPage, listCount);
		
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
	
	// 검색
	@RequestMapping("search.mp")
	public ModelAndView noteSearch(@RequestParam(value="page", required=false) Integer page, 
								   @ModelAttribute SearchCondition search, @RequestParam("searchCondition") String condition, 
								   @RequestParam("searchValue") String value, ModelAndView mv) {
		
		
		if(condition.equals("id")) {
			search.setId(value);
		} else if(condition.equals("nick")) {
			search.setNick(value);
		} else if(condition.equals("content")) {
			search.setContent(value);
		} 
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = nService.getSearchResultListCount(search);
		
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		PageInfo pi = Pagination_three.getPageInfo(currentPage, listCount);
		ArrayList<Note> nList = nService.selectSearchResultList(pi, search);
		
		if(nList != null) {
			mv.addObject("nList", nList)
			  .addObject("pi", pi)
			  .addObject("searchValue", value)
			  .addObject("searchCondition", search)
			  .setViewName("/messageBox/noteList");
		} else {
			throw new MyPageException("검색에 실패하였습니다.");
		}
		
		return mv;
	}
	
	
	// 보관함검색
		@RequestMapping("searchStore.mp")
		public ModelAndView noteStoreSearch(@RequestParam(value="page", required=false) Integer page, 
									   @ModelAttribute SearchCondition search, @RequestParam("searchCondition") String condition, 
									   @RequestParam("searchValue") String value, ModelAndView mv) {
			
			if(condition.equals("id")) {
				search.setId(value);
			} else if(condition.equals("nick")) {
				search.setNick(value);
			} else if(condition.equals("content")) {
				search.setContent(value);
			} 
			
			int currentPage = 1;
			if(page != null) {
				currentPage = page;
			}
			
			int listCount = nService.getStoreSearchResultListCount(search);
			
//			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			PageInfo pi = Pagination_three.getPageInfo(currentPage, listCount);
			ArrayList<Note> nList = nService.selectStoreSearchResultList(pi, search);
			
			if(nList != null) {
				mv.addObject("nList", nList)
				  .addObject("pi", pi)
				  .addObject("searchValue", value)
				  .addObject("searchCondition", search)
				  .setViewName("/messageBox/noteStoreList");
			} else {
				throw new MyPageException("검색에 실패하였습니다.");
			}
			
			return mv;
		}
	
	
	// 분류
	@RequestMapping("noteMenu.mp")
	public ModelAndView noteMenu(@RequestParam(value="page", required=false) Integer page, 
								 @RequestParam("menuCondition") String menu, @RequestParam("userId") String userId, ModelAndView mv) {
		
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = 0;
		ArrayList<Note> nList = null;
		PageInfo pi = null;
		
		if(menu.equals("to")) { // 받은 쪽지
			
			listCount = nService.getMenuToListCount(userId);
			pi = Pagination_three.getPageInfo(currentPage, listCount);
			nList = nService.selectMenuToList(pi, userId);
			
		} else if (menu.equals("from")) { // 보낸 쪽지
			
			listCount = nService.getMenuFromListCount(userId);
			pi = Pagination_three.getPageInfo(currentPage, listCount);
			nList = nService.selectMenuFromList(pi, userId);
			
		} else if (menu.equals("tome")) { // 내게 보낸 쪽지
			
			listCount = nService.getMenuToMeListCount(userId);
			pi = Pagination_three.getPageInfo(currentPage, listCount);
			nList = nService.selectMenuToMeList(pi, userId);
			
		} else if (menu.equals("total")) { // 전체 쪽지
			
			listCount = nService.getListCount(userId);
			pi = Pagination_three.getPageInfo(currentPage, listCount);
			nList = nService.selectList(pi, userId);
			
		} else if(menu.equals("storage")) { // 보관함에 있는 쪽지
			
			listCount = nService.getStoreListCount(userId);
			pi = Pagination_three.getPageInfo(currentPage, listCount);
			nList = nService.selectStoreList(pi, userId);
		}
		
		if(nList != null) {
			mv.addObject("nList", nList)
			  .addObject("pi", pi)
			  .addObject("menuCondition", menu)
			  .setViewName("/messageBox/noteList");
		} else {
			throw new MyPageException("검색에 실패하였습니다.");
		}
		
		return mv;
	}
	
	
	// 보관함 분류
		@RequestMapping("noteMenuStore.mp")
		public ModelAndView noteStoreMenu(@RequestParam(value="page", required=false) Integer page, 
									 @RequestParam("menuCondition") String menu, @RequestParam("userId") String userId, ModelAndView mv) {
			
			
			int currentPage = 1;
			if(page != null) {
				currentPage = page;
			}
			
			int listCount = 0;
			ArrayList<Note> nList = null;
			PageInfo pi = null;
			
			if(menu.equals("to")) { // 보관함 받은 쪽지
				
				listCount = nService.getStoreMenuToListCount(userId);
				pi = Pagination_three.getPageInfo(currentPage, listCount);
				nList = nService.selectStoreMenuToList(pi, userId);
				
			} else if (menu.equals("from")) { // 보관함 보낸 쪽지
				
				listCount = nService.getStoreMenuFromListCount(userId);
				pi = Pagination_three.getPageInfo(currentPage, listCount);
				nList = nService.selectStoreMenuFromList(pi, userId);
				
			} else if (menu.equals("tome")) { // 보관함 내게 보낸 쪽지
				
				listCount = nService.getStoreMenuToMeListCount(userId);
				pi = Pagination_three.getPageInfo(currentPage, listCount);
				nList = nService.selectStoreMenuToMeList(pi, userId);
				
			} else if (menu.equals("total")) { // 보관함 전체 쪽지
				
				listCount = nService.getStoreListCount(userId);
				pi = Pagination_three.getPageInfo(currentPage, listCount);
				nList = nService.selectStoreList(pi, userId);
				
			} 
			
			if(nList != null) {
				mv.addObject("nList", nList)
				  .addObject("pi", pi)
				  .addObject("menuCondition", menu)
				  .setViewName("/messageBox/noteStoreList");
			} else {
				throw new MyPageException("검색에 실패하였습니다.");
			}
			
			return mv;
		}
	
}
