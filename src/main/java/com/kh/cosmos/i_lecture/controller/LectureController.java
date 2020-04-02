package com.kh.cosmos.i_lecture.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.cosmos.i_lecture.model.service.LectureService;

@Controller
public class LectureController {

	@Autowired
	private LectureService lService;
}
