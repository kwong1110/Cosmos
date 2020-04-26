package com.kh.cosmos.f_studyGroup.model.service;

import java.util.ArrayList;

import com.kh.cosmos.f_studyGroup.model.vo.StudyGroup;
import com.kh.cosmos.f_studyGroup.model.vo.StudyRecruit;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

public interface StudyGroupService {

	ArrayList getStudyList();

	ArrayList<ViewBranch> getBranchList();

	int insertGroup(StudyGroup sg);

	int insertRecruit(StudyRecruit sr);

	ArrayList<StudyGroup> getStudyGroupList(String id);
	
}
