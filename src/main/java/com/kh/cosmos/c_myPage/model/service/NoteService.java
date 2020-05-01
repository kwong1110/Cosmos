package com.kh.cosmos.c_myPage.model.service;

import java.util.ArrayList;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.c_myPage.model.vo.Note;

public interface NoteService {

	int getListCount(String userId);

	ArrayList<Note> selectList(PageInfo pi, String userId);

	int insertNote(Note n);

	Note selectNote(int noteNo);

	int deleteNote(int noteNo);

	int storeNote(int noteNo);

	int getStoreListCount(String userId);

	ArrayList<Note> selectStoreList(PageInfo pi, String userId);

}
