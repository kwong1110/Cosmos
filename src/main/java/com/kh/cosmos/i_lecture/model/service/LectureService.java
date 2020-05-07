package com.kh.cosmos.i_lecture.model.service;

import java.util.ArrayList;

import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;
import com.kh.cosmos.i_lecture.model.vo.Lecture;

public interface LectureService {

	ArrayList<Lecture> selectList();

	ArrayList<ViewBranch> selectBranchList();

	int lectureApply(Lecture l);

	int lectureBuy(Lecture l);

	int lectureAttendPlus(Lecture l);

	ArrayList<Lecture> selectLectureAttendList(String loginUserId);
}
