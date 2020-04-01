package com.kh.cosmos.c_myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.cosmos.c_myPage.model.service.NoteService;

@Controller
public class NoteController {

	@Autowired
	private NoteService nService;
}
