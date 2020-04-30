package com.kh.cosmos.f_studyGroup.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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

	ArrayList<StudyGroupRecruit> getRecList(HashMap<String, String> map, PageInfo pi);

	int getRecCompleteNum(int recNo);

	int getRecListCount(HashMap<String, String> map);

	StudyGroup getStudyGroupInfo(int sgno);

	int updateGroup(StudyGroup sg);

	int insertMultiGroup(StudyGroup sg);

	int updateMultiGroup(StudyGroup sg);

	int getMsgNum(int sgNo);
	
}
