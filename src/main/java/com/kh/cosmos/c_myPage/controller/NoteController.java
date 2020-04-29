package com.kh.cosmos.c_myPage.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.c_myPage.model.service.NoteService;
import com.kh.cosmos.c_myPage.model.vo.Note;

@Controller
public class NoteController {

	@Autowired
	private NoteService nService;
	
	// 쪽지 리스트
	@RequestMapping("noteList.mp")
	public ModelAndView noteList(@ModelAttribute Member m, @ModelAttribute Note n, ModelAndView mv) {
		
		System.out.println("n : " + n);
		System.out.println("m : " + m);

		// noteChatList(String noteFromId, String noteToId, String noteNo)
		ArrayList<Note> noteList = nService.noteList(n);
		
		
		mv.setViewName("");
	
		return mv;
	}
	
	// 쪽지 보내기
	@RequestMapping("noteInsert.mp")
	public String noteInsert() {
		int success = 2;
		
		return "redirect:/";
	}
	
	// 받은 쪽지
	@RequestMapping("noteDetail.mp")
	public String noteDetail() {
		int success = 3;
		
		return "redirect:/";
	}
	
	
	
	
	
	
	
	
	
	
}
