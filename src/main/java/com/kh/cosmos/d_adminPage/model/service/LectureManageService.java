package com.kh.cosmos.d_adminPage.model.service;

import java.util.ArrayList;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.i_lecture.model.vo.Lecture;

public interface LectureManageService {

	ArrayList<Lecture> lectureManageList(PageInfo pi);

	int getListCount();

	Lecture selectLecture(Integer lNo);

	Member selectLectureUser(Member m);

	int updateLecture(Lecture l);

}
