package com.kh.cosmos.c_myPage.model.service;

import java.util.ArrayList;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.c_myPage.model.vo.Note;
import com.kh.cosmos.c_myPage.model.vo.SearchCondition;

public interface NoteService {

	int getListCount(String userId);

	ArrayList<Note> selectList(PageInfo pi, String userId);

	Member selectMatchId(String toNick);
	
	int insertNote(Note n);

	Note selectNote(int noteNo);

	int deleteNote(int noteNo);

	int storeNote(int noteNo);

	int getStoreListCount(String userId);

	ArrayList<Note> selectStoreList(PageInfo pi, String userId);

//------------------------------------------------------------------------	
	/*int getSearchResultListCount(SearchCondition search);*/

	/*ArrayList<Note> selectSearchResultList(PageInfo pi, SearchCondition search);*/

	int getSearchResultListCount(SearchCondition search, String userId);

	ArrayList<Note> selectSearchResultList(PageInfo pi, SearchCondition search, String userId);
//------------------------------------------------------------------------

	int getMenuToListCount(String userId);

	ArrayList<Note> selectMenuToList(PageInfo pi, String userId);

	int getMenuFromListCount(String userId);

	ArrayList<Note> selectMenuFromList(PageInfo pi, String userId);

	int getMenuToMeListCount(String userId);

	ArrayList<Note> selectMenuToMeList(PageInfo pi, String userId);

}
