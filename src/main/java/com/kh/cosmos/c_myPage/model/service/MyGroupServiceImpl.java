package com.kh.cosmos.c_myPage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.c_myPage.model.dao.MyGroupDAO;
import com.kh.cosmos.f_studyGroup.model.vo.StudyGroupApproach;

@Service("mgService")
public class MyGroupServiceImpl implements MyGroupService {

	@Autowired
	private MyGroupDAO mgDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getMemberListCount(HashMap<Integer, String> map) {
		return mgDAO.getMemberListCount(sqlSession, map);
	}

	@Override
	public int getBossListCount(HashMap<Integer, String> map) {
		return mgDAO.getBossListCount(sqlSession, map);
	}

	@Override
	public ArrayList<StudyGroupApproach> getGroupList(HashMap<Integer, String> map, PageInfo pi) {
		return mgDAO.getGroupList(sqlSession, map, pi);
	}

//	@Override
//	public int getAttendMemberListCount(String userId) {
//		return mgDAO.getAttendMemberListCount(sqlSession, userId);
//	}
//
//	@Override
//	public int getAttendBossListCount(String userId) {
//		return mgDAO.getAttendBossListCount(sqlSession, userId);
//	}

	@Override
	public ArrayList<StudyGroupApproach> getAttendGroupList(String userId, PageInfo pi) {
		return mgDAO.getAttendGroupList(sqlSession, userId, pi);
	}
}
