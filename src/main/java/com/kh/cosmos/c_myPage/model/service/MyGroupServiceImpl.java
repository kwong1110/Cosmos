package com.kh.cosmos.c_myPage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.c_myPage.model.dao.MyGroupDAO;
import com.kh.cosmos.f_studyGroup.model.vo.MyStudyGroup;

@Service("mgService")
public class MyGroupServiceImpl implements MyGroupService {

	@Autowired
	private MyGroupDAO mgDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getMemberListCount(HashMap<String, String> map) {
		return mgDAO.getMemberListCount(sqlSession, map);
	}

	@Override
	public int getBossListCount(HashMap<String, String> map) {
		return mgDAO.getBossListCount(sqlSession, map);
	}

	@Override
	public ArrayList<MyStudyGroup> getGroupList(HashMap<String, String> map, PageInfo pi) {
		return mgDAO.getGroupList(sqlSession, map, pi);
	}

	@Override
	public ArrayList<MyStudyGroup> getMemberList(int sgno) {
		return mgDAO.getMemberList(sqlSession, sgno);
	}

	@Override
	public int deleteMember(HashMap<String, String> map) {
		return mgDAO.deleteMember(sqlSession, map);
	}

	@Override
	public ArrayList<MyStudyGroup> getRecList(int sgno) {
		return mgDAO.getRecList(sqlSession, sgno);
	}

	@Override
	public int closeRecruit(int recno) {
		return mgDAO.closeRecruit(sqlSession, recno);
	}

}
