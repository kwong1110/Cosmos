package com.kh.cosmos.c_myPage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.c_myPage.model.vo.Note;

@Repository("nDAO")
public class NoteDAO {

	public int getListCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("noteMapper.getListCount", userId);
	}

	public ArrayList<Note> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("noteMapper.selectList", userId, rowBounds);
	}

	public int insertNote(SqlSessionTemplate sqlSession, Note n) {
		return sqlSession.insert("noteMapper.insertNote", n);
	}

	public Note selectNote(SqlSessionTemplate sqlSession, int noteNo) {
		return sqlSession.selectOne("noteMapper.selectNote", noteNo);
	}

	public int deleteNote(SqlSessionTemplate sqlSession, int noteNo) {
		return sqlSession.update("noteMapper.deleteNote", noteNo);
	}

	public int storeNote(SqlSessionTemplate sqlSession, int noteNo) {
		return sqlSession.update("noteMapper.storeNote", noteNo);
	}

	public int getStoreListCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("noteMapper.getStoreListCount", userId);
	}

	public ArrayList<Note> selectStoreList(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("noteMapper.selectStoreList", userId, rowBounds);
	}

	


}
