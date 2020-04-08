package com.kh.cosmos.i_lecture.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.cosmos.i_lecture.model.exception.LectureException;
import com.kh.cosmos.i_lecture.model.service.LectureService;
import com.kh.cosmos.i_lecture.model.vo.Lecture;

@Controller
public class LectureController {

	@Autowired
	private LectureService lService;
	
	@RequestMapping("lectureCalendar.le")
	public String lectureCalendar(Model model) {
		
		ArrayList<Lecture> list = lService.selectList();
		System.out.println("list확인 : " + list);
		
		if(list != null) {
			for (int i = 0; i < list.size(); i++) {
				Lecture l = (Lecture)list.get(i);
				System.out.println(l.getLectureDate() + l.getLectureTitle());
			}
			model.addAttribute("list", list);
			return "lectureCalendar";
		} else {
			throw new LectureException("강연 전체 조회에 실패하였습니다.");
		}
	}
}
