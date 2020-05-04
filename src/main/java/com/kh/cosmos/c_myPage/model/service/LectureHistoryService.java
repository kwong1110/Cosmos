package com.kh.cosmos.c_myPage.model.service;

import java.util.ArrayList;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.i_lecture.model.vo.Lecture;

public interface LectureHistoryService {

	ArrayList<Lecture> selectList(PageInfo pi, String loginUserId);

	int getListCount(String loginUserId);

}
