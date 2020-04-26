package com.kh.cosmos.c_myPage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.f_studyGroup.model.vo.StudyGroupApproach;

public interface MyGroupService {

	int getMemberListCount(HashMap<Integer, String> map);

	int getBossListCount(HashMap<Integer, String> map);

	ArrayList<StudyGroupApproach> getGroupList(HashMap<Integer, String> map, PageInfo pi);

	ArrayList<StudyGroupApproach> getAttendGroupList(String userId, PageInfo pi);

}
