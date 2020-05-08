package com.kh.cosmos.c_myPage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.c_myPage.model.dao.NoteDAO;
import com.kh.cosmos.c_myPage.model.vo.Note;
import com.kh.cosmos.c_myPage.model.vo.SearchCondition;

@Service("nService")
public class NoteServiceImpl implements NoteService {

	@Autowired
	private NoteDAO nDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount(String userId) {
		return nDAO.getListCount(sqlSession, userId);
	}

	@Override
	public ArrayList<Note> selectList(PageInfo pi, String userId) {
		return nDAO.selectList(sqlSession, pi, userId);
	}

	public Member selectMatchId(String toNick) {
		return nDAO.selectMatchId(sqlSession, toNick);
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

	@Override
	public int getStoreListCount(String userId) {
		return nDAO.getStoreListCount(sqlSession, userId);
	}

	@Override
	public ArrayList<Note> selectStoreList(PageInfo pi, String userId) {
		return nDAO.selectStoreList(sqlSession, pi, userId);
	}
	
	
	@Override
	public int getSearchResultListCount(SearchCondition search) {
		return nDAO.getSearchResultCount(sqlSession, search);
	}

	@Override
	public ArrayList<Note> selectSearchResultList(PageInfo pi, SearchCondition search) {
		return nDAO.selectSearchResultList(sqlSession, pi, search);
	}
	
	@Override
	public int getMenuToListCount(String userId) {
		return nDAO.getMenuToListCount(sqlSession, userId);
	}

	@Override
	public ArrayList<Note> selectMenuToList(PageInfo pi, String userId) {
		return nDAO.selectMenuToList(sqlSession, pi, userId);
	}

	@Override
	public int getMenuFromListCount(String userId) {
		return nDAO.getMenuFromListCount(sqlSession, userId);
	}

	@Override
	public ArrayList<Note> selectMenuFromList(PageInfo pi, String userId) {
		return nDAO.selectMenuFromList(sqlSession, pi, userId);
	}

	@Override
	public int getMenuToMeListCount(String userId) {
		return nDAO.getMenuToMeListCount(sqlSession, userId);
	}

	@Override
	public ArrayList<Note> selectMenuToMeList(PageInfo pi, String userId) {
		return nDAO.selectMenuToMeList(sqlSession, pi, userId);
	}

	@Override
	public int getStoreSearchResultListCount(SearchCondition search) {
		return nDAO.getStoreSearchResultCount(sqlSession, search);
	}

	@Override
	public ArrayList<Note> selectStoreSearchResultList(PageInfo pi, SearchCondition search) {
		return nDAO.selectStoreSearchResultList(sqlSession, pi, search);
	}

	@Override
	public int getStoreMenuToListCount(String userId) {
		return nDAO.getStoreMenuToListCount(sqlSession, userId);
	}

	@Override
	public ArrayList<Note> selectStoreMenuToList(PageInfo pi, String userId) {
		return nDAO.selectStoreMenuToList(sqlSession, pi, userId);
	}

	@Override
	public int getStoreMenuFromListCount(String userId) {
		return nDAO.getStoreMenuFromListCount(sqlSession, userId);
	}

	@Override
	public ArrayList<Note> selectStoreMenuFromList(PageInfo pi, String userId) {
		return nDAO.selectStoreMenuFromList(sqlSession, pi, userId);
	}

	@Override
	public int getStoreMenuToMeListCount(String userId) {
		return nDAO.getStoreMenuToMeListCount(sqlSession, userId);
	}

	@Override
	public ArrayList<Note> selectStoreMenuToMeList(PageInfo pi, String userId) {
		return nDAO.selectStoreMenuToMeList(sqlSession, pi, userId);
	}

}
