package com.kh.cosmos.c_myPage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.c_myPage.model.dao.NoteDAO;
import com.kh.cosmos.c_myPage.model.vo.Note;

@Service("nService")
public class NoteServiceImpl implements NoteService {

	@Autowired
	private NoteDAO nDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Note> noteList(Note n) {
		return nDAO.noteList(sqlSession, n);
	}

	/*@Override
	public int noteChatSubmit(Note n) {
		return nDAO.noteChatSubmit(sqlSession, n);
	}
	*/
}
