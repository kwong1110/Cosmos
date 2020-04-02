package com.kh.cosmos.c_myPage.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.c_myPage.model.dao.NoteDAO;

@Service("nService")
public class NoteServiceImpl implements NoteService {

	@Autowired
	private NoteDAO nDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}
