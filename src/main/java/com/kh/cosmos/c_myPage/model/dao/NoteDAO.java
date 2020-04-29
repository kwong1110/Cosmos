package com.kh.cosmos.c_myPage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.c_myPage.model.vo.Note;

@Repository("nDAO")
public class NoteDAO {

	/*public int noteChatSubmit(SqlSessionTemplate sqlSession, Note n) {
		return sqlSession.insert("noteMapper.noteChatSubmit", n);
	}*/

	public ArrayList<Note> noteList(SqlSessionTemplate sqlSession, Note n) {
		return (ArrayList)sqlSession.selectList("noteMapper.noteList", n);
	}

}
