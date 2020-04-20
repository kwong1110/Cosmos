package com.kh.cosmos.c_myPage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.f_studyGroup.model.vo.MyStudyGroup;

public interface MyGroupService {

	int getMemberListCount(HashMap<String, String> map);

	int getBossListCount(HashMap<String, String> map);

	ArrayList<MyStudyGroup> getGroupList(HashMap<String, String> map, PageInfo pi);

	ArrayList<MyStudyGroup> getMemberList(int sgno);

	int deleteMember(HashMap<String, String> map);

	ArrayList<MyStudyGroup> getRecList(int sgno);

}
