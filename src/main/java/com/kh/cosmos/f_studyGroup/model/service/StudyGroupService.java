package com.kh.cosmos.f_studyGroup.model.service;

import java.util.ArrayList;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.f_studyGroup.model.vo.StudyGroup;
import com.kh.cosmos.f_studyGroup.model.vo.StudyGroupRecruit;
import com.kh.cosmos.f_studyGroup.model.vo.StudyRecruit;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

public interface StudyGroupService {

	ArrayList getStudyList();

	ArrayList<ViewBranch> getBranchList();

	int insertGroup(StudyGroup sg);

	int insertRecruit(StudyRecruit sr);

	ArrayList<StudyGroup> getStudyGroupList(String id);

	StudyGroupRecruit getStudyGroupRecruit(int sgno);

	StudyGroupRecruit getGroupInfoForRec(int sgno);

	int getPartMemberNum(int sgno);

	int getIngRecCount(int sgno);

	ArrayList<StudyGroupRecruit> getRecList(PageInfo pi);

	int getRecCompleteNum(int recNo);

	int getRecListCount();

	StudyGroup getStudyGroupInfo(int sgno);
	
}
