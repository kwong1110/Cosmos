package com.kh.cosmos.f_studyGroup.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.b_member.model.vo.Preview;
import com.kh.cosmos.f_studyGroup.model.vo.ApproachGroup;
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

	String getSgStatus(int sgno);

	StudyGroupRecruit getRecDetail(int sgno, int ingRecCount, String sgStatus);
	
	int getApproachStatus(HashMap<String, String> map);

	int insertApp(HashMap<String, String> map);

	ArrayList<ApproachGroup> getAppList(int recno);

	ArrayList<Preview> getAppUserInfo(String id);

	HashMap<String, Integer> confirmApproach(HashMap<String, String> map);

	ArrayList<StudyGroup> getIngStudyGroupList(String id);

	int getHomeListCount();

	ArrayList<String> getMemList(int group);

	int updateOnceGroup(StudyGroup sg);

	String getUserId(String nick);

	int deleteGroup(int sgno);

	int getRecNo(int sgno);

	int updateMsgCount(int group);
	
}
