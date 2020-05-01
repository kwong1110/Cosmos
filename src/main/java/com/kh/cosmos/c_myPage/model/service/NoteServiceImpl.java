package com.kh.cosmos.c_myPage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.c_myPage.model.dao.NoteDAO;
import com.kh.cosmos.c_myPage.model.vo.Note;

@Service("nService")
public class NoteServiceImpl implements NoteService {

	@Autowired
	private NoteDAO nDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount() {
		return nDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Note> selectList(PageInfo pi) {
		return nDAO.selectList(sqlSession, pi);
	}

	@Override
	public int insertNote(Note n) {
		return nDAO.insertNote(sqlSession, n);
	}

	@Override
	public Note selectNote(int noteNo) {
		return nDAO.selectNote(sqlSession, noteNo);
	}

	@Override
	public int deleteNote(int noteNo) {
		return nDAO.deleteNote(sqlSession, noteNo);
	}

	@Override
	public int storeNote(int noteNo) {
		return nDAO.storeNote(sqlSession, noteNo);
	}


}
